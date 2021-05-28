package com.myproject.controller.board;

import java.util.List;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.domain.board.questionVO;
import com.myproject.service.board.commentService;
import com.myproject.service.board.questionService;


@Controller
@RequestMapping(value="/question/", produces="text/plain;charset=UTF-8")
public class questionController {

	// logger사용
	private static final Logger logger = LoggerFactory.getLogger(questionController.class);
	
	@Inject
	private questionService questionService;
	@Inject
	private commentService commentService;

	// 관리자문의리스트화면
	@RequestMapping(value = "/questionAllList", method = RequestMethod.GET)
	public void questionAllList(Model model) throws Exception {
		logger.info("questionController questionAllList called.....");
		
		List<questionVO> list = null;
		list = questionService.questionAllList("questionAllList");
		model.addAttribute("questionAllList", list);
	}
	
	// 회원문의리스트화면
	@RequestMapping(value = "/questionList", method = RequestMethod.GET)
	public void questionList(Model model, @RequestParam("member_code") String member_code) throws Exception {
		logger.info("questionList GET..");
		
		List<questionVO> list = null;
		list = questionService.questionList(member_code);
		model.addAttribute("questionList", list);
	}

	// 문의보기
	@RequestMapping(value = "/questionView", method = RequestMethod.GET)
	public void questionView(@RequestParam("question_num") int question_num, Model model) throws Exception {
	 
		questionVO view = null;
		view =  questionService.questionView(question_num);		
		model.addAttribute("questionView", view);	
		
	}	
	

}
