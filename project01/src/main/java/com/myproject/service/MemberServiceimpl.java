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
	
	

}