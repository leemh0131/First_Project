package com.myproject.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.dao.boardDAO;
import com.myproject.domain.boardVO;






@Service
public class boardServiceImp implements boardService {
	
	private static final Logger logger = LoggerFactory.getLogger(boardServiceImp.class);
	
	@Inject
	private boardDAO dao;

	//공지보기
	@Override
	public boardVO boardView(int board_num) throws Exception {
		logger.info("boardServiceImp boardView() => " + board_num);
		return dao.boardView(board_num);
	}

	//공지리스트
	@Override
	public List<boardVO> boardList(String tbl) throws Exception {
		logger.info("boardServiceImp boardList() => " + tbl);
		return dao.boardList(tbl);
	}

	//공지쓰기
	@Override
	public void boardInsert(boardVO vo) throws Exception {
		logger.info("boardServiceImp boardInsert() => " + vo);
		dao.boardInsert(vo);		
	}

	//삭제
	@Override
	public void boardDelete(int board_num) throws Exception {
		logger.info("boardServiceImp boardDelete() => " + board_num);
		dao.boardDelete(board_num);
	}

	//수정
	@Override
	public void boardUpdate(boardVO vo) throws Exception {
		logger.info("boardServiceImp boardUpdate() => " + vo);
		dao.boardUpdate(vo);		
	}

	@Override
	public void boardCnt(int board_num) throws Exception {
		logger.info("boardServiceImp product_code() => " + board_num);
		dao.boardCnt(board_num);
	}
	
	

}
