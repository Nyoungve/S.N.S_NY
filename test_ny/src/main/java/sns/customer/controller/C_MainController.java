package sns.customer.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import sns.dao.ReserveDAO;
import sns.dao.RestaurantDAO;
import sns.dto.ReserveDTO;
import sns.dto.RestaurantDTO;

@Controller
public class C_MainController {

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
	
	
	
	//더보기 버튼 요청 처리
	@RequestMapping("/more.do")
	public String moreForm(){
		return "moreRestaurant";
	}
	
	
	
	//레스토랑을 클릭했을 때 레스토랑 정보를 보내주는 처리
	@RequestMapping("/reserve.do")
	public String reserveForm(@RequestParam("restaurant_number")String restaurant_number
			,@RequestParam("today")String today
			,Model model){
		
		//System.out.println("reserveFrom");
		
		
		//레스토랑의 영업 시작 시간과 끝 시간 가져오기
		RestaurantDTO restaurantDto = restaurantDao.selectWorkingClosingTime(restaurant_number);
		
		
		
		//model.addAttribute("restaurantDto", restaurantDto);
		
		
		
		String openingTime = Integer.toString(restaurantDto.getOpeningTime());
		String closingTime = Integer.toString(restaurantDto.getClosingTime());
		
		//레스토랑의 오늘 시간별 예약 현황 가져오기
		LinkedHashMap<Integer,Integer> resultMap = reserveDao.searchAvailableTeamCount(restaurant_number,today,openingTime,closingTime);
		
		model.addAttribute("resultMap", resultMap);
		
		
		return "ReservePage";
	}

	
	
	//고객의 예약 정보를 reserve테이블에 넣는 처리
	@RequestMapping(value="/reserveData.do",method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String insertReserveData(ReserveDTO reserveDto,BindingResult bindingResult,HttpServletResponse resp){
		
		resp.setContentType("text/html;charset=UTF-8");
			
		
		JSONObject jso = new JSONObject();
		
		
		
		reserveDao.insertReserveData(reserveDto);
		
		
		
		return jso.toString();
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	
	
	
	
	
	
	
}
