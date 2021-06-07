package com.myproject.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myproject.domain.MemberVO;

import lombok.extern.java.Log;

@Log
@Repository
public class MemberDAOimpl implements MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace= "com.myproject.mappers.memberMapper";

	//로그인
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".login", memberVO);
	}

	//회원가입
	@Override
	public int join(MemberVO memverVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".join", memverVO);
	}

	@Override
	public int memberUpdate(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int memberDelete(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	//중복체크
	@Override
	public int idCheck(MemberVO memberVO) throws Exception {
		log.info("MemberDAOimpl idCheck.....");
		return sqlSession.selectOne(namespace + ".idCheck", memberVO);
	}
	
	//이메일 중복체크
	@Override
	public boolean emailCheck(String member_email) throws Exception {
		log.info("MemberDAOimpl idCheck.....");
		String memberEmail = sqlSession.selectOne("member.emailCheck", member_email);
		
		return (memberEmail==null)? true : false;
	}

}
