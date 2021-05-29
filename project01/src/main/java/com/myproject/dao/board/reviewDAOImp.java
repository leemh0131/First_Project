package com.myproject.dao.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myproject.dao.MypageDAOImpl;
import com.myproject.domain.board.reviewVO;

@Repository
public class reviewDAOImp implements reviewDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageDAOImpl.class);
	
	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "com.myproject.mappers.revieMapper";	
	

	//리뷰보기
	@Override
	public reviewVO reviewView(int product_code) throws Exception {		
		logger.info("reviewDAOImp reviewView() => " + product_code);
		return sqlSession.selectOne(namespace + ".review", product_code);
	}

	//리뷰쓰기
	@Override
	public void reviewWrite(reviewVO vo) throws Exception {
		logger.info("selectOne reviewWrite() => " + vo);
		sqlSession.insert(namespace + ".reviewWrite", vo);		
	}

	//리뷰삭제
	@Override
	public void reviewdelete(int review_num) throws Exception {
		logger.info("reviewDAOImp reviewdelete() => " + review_num);
		sqlSession.delete(namespace + ".reviewdelete", review_num);	
	}

	//리뷰올
	@Override
	public List<reviewVO> reviewAll(String tbl) throws Exception {
		logger.info("reviewDAOImp reviewAll() => " + tbl);
		return sqlSession.selectList(namespace + ".reviewAll", tbl);
	}

	//리뷰갯수
	@Override
	public int reviewCnt(int product_code) throws Exception {
		logger.info("reviewDAOImp reviewCnt() => " + product_code);
		return sqlSession.selectOne(namespace + ".reviewCnt", product_code);
	}
	
	

	

}
