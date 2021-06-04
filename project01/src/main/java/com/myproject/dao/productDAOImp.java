package com.myproject.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myproject.domain.productVO;
import com.myproject.utils.search;

@Repository
public class productDAOImp implements productDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(productDAOImp.class);
	
	@Inject
	private SqlSession sqlSession;
    
    private static String namespace = "com.myproject.mappers.productsMapper";

    //상품등록
	@Override
	public void insertProduct(productVO vo) throws Exception {	
		logger.info("productDAOImp insertProduct() => " + vo);
		sqlSession.insert(namespace + ".insertProduct", vo);	
	}

	//상품수정
	@Override
	public void updateProduct(productVO vo) throws Exception {
		logger.info("productDAOImp updateProduct() => " + vo);
		sqlSession.update(namespace + ".updateProduct", vo);
	}

	//상품삭제
	@Override
	public void deleteProduct(int product_code) throws Exception {
		logger.info("productDAOImp deleteProduct() => " + product_code);
		sqlSession.delete(namespace + ".deleteProduct", product_code);
		
	}

	//상품리스트
	@Override
	public List<productVO> productList(HashMap<String, String> map) throws Exception {
		logger.info("productDAOImp productList() => " + map);
		return sqlSession.selectList(namespace + ".productList", map);		
	}
	
	//베스트10리스트
	@Override
	public List<productVO> productListBest(String tbl) throws Exception {
		logger.info("productDAOImp productList() => " + tbl);
		return sqlSession.selectList(namespace + ".productListBest", tbl);
	}	

	//상품상세보기
	@Override
	public productVO productView(int product_code) throws Exception {
		logger.info("productDAOImp productView() => " + product_code);
		return sqlSession.selectOne(namespace + ".productView", product_code);
	}

	//조회수
	@Override
	public void updateViewCnt(int product_code) throws Exception {
		logger.info("productDAOImp updateViewCnt() => " + product_code);
		sqlSession.update(namespace + ".updateViewCnt", product_code);
	}

	//좋아요
	@Override
	public void productLike(int product_code) throws Exception {
		logger.info("productDAOImp productLike() => " + product_code);
		sqlSession.update(namespace + ".productLike", product_code);
	}
	
	//좋아요
	@Override
	public int productLikeCount(int product_code) throws Exception {
		logger.info("productDAOImp productLike() => " + product_code);
		return sqlSession.selectOne(namespace + ".productLikeCount", product_code);
	}


	
	
	



}
