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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myproject.domain.MemberVO;
import com.myproject.service.MemberService;
import com.myproject.service.productService;


@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private productService productService;
	
	@Inject
	private MemberService MemberService;
	
	//메인페이지
	@RequestMapping("/")
	public String memberMain(Model model, HttpServletRequest req) {
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		return "memberMain";
	}
	
	//검색기능 
	@RequestMapping(value="/searchName", method=RequestMethod.GET)
	public void	searchName(Model model, @RequestParam("searchName")String searchName) throws Exception { 
		System.out.println("searchName =>" + searchName);
		
		/*
		 * List<productVO> list = null; list = productService.productList(product_type);
		 * model.addAttribute("productList", list);
		 */
	 
	}		
	
	//로그인
	@RequestMapping(value="/include/header", method=RequestMethod.POST) 
	public void headerlogin(Model model, HttpServletRequest req) throws Exception {		  
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		 
	}
	
	
	
	
}
