package com.myproject.dao.board;

import java.util.List;

import com.myproject.domain.board.PaginationVO;
import com.myproject.domain.board.boardVO;

public interface boardDAO {
	
	// 공지사항 상세보기
	public boardVO boardView(int board_num) throws Exception;
	
	// 공지 목록
	public List<boardVO> boardList(PaginationVO paginationVO) throws Exception;
	
	// 공지 작성
	public void boardInsert(boardVO vo) throws Exception;
	
	// 공지 삭제
	public void boardDelete(int board_num) throws Exception;
	
	// 공지 수정
	public void boardUpdate(boardVO vo) throws Exception;
	
	// 조회수
	public void boardCnt(int board_num) throws Exception;
	
	//총 게시글 개수 확인(페이징)
	public int getBoardListCnt() throws Exception;
	
}
