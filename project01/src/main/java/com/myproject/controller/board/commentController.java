package com.myproject.controller.board;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.domain.board.commentVO;
import com.myproject.service.board.commentService;


@Controller
@RequestMapping("/comment")
public class commentController {
	
	// @Resource(name="com.edu.board2.service.CommentService")
	@Inject
	commentService commentService;
	
	//답변 등록
	@RequestMapping("/insert")
	@ResponseBody
	private int mCommentServiceInsert(@RequestParam int question_num,
			@RequestParam String comment_content, @RequestParam String comment_title) throws Exception {
		System.out.println("commentServiceServiceInsert.....");
		System.out.println("question_num["+question_num+"]");
		System.out.println("comment_content["+comment_content+"]");
		System.out.println("comment_title["+comment_title+"]");
		
		commentVO comment = new commentVO();
		comment.setQuestion_num(question_num);
		comment.setComment_content(comment_content);
		comment.setComment_title(comment_title);
		
		return commentService.commentInsert(comment);
	}

	//답변 리스트
    @RequestMapping("/list/{question_num}") 
    @ResponseBody
    private List<commentVO> mCommentServiceList(@PathVariable int question_num, Model model) throws Exception{
		System.out.println("commentService List.....");
		System.out.println(commentService.commentList(question_num));
       return commentService.commentList(question_num);
    }
	
	//답변 삭제
	@RequestMapping("/delete/{comment_num}")
	@ResponseBody
	private int mCommentServiceDelete(@PathVariable int comment_num) throws Exception {
		System.out.println("commentService Delete.....");
		return commentService.commentDelete(comment_num);
	}
	
	//답변 수정
	@RequestMapping("/update")
	@ResponseBody
	private int mCommentServiceUpdateProc(@RequestParam int comment_num, @RequestParam int question_num,
			@RequestParam String comment_content, @RequestParam String comment_title) throws Exception {
		System.out.println("commentService UpdateProc.....");

		commentVO comment = new commentVO();
		comment.setQuestion_num(question_num);
		comment.setComment_content(comment_content);
		comment.setComment_title(comment_title);
		
		return commentService.commentUpdate(comment);
	}
	
	
	
	
	
	
	
	
}





































