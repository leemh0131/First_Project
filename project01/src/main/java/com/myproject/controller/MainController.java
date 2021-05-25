package com.myproject.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {		
	
	//메인페이지
	@RequestMapping("/")
	public String memberMain() {
		return "memberMain";
	}
	
	/*
	 * // 로그인 후 페이지로 이동
	 * 
	 * @RequestMapping("/memberMain2") public void memberMain2() {
	 * 
	 * }
	 * 
	 * // 관리자
	 * 
	 * @RequestMapping("/memberMain3") public void headerAdmin() {
	 * 
	 * }
	 */
	
	
	
}
