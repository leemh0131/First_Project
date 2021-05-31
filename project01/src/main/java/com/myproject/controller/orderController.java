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


import com.myproject.domain.MemberVO;

@Controller
@RequestMapping(value="/", produces="text/plain;charset=UTF-8")
public class orderController {

	// logger사용
	private static final Logger logger = LoggerFactory.getLogger(orderController.class);
	
	// 주문
	@RequestMapping(value = "order", method = RequestMethod.POST)
	public void questionList(Model model, HttpServletRequest req) throws Exception {
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();			
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		
	}



}
