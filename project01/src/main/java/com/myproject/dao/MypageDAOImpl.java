package com.myproject.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myproject.domain.LikeyVO;



@Repository
public class MypageDAOImpl implements MypageDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageDAOImpl.class);
	
	@Inject
	SqlSession sqlSession;
	
	//네임스페이스 조심. mypageMapper.xml 과 일치하도록 작성
	private static String namespace = "com.myproject.mappers.productsMapper";
	
	//찜목록 보기
	@Override
	public List<LikeyVO> list(String tbl) throws Exception {
		logger.info("MypageDAO 가 일한다.");
		return sqlSession.selectList(namespace + ".list", tbl);
	}
	
	
	
	

}
