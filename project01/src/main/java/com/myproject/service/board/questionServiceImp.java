package com.myproject.service.board;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.dao.board.questionDAO;
import com.myproject.domain.board.PaginationVO;
import com.myproject.domain.board.questionVO;

@Service
public class questionServiceImp implements questionService {
	
	private static final Logger logger = LoggerFactory.getLogger(questionServiceImp.class);
	
	@Inject
	private questionDAO dao;

	//문의하기
	@Override
	public void questionInsert(questionVO vo) throws Exception {
		logger.info("questionServiceImp questionInsert() => " + vo);		
		dao.questionInsert(vo);
	}

	//삭제
	@Override
	public void questionDelete(int question_num) throws Exception {
		logger.info("questionServiceImp questionDelete() => " + question_num);		
		dao.questionDelete(question_num);		
	}

	//수정
	@Override
	public void questionUpdate(questionVO vo) throws Exception {
		logger.info("questionServiceImp questionUpdate() => " + vo);		
		dao.questionUpdate(vo);
	}

	//회원리스트
	@Override
	public List<questionVO> questionList(PaginationVO PaginationVO) throws Exception {
		logger.info("questionServiceImp questionList() => " + PaginationVO);	
		return dao.questionList(PaginationVO);
	}

	//뮨의보기
	@Override
	public questionVO questionView(int question_num) throws Exception {
		logger.info("questionServiceImp questionView() => " + question_num);	
		return dao.questionView(question_num);
	}

	//문의갯수
	@Override
	public int getBoardListCnt() throws Exception {		
		logger.info("questionServiceImp 문의 갯수 가져오기");
		return dao.getBoardListCnt();
	}
	

}
