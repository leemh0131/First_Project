package com.myproject.service;

import java.util.List;

import com.myproject.domain.productVO;

public interface productService {
	
	//관리자 상품 추가
	public void insertProduct(productVO vo) throws Exception;	
	
	//관리자 상품 수정
	public void updateProduct(productVO vo)  throws Exception;
	
	//관리자 상품삭제
	public void deleteProduct(int product_code) throws Exception;
	
	//상품리스트보기
	public List<productVO> productList(String tbl) throws Exception;
	
	//상품베스트10보기
	public List<productVO> productListBest(String tbl) throws Exception;
	
	//상품상세보기
	public productVO productView(int product_code) throws Exception;
	
	//상품조회수
	public void updateViewCnt(int product_code) throws Exception;
	
	//상품좋아요
	public void productLike(int product_code) throws Exception;
	
	//상품좋아요
	public int productLikeCount(int product_code) throws Exception;
	
	
}
