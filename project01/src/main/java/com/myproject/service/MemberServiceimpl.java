package com.myproject.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myproject.dao.MemberDAO;
import com.myproject.domain.MemberVO;

import lombok.extern.java.Log;



@Log
@Service
public class MemberServiceimpl implements MemberService {
	
	@Inject
	MemberDAO memberDAO;

	//로그인
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.login(memberVO);
	}

	//회원가입
	@Override
	public int join(MemberVO memberVO) throws Exception {
		log.info("MemberServiceimpl 회원가입.....");
		return memberDAO.join(memberVO);
	}

	//중복체크
	@Override
	public int idCheck(MemberVO memberVO) throws Exception {
		log.info("MemberServiceimpl idCheck.....");
		int result = memberDAO.idCheck(memberVO);
		return result;
	}

	//이메일중복체크
	@Override
	public boolean emailCheck(String member_email) throws Exception {
		boolean result = memberDAO.emailCheck(member_email);
		return result;
	}
	

	//회원 비밀번호 변경
	@Override
	public int updatePwMember(MemberVO memberVO) throws Exception {
		//결과를 저장할 변수 result
		int result = 0;
		
		log.info("updatePwMemberService");
		
		//DAO가 1을 가져오지 못할경우 0값으로 result 처리
		result = memberDAO.updatePwMember(memberVO) == 1 ? 1 : 0;
		
		// 0또는 1 반환
		return result;
	}
	

	//회원 정보 수정(비밀번호 외의 것)
	@Override
	public int updateMember(MemberVO memberVO) throws Exception {
	//결과를 저장할 변수 result
	int result = 0;
	
	log.info("updateMemberService");
	
	//DAO가 1을 가져오지 않을경우 0 값으로 result 처리
	result = memberDAO.updateMember(memberVO) == 1 ? 1 : 0;
	
	//0또는 1 반환
	return result;
	}
	
	

}