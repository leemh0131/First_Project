package com.myproject.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.dao.commentDAO;
import com.myproject.domain.commentVO;

@Service
public class commentServiceImp implements commentService {
	
	private static final Logger logger = LoggerFactory.getLogger(commentServiceImp.class);
	
	@Inject
	private commentDAO dao;

	//답변등록
	@Override
	public void commentInsert(commentVO vo) throws Exception {
		logger.info("commentServiceImp commentInsert() => " + vo);
		dao.commentInsert(vo);
	}
	
	//답변삭제
	@Override
	public void commentDelete(int comment_num) throws Exception {
		logger.info("commentServiceImp commentDelete() => " + comment_num);
		dao.commentDelete(comment_num);		
	}

	//답변수정
	@Override
	public void commentUpdate(commentVO vo) throws Exception {
		logger.info("commentServiceImp commentUpdate() => " + vo);
		dao.commentUpdate(vo);		
	}	
	
	

}
