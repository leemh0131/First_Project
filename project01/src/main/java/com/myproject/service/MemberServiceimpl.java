package com.myproject.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myproject.dao.MemberDAO;
import com.myproject.domain.MemberVO;



@Service
public class MemberServiceimpl implements MemberService {
	
	@Inject
	MemberDAO memberDAO;

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.login(memberVO);
	}

	@Override
	public MemberVO join(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
