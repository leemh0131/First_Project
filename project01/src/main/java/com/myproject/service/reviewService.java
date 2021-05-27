package com.myproject.service;

import java.util.List;

import com.myproject.domain.reviewVO;

public interface reviewService {
	
	//리뷰보기
	public reviewVO reviewView(int product_code) throws Exception;
	
	//리뷰작성
	public void reviewWrite(reviewVO vo) throws Exception;
	
	//리뷰삭제
	public void reviewdelete(int review_num) throws Exception;
	
	//전체리뷰
	public List<reviewVO> reviewAll(String tbl) throws Exception;

}
