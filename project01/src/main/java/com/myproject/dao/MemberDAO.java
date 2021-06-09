package com.myproject.dao;

import com.myproject.domain.MemberVO;

public interface MemberDAO {
	
	//로그인
	public MemberVO login(MemberVO memberVO) throws Exception;
	
	//회원가입
	public int join(MemberVO memverVO) throws Exception;
	
	//회원정보 업데이트
	public int memberUpdate(MemberVO memberVO) throws Exception;
	
	//회원정보 삭제
	public int memberDelete(MemberVO memberVO) throws Exception;
	
	//아이디 중복 체크
	public int idCheck(MemberVO memberVO) throws Exception;
	
	//이메일 중복 체크
	public boolean emailCheck(String member_email) throws Exception;
	
	//회원 비밀번호 변경
	public int updatePwMember(MemberVO memberVO) throws Exception;

	//회원 정보 수정(비밀번호 외의 것)
	public int updateMember(MemberVO memberVO) throws Exception;

	

}
