package com.myproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myproject.domain.MemberVO;
import com.myproject.service.MemberService;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/member") // 공통적인 url 매핑
public class MemberController {

	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	//-------------------------------------------------------------------------------------------------
	@Inject
	MemberService memberService;
		
	  @RequestMapping(value="/join", method=RequestMethod.GET) 
	  public String join() throws Exception { 
		  logger.info("join get.."); 
		  return "/member/join"; //
	  }
	 	
	  @RequestMapping(value="/login", method=RequestMethod.GET) 
	  public String login() throws Exception { 
		  logger.info("login get.."); 
		  return "/member/login";
	  }
	   
	  @RequestMapping(value="/login", method=RequestMethod.POST) 
	  public String login(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception { 
		  logger.info("login post.."); 

		  HttpSession session = req.getSession();
		  
		  MemberVO login = memberService.login(memberVO);
		  logger.info("MemberController Return Value " + login);
		  
	  	  //해당하는 회원정보가 없으면
		  if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
	  	  } else {
			// 로그인이 정상이라면 세션을 발급한다.
	  		System.out.println("로그인 완료: memberVO.getMember_id()" + "-" + memberVO.getMember_id());  
			session.setAttribute("member", login);
			//return "/member/login";
		  }
		    return "redirect:/";		  
		 
	  }
	   

}
