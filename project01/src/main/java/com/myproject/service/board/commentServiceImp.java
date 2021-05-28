package com.myproject.service.board;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.dao.board.commentDAO;
import com.myproject.domain.board.commentVO;

import lombok.extern.java.Log;

@Log
@Service
public class commentServiceImp implements commentService {
	
	private static final Logger logger = LoggerFactory.getLogger(commentServiceImp.class);
	
	@Inject
	private commentDAO dao;

	//답변등록
	@Override
	public int commentInsert(commentVO vo) throws Exception {
		logger.info("commentServiceImp commentInsert() => " + vo);
		return dao.commentInsert(vo);
	}
	
	//답변삭제
	@Override
	public int commentDelete(int comment_num) throws Exception {
		logger.info("commentServiceImp commentDelete() => " + comment_num);
		return dao.commentDelete(comment_num);		
	}

	//답변수정
	@Override
	public int commentUpdate(commentVO vo) throws Exception {
		logger.info("commentServiceImp commentUpdate() => " + vo);
		return dao.commentUpdate(vo);		
	}

	//답글보기
	@Override
	public List<commentVO> commentList(int question_num) throws Exception {
		logger.info("commentServiceImp commentUpdate() => " + question_num);
		return dao.commentList(question_num);
	}	
	
	

}
