package com.myproject.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.dao.productDAO;
import com.myproject.domain.productVO;

@Service
public class productServiceImp implements productService {
	
	private static final Logger logger = LoggerFactory.getLogger(productServiceImp.class);
	
	@Inject
	private productDAO dao;

	//상품등록
	@Override
	public void insertProduct(productVO vo) throws Exception {		
		logger.info("productServiceImp insertProduct() => " + vo);
		dao.insertProduct(vo);
	}

	//상품수정
	@Override
	public void updateProduct(productVO vo) throws Exception {
		logger.info("productServiceImp updateProduct() => " + vo);
		dao.updateProduct(vo);
	}

	//상품삭제
	@Override
	public void deleteProduct(int product_code) throws Exception {
		logger.info("productServiceImp deleteProduct() => " + product_code);
		dao.deleteProduct(product_code);
	}	
	
	//상품베스트리스트
	@Override
	public List<productVO> productListBest(String tbl) throws Exception {
		logger.info("productServiceImp productListBest() => " + tbl);
		return dao.productListBest(tbl);
	}

	//상품리스트
	@Override
	public List<productVO> productList(String tbl) throws Exception {
		logger.info("productServiceImp productList() => " + tbl);
		return dao.productList(tbl);
	}

	//상품상세보기	
	@Override
	public productVO productView(int product_code) throws Exception {
		logger.info("productServiceImp productView() => " + product_code);		
		return dao.productView(product_code);
	}

	//조회수
	@Override
	public void updateViewCnt(int product_code) throws Exception {
		logger.info("productServiceImp updateViewCnt () => " + product_code);
		dao.updateViewCnt(product_code);
	}

	//좋아요
	@Override
	public void productLike(int product_code) throws Exception {
		logger.info("productServiceImp productLike () => " + product_code);
		dao.productLike(product_code);
	}

	

	

}
