package com.myproject.service;

import com.myproject.domain.reviewVO;

public interface reviewService {
	
	//리뷰보기
	public reviewVO reviewView(int product_code) throws Exception;
	
	//리뷰작성
	public void reviewWrite(reviewVO vo) throws Exception;
	
	//리뷰삭제
	public void reviewdelete(int product_code) throws Exception;

}
