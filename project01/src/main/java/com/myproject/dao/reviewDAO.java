package com.myproject.dao;


import java.util.List;

import com.myproject.domain.reviewVO;

public interface reviewDAO {
	
	//전체리뷰
	public List<reviewVO> reviewAll(String tbl) throws Exception;
	
	//리뷰보기
	public reviewVO reviewView(int product_code) throws Exception;
	
	//리뷰작성
	public void reviewWrite(reviewVO vo) throws Exception;
	
	//리뷰갯수
	public reviewVO reviewCnt(int product_code) throws Exception;
	
	//리뷰삭제
	public void reviewdelete(int review_num) throws Exception;

}
