package com.myproject.dao.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myproject.domain.board.questionVO;

@Repository
public class questionDAOImp implements questionDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(questionDAOImp.class);
	
	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "com.myproject.mappers.questionMapper";	

	//문의하기
	@Override
	public void questionInsert(questionVO vo) throws Exception {
		logger.info("questionDAOImp questionInsert() => " + vo);
		sqlSession.insert(namespace + ".questionInsert", vo);
	}

	//삭제
	@Override
	public void questionDelete(int question_num) throws Exception {
		logger.info("questionDAOImp questionDelete() => " + question_num);
		sqlSession.delete(namespace + ".questionDelete", question_num);		
	}

	//수정
	@Override
	public void questionUpdate(questionVO vo) throws Exception {
		logger.info("questionDAOImp questionUpdate() => " + vo);
		sqlSession.update(namespace + ".questionUpdate", vo);		
	}

	//관리자리스트
	@Override
	public List<questionVO> questionAllList(String tbl) throws Exception {
		logger.info("questionDAOImp questionAllList() => " + tbl);
		return sqlSession.selectList(namespace + ".questionAllList", tbl);
	}

	//상세보기	
	@Override
	public questionVO questionView(int question_num) throws Exception {
		logger.info("questionDAOImp questionView() => " + question_num);
		return sqlSession.selectOne(namespace + ".questionView", question_num);
	}

	//회원리스트
	@Override
	public List<questionVO> questionList(String tbl) throws Exception {
		logger.info("questionDAOImp questionAllList() => " + tbl);
		return sqlSession.selectList(namespace + ".questionList", tbl);
	}

}
