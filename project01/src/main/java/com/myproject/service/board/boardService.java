package com.myproject.service.board;

import java.util.List;

import com.myproject.domain.board.boardVO;

public interface boardService {
	
		// 공지사항 상세보기
		public boardVO boardView(int board_num) throws Exception;
		
		// 공지 목록
		public List<boardVO> boardList(String tbl) throws Exception;
		
		// 공지 작성
		public void boardInsert(boardVO vo) throws Exception;
		
		// 공지 삭제
		public void boardDelete(int board_num) throws Exception;
		
		// 공지 수정
		public void boardUpdate(boardVO vo) throws Exception;
		
		// 조회수
		public void boardCnt(int board_num) throws Exception;
}
