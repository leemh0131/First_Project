package com.myproject.service;

import com.myproject.domain.MemberVO;

public interface MemberService {	
		
	//로그인
	public MemberVO login(MemberVO memberVO) throws Exception;	
	
	//회원가입
	public MemberVO join(MemberVO memberVO) throws Exception;

}
