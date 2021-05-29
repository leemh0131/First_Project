package com.myproject.service.board;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.dao.board.reviewDAO;
import com.myproject.domain.board.reviewVO;






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
	public void reviewdelete(int review_num) throws Exception {
		logger.info("reviewServiceImp reviewdelete() => " + review_num);
		dao.reviewdelete(review_num);		
	}

	//리뷰전체
	@Override
	public List<reviewVO> reviewAll(String tbl) throws Exception {
		logger.info("reviewServiceImp reviewAll() => " + tbl);
		return dao.reviewAll(tbl);
	}

	//리뷰갯수
	@Override
	public int reviewCnt(int product_code) throws Exception {
		logger.info("reviewServiceImp reviewCnt() => " + product_code);		
		return dao.reviewCnt(product_code);
	}

	
	
	

}
