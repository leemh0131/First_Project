package com.myproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
	//회원가입
	  @RequestMapping(value="/join", method=RequestMethod.GET) 
	  public String join() throws Exception { 
		  System.out.println("회원가입페이지");
		  logger.info("join get.."); 
		  return "/member/join"; //
	  }
	 	
	  @RequestMapping(value="/login", method=RequestMethod.GET) 
	  public String login() throws Exception { 
		  logger.info("login get.."); 
		  return "/member/login";
	  }
	   
	  //로그인
	  @RequestMapping(value="/login", method=RequestMethod.POST) 
	  public String login(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception { 
		  logger.info("login post.."); 

		  HttpSession session = req.getSession();
		  
		  MemberVO login = memberService.login(memberVO);
		  logger.info("MemberController Return Value " + login);
		  
	  	  //해당하는 회원정보가 없으면
		  if(login == null) {
			session.setAttribute("member", null);
			//rttr.addFlashAttribute("msg", false);
			rttr.addFlashAttribute("msg", "로그인에 실패하였습니다.");
			
	  	  } else {
			// 로그인이 정상이라면 세션을 발급한다.
	  		System.out.println("로그인 완료: memberVO.getMember_id()" + "-" + memberVO.getMember_id());  
			session.setAttribute("member", login);
			//return "/member/login";
		  }
		    return "redirect:/";		  
		 
	  }
	   
	  //아이디 중복검사
	  @ResponseBody
	  @RequestMapping(value="/idCheck", method=RequestMethod.POST)
	  public int idCheck(MemberVO memberVO) throws Exception{
		  System.out.println("idCheck.....memberController");
		  log.info("memberController idCheck.....");
		  
		  int result = memberService.idCheck(memberVO);
		  
		  log.info("MemberController idCheck Return Value [" + result + "]");
		  
		  /*
		  MemberVO resultMember = new MemberVO();
		  if(0 < result) {
			  resultMember.setMember_id(memberVO.getMember_id());
		  }
		  */
		  
		  return result;
	  }
	  
	  //회원가입 post
	  //@RequestMapping(value="/join", method=RequestMethod.POST)
	  @RequestMapping(value="/joinForm", method=RequestMethod.POST)
	  public String postJoin(MemberVO memberVO) throws Exception{
		  log.info("post 회원가입");
		  
		 
		  //아이디가 있는지 검사
		  int result = memberService.idCheck(memberVO);
		  
		  log.info("11 : " + result);
	
		  if(result == 1) {
			  return "redirect:/member/join";
		  }
		  else if(result == 0) {
			  
			  log.info("22 : " + memberVO.getMember_addr1());
			  
			  String mobile = memberVO.getMobile1() + memberVO.getMobile2() + memberVO.getMobile3();
			  memberVO.setMobile(mobile);
			  
			  String member_tel = memberVO.getMember_tel1() + memberVO.getMember_tel2() + memberVO.getMember_tel3();
			  memberVO.setMember_tel(member_tel);
			  
			  log.info("33 : " + result);
			  
			  memberService.join(memberVO);
			  
			  log.info("44 : " + result);
			  
		  }
		  
		  return "redirect:/";
	  }

	  //우편번호
	  @RequestMapping(value="address", method=RequestMethod.GET)
	  public String adress() throws Exception{
		  return "/member/join";
	  }
	  
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET) 
	public String headerlogout(HttpServletRequest req) throws Exception { 
		
		HttpSession session = req.getSession();
		session.invalidate();
		System.out.println("로그아웃");
		
		return "redirect:/";
			 
		}
   

}
