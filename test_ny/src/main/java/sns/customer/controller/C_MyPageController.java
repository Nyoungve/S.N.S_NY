package sns.customer.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sns.dao.ReserveDAO;
import sns.dao.ReviewDAO;
import sns.dto.ReserveDTO;
import sns.dto.ReviewDTO;

@Controller
public class C_MyPageController {

	
	@Autowired
	private ReserveDAO reserveDao;
	
	public void setReserveDao(ReserveDAO reserveDao) {
		this.reserveDao = reserveDao;
	}

	@Autowired
	private ReviewDAO reviewDao;
	
	public void setReviewDao(ReviewDAO reviewDao) {
		this.reviewDao = reviewDao;
	}

	//고객 마이 페이지 메인으로 보내는 처리
	@RequestMapping("/Mypage_Main.do")
	public String mypage_main() {
		
		return "Mypage_Main";
	}
	
	//고객 예약 정보 확인 처리 (테이블 reserve)
	@RequestMapping("/Mypage_Reserve.do")
	public ModelAndView mypage_reserve(@RequestParam(value="end_rno", defaultValue="10") String end_rno) {
		System.out.println("Reserve page");
		System.out.println(end_rno);
		ModelAndView mav = new ModelAndView("Mypage_Reserve");
		
		List<ReserveDTO> list = new ArrayList<ReserveDTO>();
		list = reserveDao.c_getReserveList("a", end_rno);
		mav.addObject("reserveList", list);
		mav.addObject("end_rno", end_rno);
		return mav;
	}

	//고객 정보수정을 위한 요청
	@RequestMapping("/Mypage_UserInfo.do")
	public String mypage_userinfo() {
		
		return "Mypage_UserInfo";
	}
	
	//고객이 후기 리스트를 가져오기 위한 요청 처리
	@RequestMapping("/Mypage_Review.do")
	public ModelAndView mypage_review() {
		
		ModelAndView mav = new ModelAndView("Mypage_Review");
		
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		list =reviewDao.getReviewList("a");
		mav.addObject("reviewList", list);
		return mav;
	}
	
	@RequestMapping("/writeForm.do")
	public ModelAndView writeForm(@RequestParam("restaurant_number") String restaurant_number, @RequestParam("reserve_date") String reserve_date) {
		ModelAndView mav = new ModelAndView("customer/C_Mypage_ReviewForm");
		mav.addObject("restaurant_number", restaurant_number);
		mav.addObject("reserve_date", reserve_date);
		return mav;
	}

	
	//고객 후기 삭제를 위한 요청 처리
	@RequestMapping("/Review_Delete.do")
	public String review_delete(ReviewDTO reviewDto, BindingResult result){
		System.out.println("review_delete");
		reviewDao.deleteReview(reviewDto);
				
		return "redirect:/Mypage_Review.do";
	}
	
	
	//review를 쓸 때 날짜를 형식에 맞춰서 바꿔주기 위한 initbinder 설정
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	
}
