package com.myproject.service.board;

import java.util.List;

import com.myproject.domain.board.boardVO;
import com.myproject.domain.board.questionVO;

public interface questionService {
	
		// 문의 작성
		public void questionInsert(questionVO vo) throws Exception;
		
		// 문의 삭제
		public void questionDelete(int question_num) throws Exception;
		
		// 문의 수정
		public void questionUpdate(questionVO vo) throws Exception;	
		
		// 관리자 리스트
		public List<questionVO> questionAllList(String tbl) throws Exception;
		
		// 회원 리스트
		public List<questionVO> questionList(String tbl) throws Exception;
		
		// 문의보기
		public questionVO questionView(int question_num) throws Exception;	
		
}
