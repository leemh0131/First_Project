package com.myproject.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.dao.reviewDAO;
import com.myproject.domain.reviewVO;






@Service
public class reviewServiceImp implements reviewService {
	
	private static final Logger logger = LoggerFactory.getLogger(reviewServiceImp.class);
	
	@Inject
	private reviewDAO dao;

	//리뷰보기
	@Override
	public reviewVO reviewView(int product_code) throws Exception {
		logger.info("reviewServiceImp reviewView() => " + product_code);		
		return dao.reviewView(product_code);
	}
	
	//리뷰쓰기
	@Override
	public void reviewWrite(reviewVO vo) throws Exception {
		logger.info("reviewServiceImp reviewWrite() => " + vo);
		dao.reviewWrite(vo);		
	}

	//리뷰삭제
	@Override
	public void reviewdelete(int product_code) throws Exception {
		logger.info("reviewServiceImp reviewdelete() => " + product_code);
		dao.reviewdelete(product_code);		
	}

	
	
	

}
