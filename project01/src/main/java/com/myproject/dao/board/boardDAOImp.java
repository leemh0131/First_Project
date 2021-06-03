package com.myproject.dao.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myproject.domain.board.PaginationVO;
import com.myproject.domain.board.boardVO;

@Repository
public class boardDAOImp implements boardDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(boardDAOImp.class);
	
	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "com.myproject.mappers.boardMapper";

	//공지보기
	@Override
	public boardVO boardView(int board_num) throws Exception {
		logger.info("boardDAOImp boardView() => " + board_num);
		return sqlSession.selectOne(namespace + ".boardView", board_num);
	}

	//공지리스트
	@Override
	public List<boardVO> boardList(PaginationVO paginationVO) throws Exception {
		logger.info("boardDAOImp boardList() => " + paginationVO);
		return sqlSession.selectList(namespace + ".boardList", paginationVO);
	}

	//공지쓰기
	@Override
	public void boardInsert(boardVO vo) throws Exception {
		logger.info("boardDAOImp boardInsert() => " + vo);
		sqlSession.insert(namespace + ".boardInsert", vo);		
	}

	//공지삭제
	@Override
	public void boardDelete(int board_num) throws Exception {
		logger.info("boardDAOImp boardDelete() => " + board_num);
		sqlSession.delete(namespace + ".boardDelete", board_num);		
	}

	//공지수정
	@Override
	public void boardUpdate(boardVO vo) throws Exception {
		logger.info("boardDAOImp boardUpdate() => " + vo);
		sqlSession.update(namespace + ".boardUpdate", vo);		
	}

	//공지조회수
	@Override
	public void boardCnt(int board_num) throws Exception {
		logger.info("boardDAOImp boardCnt() => " + board_num);
		sqlSession.update(namespace + ".boardCnt", board_num);		
	}

	//페이징 갯수
	@Override
	public int getBoardListCnt() throws Exception {		
		logger.info("boardDAOImp 공지갯수 가져오기");
		return sqlSession.selectOne(namespace + ".getBoardListCnt");
	}

}
