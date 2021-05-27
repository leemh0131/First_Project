package com.myproject.controller;

import java.util.List;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.domain.boardVO;
import com.myproject.domain.reviewVO;
import com.myproject.service.boardService;
import com.myproject.service.reviewService;


@Controller
@RequestMapping(value="/review/", produces="text/plain;charset=UTF-8")
public class reviewController {

	// logger사용
	private static final Logger logger = LoggerFactory.getLogger(reviewController.class);
	
	@Inject
	private reviewService reviewService;
	
	// 리뷰작성 get
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.GET) 
	public void getreviewWrite() throws Exception {
		logger.info("reviewController reviewWrite() GET");
	}
	
	
	// 리뷰작성 POST	
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String reviewWrite(reviewVO vo) throws Exception {
		logger.info("reviewController reviewWrite() => " + vo);
		reviewService.reviewWrite(vo);
		return "redirect:/";
	}

	

}
