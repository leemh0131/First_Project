package com.myproject.dao.board;

import java.util.List;

import com.myproject.domain.board.commentVO;

public interface commentDAO {
	
	// 답글 보기
	public List<commentVO> commentList(int question_num) throws Exception;
	
	// 답글 작성
	public int commentInsert(commentVO vo) throws Exception;
	
	// 답글 수정
	public int commentUpdate(commentVO vo) throws Exception;	
	
	// 답글 삭제
	public int commentDelete(int comment_num) throws Exception;
		
}
