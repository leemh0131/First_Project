package com.myproject.dao;

import com.myproject.domain.commentVO;

public interface commentDAO {
	
	// 댓글 작성
	public void commentInsert(commentVO vo) throws Exception;
	
	// 댓글 삭제
	public void commentDelete(int comment_num) throws Exception;
	
	// 댓글 수정
	public void commentUpdate(commentVO vo) throws Exception;	
}
