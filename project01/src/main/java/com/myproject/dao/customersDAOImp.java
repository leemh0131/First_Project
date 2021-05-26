package com.myproject.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class customersDAOImp implements customersDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageDAOImpl.class);
	
	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "com.myproject.mappers.";

}
