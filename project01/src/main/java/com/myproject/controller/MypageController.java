package com.myproject.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myproject.domain.LikeyVO;
import com.myproject.service.MypageService;



@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Inject
	private MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	/*
	//마이페이지 get
	@RequestMapping(value="/main", method= RequestMethod.GET)
	public void getMypageMain(Model model) throws Exception {
		logger.info("Mypage 가 컨트롤러에 의해 get 실행");
		model.addAttribute("Mypage", "마이페이지 입니다.");		
	}
	
	//마이페이지 post
	@RequestMapping(value="/main", method= RequestMethod.POST)
	public String postMypageMain(Model model) throws Exception {
		logger.info("Mypage 가 컨트롤러에 의해 post 실행");
		model.addAttribute("Mypage", "마이페이지 입니다.");
		return "redirect:/mypage/main";
	}
	*/
	
	@RequestMapping(value="/likey", method=RequestMethod.GET)
	public void getLikeyList(Model model) throws Exception {
		logger.info("likey 페이지가 컨트롤러에 의해 GET 실행");
		List<LikeyVO> list = null;
		list = mypageService.list("list");
		model.addAttribute("list", list);
	}
	
	
	
	
	
	
	
	
	
	
	
}
