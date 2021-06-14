package com.myproject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.domain.BasketVO;
import com.myproject.domain.LikeyMonthVO;
import com.myproject.domain.LikeyVO;
import com.myproject.domain.MemberVO;
import com.myproject.domain.orderVO;
import com.myproject.service.MypageService;


@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private MypageService mypageService;
	
	//메인페이지
	@RequestMapping("/")
	public String memberMain(Model model, HttpServletRequest req) {
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		return "memberMain";
	}	
			
	
	//로그인세션
	@RequestMapping(value="/include/header", method=RequestMethod.POST) 
	public void headerlogin(Model model, HttpServletRequest req) throws Exception {		  
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		 
	}
	
	//마이페이지 메인  get
	@RequestMapping(value="/mypage", method= RequestMethod.GET)
	public void getMypageMain(Model model, HttpServletRequest req, LikeyVO likeyVO, BasketVO basketVO, orderVO orderVO) throws Exception {
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		int member_code = memberVO.getMember_code();
		
		if(memberVO != null) { //오직 세션이 붙어있는 상태
			
			//likeyVO, basket_VO에 세션member_code 부여
			likeyVO.setMember_code(member_code);
			basketVO.setMember_code(member_code);
			orderVO.setMember_code(member_code);
			
			//리스트 생성(찜리스트, 주문리스트, 장바구니 리스트)
			List<LikeyMonthVO> likey_list_mon = null;
			List<LikeyVO> likey_list = null;
			List<BasketVO> basket_list = null;
			List<orderVO> order_list_mon = null;
			
			
			//서비스에 전달
			likey_list_mon 	= mypageService.likeyListMonth(member_code);
			logger.info("likey_list_mon ==> " + likey_list_mon);
			
			likey_list 	 	= mypageService.likeyList(likeyVO);
			basket_list 	= mypageService.basketList(basketVO);
			order_list_mon = mypageService.orderListMonth(orderVO);
			
			//화면으로 전달
			model.addAttribute("likeyListMon", likey_list_mon);
			model.addAttribute("basket_list_size", basket_list.size());
			model.addAttribute("likey_list_size", likey_list.size());
			model.addAttribute("likeyListMon_size", likey_list_mon.size());
			model.addAttribute("orderListMon", order_list_mon);
			model.addAttribute("orderListMon_size", order_list_mon.size());
		}
		
				
		logger.info("Mypage 가 컨트롤러에 의해 get 실행");
		logger.info("gkdnl");
		
	}
	
	//마이페이지 메인 post
	/*@RequestMapping(value="/mypage", method= RequestMethod.POST)
	public String postMypageMain(Model model, HttpServletRequest req) throws Exception {
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		//리스트 생성(찜리스트, 주문리스트, 장바구니 리스트, 리뷰)
		List<LikeyVO> likey_list_mon = null;
		List<LikeyVO> likey_list = null;
		List<BasketVO> basket_list = null;
		
		//서비스에 전달
		likey_list_mon 	= mypageService.likeyListMonth("likey"); //최근 한 달간 찜목록
		likey_list 		= mypageService.likeyList("likey");
		basket_list 	= mypageService.basketList("basket");		//장바구니 목록
		
		
		//화면으로 전달
		model.addAttribute("likeyListMon", likey_list_mon);
		model.addAttribute("basket_list_size", basket_list.size());
		model.addAttribute("likey_list_size", likey_list.size());
		
		//System.out.println(likey_list.size());
		
		
		
		
		logger.info("Mypage 가 컨트롤러에 의해 post 실행");
		return "redirect:/mypage/main";
	}*/


	
}
