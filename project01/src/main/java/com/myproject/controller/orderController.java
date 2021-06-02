package com.myproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.domain.MemberVO;
import com.myproject.domain.orderVO;
import com.myproject.domain.productVO;
import com.myproject.service.orderService;
import com.myproject.service.productService;

@Controller
@RequestMapping(value="/order", produces="text/plain;charset=UTF-8")
public class orderController {

	// logger사용
	private static final Logger logger = LoggerFactory.getLogger(orderController.class);
	
	@Inject
	productService productService;
	
	@Inject
	orderService orderService;
	
	// 주문
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public void order(Model model, HttpServletRequest req, @RequestParam("product_code") int product_code) throws Exception {	
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();			
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		//보기
		productVO View = null;
		View = productService.productView(product_code);
		model.addAttribute("productView", View);
		
	}
	
	// 결제완료
	@RequestMapping(value = "/orderComplete", method = {RequestMethod.GET, RequestMethod.POST})
	public void orderComplete(Model model, HttpServletRequest req, orderVO vo) throws Exception {	
		
		logger.info("orderController orderComplete()일한다.");
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();			
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		orderService.orderComplete(vo);			
		}		
	
	
	//주소찾기
	@RequestMapping(value = "/jusoPopup", method = {RequestMethod.GET, RequestMethod.POST})
	public void jusoPopup() throws Exception {
		
	}
	
	// 약관동의
	@RequestMapping(value = "/buyCheck", method = RequestMethod.GET)
	public void buyCheck() throws Exception {
			
	}
	






}
