package com.myproject.dao.board;

import java.util.List;

import com.myproject.domain.board.PaginationVO;
import com.myproject.domain.board.questionVO;

public interface questionDAO {
	
	// 문의 작성
	public void questionInsert(questionVO vo) throws Exception;
	
	// 문의 삭제
	public void questionDelete(int question_num) throws Exception;
	
	// 문의 수정
	public void questionUpdate(questionVO vo) throws Exception;	
	
	// 회원 리스트
	public List<questionVO> questionList(PaginationVO PaginationVO) throws Exception;
	
	// 공지사항 상세보기
	public questionVO questionView(int question_num) throws Exception;	
	
	//총 게시글 개수 확인(페이징)
	public int getBoardListCnt() throws Exception;
	
	
}
