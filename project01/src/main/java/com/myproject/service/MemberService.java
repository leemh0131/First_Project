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
	
	//회원 비밀번호 변경
	public int updatePwMember(MemberVO memberVO) throws Exception;

	//회원 정보 수정(비밀번호 외의 것)
	public int updateMember(MemberVO memberVO) throws Exception;
	
	//회원정보 수정 (로그인 후 헤더메뉴에서 회원정보 수정메뉴)
	public int memberUpdate(MemberVO memberVO) throws Exception;
	
	//패스워드 변경주기 검사
	public int pwChangeCheck(String member_id) throws Exception;
	
	//비밀번호 변경
	public int pwChange(MemberVO memberVO) throws Exception;
	
	//비밀번호 체크
	public int pwCheck(MemberVO memberVO) throws Exception;
	
	//회원 탈퇴
	public int memberDelete(MemberVO memberVO) throws Exception;


}
