package sns.enterprise.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import sns.dao.HolidaysDAO;
import sns.dao.ReserveDAO;
import sns.dao.RestaurantDAO;
import sns.dao.ZipcodeDAO;
import sns.dto.HolidayDTO;
import sns.dto.ReserveDTO;
import sns.dto.RestaurantDTO;
import sns.dto.ZipcodeDTO;

@Controller
public class E_MyPageController {

	@Autowired
	private RestaurantDAO restaurantDao;
	
	public void setRestaurantDao(RestaurantDAO restaurantDao) {
		this.restaurantDao = restaurantDao;
	}

	@Autowired
	private ReserveDAO reserveDao;
	
	public void setReserveDao(ReserveDAO reserveDao) {
		this.reserveDao = reserveDao;
	}

	
	@Autowired
	private ZipcodeDAO zipcodeDao;
	
	public void setZipcodeDao(ZipcodeDAO zipcodeDao) {
		this.zipcodeDao = zipcodeDao;
	}


	
	
	@RequestMapping("/ownerMain.do")
	public String enterpriseForm(){
	
		return "enterprise/enterprise_Main";
		
	}
	
	
	//업주가 예약현황을 보는 것.
	@RequestMapping("/E_Mypage_Reserve.do")
	public ModelAndView mypage_reserve(@RequestParam(value="end_rno", defaultValue="20") String end_rno) {
		
		System.out.println("E_Reserve page");
		
		ModelAndView mav = new ModelAndView("enterprise/E_Mypage_Reserve");
		
		List<ReserveDTO> list = reserveDao.e_getReserveList("0101", end_rno);
		mav.addObject("reserveList", list);
		
		return mav;
	}
	
	
	//업주 회원정보 수정 시 초기 정보를 알려주는 처리
	@RequestMapping("/E_Mypage_EnterInfo.do")
	public ModelAndView mypage_enterInfo() {
		
		ModelAndView mav = new ModelAndView("enterprise/E_Mypage_EnterInfo");
		String e_num = restaurantDao.getE_info("ea1");
		mav.addObject("restaurant_number", e_num);
		return mav;
	}
	
	
	@RequestMapping("/findZipcode.do")
	public ModelAndView findZipcode(@RequestParam(value="area4", defaultValue="a") String area4) {
		
		ModelAndView mav = new ModelAndView("enterprise/findZipcode");
		
		List<ZipcodeDTO> zipCodeList = new ArrayList<ZipcodeDTO>();
		zipCodeList = zipcodeDao.zipcodeRead(area4);
		mav.addObject("zipCodeList", zipCodeList);
		return mav;
	}
	
	
	//업주 회원정보 수정정보 insert처리
	@RequestMapping("/E_insertInfo.do")
	public ModelAndView insertEnterInfo(RestaurantDTO restaurantDto) {
		
		restaurantDao.upload(restaurantDto.getMain_image(), restaurantDto.getE_name());
		restaurantDao.upload(restaurantDto.getDetail_image(), restaurantDto.getE_name());
		restaurantDao.upload(restaurantDto.getMenu_image(), restaurantDto.getE_name());
		restaurantDao.insertEnterInfo(restaurantDto);
		ModelAndView mav = new ModelAndView("enterprise/test");
		mav.addObject("enterDTO", restaurantDto);
		return mav;
	}

	
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	
	
	
	
	
	//휴일처리
	@Autowired
	private HolidaysDAO holidaysDao;
	
	
	public void setHolidaysDao(HolidaysDAO holidaysDao) {
		this.holidaysDao = holidaysDao;
	}

	@RequestMapping(value= "/holidayList.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String ListHoliday(@RequestParam("restaurant_number")String restaurant_number,HttpServletResponse resp){
		resp.setContentType("text/html;charset=UTF-8");
		
		JSONObject jso = new JSONObject();
		List<HolidayDTO> holidays = holidaysDao.selectListHoliday(restaurant_number);
		
		 Date d = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		 
		jso.put("defaultDate",sdf.format(d));
		jso.put("holidays", holidays);		
		return jso.toString();
		
		
		
	}
	
	
	@RequestMapping(value= "/holiday.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String insertHoliday(@RequestParam("dateText")String dateText,@RequestParam("restaurant_number")String restaurant_number,HttpServletResponse resp){
		
		resp.setContentType("text/html;charset=UTF-8");
		
		//결과값을 보내줄
		JSONObject jso = new JSONObject();
		
		// 홀리데이 비디에 있는지 비교
		int resultNum =holidaysDao.compareholiday(dateText, restaurant_number);
		
		
		if(resultNum==1){ //디비에 이미 휴일로 등록되어 있음.
			
			
		    holidaysDao.deleteHoliday(dateText, restaurant_number);
			jso.put("state", "휴일 등록이 취소되었습니다.");
		    
		}else if(resultNum ==0){ //디비에 휴일이 등록되어 있지 않음.
			
			
			holidaysDao.insertHoliday(dateText, restaurant_number);
			
			jso.put("state", "휴일 등록이 완료되었습니다.");
		}
	
		List<HolidayDTO> holidays = holidaysDao.selectListHoliday(restaurant_number);
		
		//내가 달력을 넘긴 경우 유지 값
		
		
		jso.put("defaultDate", dateText);
		//휴일 목록
		jso.put("holidays", holidays);
	
		return jso.toString();
		
		
	}
	

}
