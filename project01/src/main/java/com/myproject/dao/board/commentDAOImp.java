package com.myproject.dao.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myproject.domain.board.commentVO;

@Repository
public class commentDAOImp implements commentDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(commentDAOImp.class);
	
	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "com.myproject.mappers.commentMapper";
	
	//답글
	@Override
	public List<commentVO> commentList(int question_num) throws Exception {
		logger.info("commentDAOImp commentList() => " + question_num);
		return sqlSession.selectList(namespace + ".commentList", question_num);
	}

	//답변쓰기
	@Override
	public int commentInsert(commentVO vo) throws Exception {		
		logger.info("commentDAOImp commentInsert() => " + vo);
		return sqlSession.insert(namespace + ".commentInsert", vo);		
	}

	//답변삭제
	@Override
	public int commentDelete(int comment_num) throws Exception {		
		logger.info("commentDAOImp commentDelete() => " + comment_num);
		return sqlSession.delete(namespace + ".commentDelete", comment_num);	
	}

	//답변수정
	@Override
	public int commentUpdate(commentVO vo) throws Exception {		
		logger.info("commentDAOImp commentUpdate() => " + vo);
		return sqlSession.update(namespace + ".commentUpdate", vo);
	}

}
