package com.myproject.controller.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.domain.MemberVO;
import com.myproject.domain.board.PaginationVO;
import com.myproject.domain.board.boardVO;
import com.myproject.service.board.boardService;


@Controller
@RequestMapping(value="/board/", produces="text/plain;charset=UTF-8")
public class boardController {

	// logger사용
	private static final Logger logger = LoggerFactory.getLogger(boardController.class);
	
	@Inject
	private boardService boardService;

	// 리스트화면
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public void list(Model model,  HttpServletRequest req,
	@RequestParam(required = false, defaultValue = "1") int page, 
	@RequestParam(required = false, defaultValue = "1") int range) throws Exception {		
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);		
		
		//전체 게시글 개수
		int listCnt = boardService.getBoardListCnt();
		
		//PaginationVO 객체생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, listCnt);		
		model.addAttribute("pagination", pagination);	
		
		//리스트형식
		List<boardVO> list = null;
		list = boardService.boardList(pagination);
		model.addAttribute("boardList", list);
		
		logger.info("BoardController list called.....");
		
	}	

	// 공지상세
	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public void boardView(@RequestParam("board_num") int board_num, HttpServletRequest req, Model model) throws Exception {
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
	 
		boardVO view = null;
		view =  boardService.boardView(board_num);		
		model.addAttribute("boardView", view);
		
		//조회수
		boardService.boardCnt(board_num);
		
	}
	
	
	// 공지수정 get
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public void boardUpdate(@RequestParam("board_num") int board_num, Model model) throws Exception {
		logger.info("boardController boardUpdate() GET => " + board_num);
		
		boardVO view = null;
		view =  boardService.boardView(board_num);
		
		model.addAttribute("boardView", view);	
	}	
	
	
	// 공지수정 get	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String postUpdate(boardVO vo) throws Exception {
	
		logger.info("boardController boardUpdate() POST => " + vo);
		boardService.boardUpdate(vo);
		
		return "redirect:/board/boardList";	
	}
	
	
	// 공지 작성 get
	@RequestMapping(value = "/boardInsert", method = RequestMethod.GET) 
	public void getboardInsert() throws Exception {
		logger.info("boardController boardInsert() GET");
	}
	
	
	// 공지 작성 POST	
	@RequestMapping(value = "/boardInsert", method = RequestMethod.POST)
	public String boardInsert(boardVO vo) throws Exception {
		logger.info("BoardController boardInsert() => " + vo);
		boardService.boardInsert(vo);
		return "redirect:/board/boardList";
	}
	
	// 게시글 삭제 GET	
	@RequestMapping(value = "boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("board_num")int board_num) throws Exception {
		boardService.boardDelete(board_num);
		return "redirect:/board/boardList";
	}
	


	

}
