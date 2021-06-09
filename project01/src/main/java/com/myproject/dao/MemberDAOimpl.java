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
	
	//회원 비밀번호 변경
	@Override
	public int updatePwMember(MemberVO memberVO) throws Exception {
		//결과를 저장할 변수 result
		int result = 0;
		
		log.info("updatePwMember DAO");
		
		//sql문의 결과값을 치환
		int a = sqlSession.update(namespace + ".updatePwMember", memberVO);
		//System.out.println("updatePwMember.sqlSession 값 : " + a);
		
		result = a ;
		
		//반환
		return result;
	}
	
	

	//회원 정보 수정(비밀번호 외의 것)
	public int updateMember(MemberVO memberVO) throws Exception {
		//결과를 저장할 변수 result
		int result = 0;
		
		log.info("updateMember DAO");
		
		//sql문의 결과값을 치환
		int a = sqlSession.update(namespace + ".updateMember", memberVO);
		//System.out.println("updateMember.sqlSession의 값 : " + a);
		
		result = a;
		
		//반환
		return result;
		
		
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
