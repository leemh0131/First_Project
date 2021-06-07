package com.myproject.service;

import com.myproject.domain.MemberVO;

public interface MemberService {	
		
	//로그인
	public MemberVO login(MemberVO memberVO) throws Exception;	
	
	//회원가입
	public int join(MemberVO memberVO) throws Exception;
	
	//아이디 중복 검사
	public int idCheck(MemberVO memberVO) throws Exception;
	
	//이메일 중복 검사
	public boolean emailCheck(String member_email) throws Exception;

}
