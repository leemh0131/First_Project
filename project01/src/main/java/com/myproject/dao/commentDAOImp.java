package com.myproject.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myproject.domain.commentVO;

@Repository
public class commentDAOImp implements commentDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(commentDAOImp.class);
	
	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "com.myproject.mappers.questionMapper";

	//답변쓰기
	@Override
	public void commentInsert(commentVO vo) throws Exception {		
		logger.info("commentDAOImp commentInsert() => " + vo);
		sqlSession.insert(namespace + ".commentInsert", vo);		
	}

	//답변삭제
	@Override
	public void commentDelete(int comment_num) throws Exception {		
		logger.info("commentDAOImp commentDelete() => " + comment_num);
		sqlSession.delete(namespace + ".commentDelete", comment_num);	
	}

	//답변수정
	@Override
	public void commentUpdate(commentVO vo) throws Exception {		
		logger.info("commentDAOImp commentUpdate() => " + vo);
		sqlSession.update(namespace + ".commentUpdate", vo);
	}

}
