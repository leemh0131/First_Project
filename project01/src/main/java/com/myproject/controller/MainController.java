package com.myproject.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.service.productService;


@Controller
public class MainController {
	
	@Inject
	private productService productService;
	
	//메인페이지
	@RequestMapping("/")
	public String memberMain() {
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

	//임시 로그인 기능 
	/*
	 * @RequestMapping(value="/Login", method=RequestMethod.GET) public void
	 * Login(HttpServletRequest request) throws Exception {
	 * System.out.println("Login => "); HttpSession session = request.getSession();
	 * session.setAttribute("member_code", "2"); }
	 */
	
	
}
