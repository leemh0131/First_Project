package com.myproject.controller.board;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.domain.MemberVO;
import com.myproject.domain.board.PaginationVO;
import com.myproject.domain.board.commentVO;
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
	
	
	// 회원문의리스트화면
	@RequestMapping(value = "/questionList", method = RequestMethod.GET)
	public void questionList(Model model, HttpServletRequest req,
		@RequestParam(required = false, defaultValue = "1") int page, 
		@RequestParam(required = false, defaultValue = "1") int range)throws Exception {
	
		//로그인세션가져오기		  
		HttpSession session = req.getSession();			
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		//전체 게시글 개수
		int listCnt = questionService.getBoardListCnt();
		
		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);		
		model.addAttribute("pagination", pagination);		
		
		List<questionVO> list = null;
		//list = questionService.questionList(Integer.toString(memberVO.getMember_code()));
		list = questionService.questionList(pagination);
		model.addAttribute("questionList", list);
		
		logger.info("questionList GET..list =>" + list);
		
	}

	// 문의보기
	@RequestMapping(value = "/questionView", method = RequestMethod.GET)
	public void questionView(@RequestParam("question_num") int question_num, HttpServletRequest req, Model model) throws Exception {
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		questionVO view = null;
		view =  questionService.questionView(question_num);		
		model.addAttribute("questionView", view);	
		
	}
	
	// 문의작성 GET
	@RequestMapping(value = "/questionInsert", method = RequestMethod.GET) 
	public void getquestionInsert(Model model, HttpServletRequest req) throws Exception {		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();			
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);	
			
	}	
	
	// 문의작성 POST	
	@RequestMapping(value = "/questionInsert", method = RequestMethod.POST)
	public String questionInsert(Model model, HttpServletRequest req, questionVO Qvo) throws Exception {
		
		questionService.questionInsert(Qvo);		
		logger.info("questionController questionInsert() => " + Qvo);		 
		
		return "redirect:/question/questionList";
	}	

	// 답변작성 GET
	@RequestMapping(value = "/commentInsert", method = RequestMethod.GET) 
	public void getcommentInsert(@RequestParam("question_num")int question_num, Model model) throws Exception {		
		logger.info("questionController commentInsert() GET" + question_num);
		model.addAttribute("question_num", question_num);
	}	
	
	// 답변작성 POST	
	@RequestMapping(value = "/commentInsert", method = RequestMethod.POST)
	public String commentInsert(commentVO vo, questionVO Qvo) throws Exception {
		logger.info("questionController commentInsert() => " + vo);
		logger.info("questionController 답변작성 번호() => " + Qvo.getQuestion_num());
		commentService.commentInsert(vo);				
		return "redirect:/question/questionView?question_num=" + Qvo.getQuestion_num();
	}	
	
	// 답변삭제	
	@RequestMapping(value = "/commentDelete", method = RequestMethod.GET)
	public String commentDelete(@RequestParam("comment_num")int comment_num) throws Exception {
		logger.info("questionController commentDelete() =>" + comment_num);			
		commentService.commentDelete(comment_num);		
		return "redirect:/question/questionList";	
	}
	
	// 문의삭제	
	@RequestMapping(value = "/questionDelete", method = RequestMethod.GET)
	public String questionDelete(@RequestParam("question_num")int question_num) throws Exception {
		logger.info("questionController questionDelete() =>" + question_num);			
		questionService.questionDelete(question_num);		
		return "redirect:/question/questionList";
	}


}
