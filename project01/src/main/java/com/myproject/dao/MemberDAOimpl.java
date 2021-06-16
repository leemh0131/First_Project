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

	//회원정보 수정 (로그인 후 헤더메뉴에서 회원정보 수정메뉴)
	@Override
	public int memberUpdate(MemberVO memberVO) throws Exception {
		log.info("memberDAOimpl memberUpdate....");
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".update", memberVO);
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

	//회원 탈퇴
	@Override
	public int memberDelete(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".memberDelete", memberVO);
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
		String memberEmail = sqlSession.selectOne(namespace+".emailCheck", member_email);
		
		return (memberEmail==null)? true : false;
	}

	//패스워드 변경주기 체크
	@Override
	public int pwChangeCheck(String member_id) throws Exception {
		log.info("MemberDAOimpl pwChangeCheck.....");
		int Result = sqlSession.selectOne(namespace+".pwChangeCheck", member_id);		
		return Result;
	}

	//비밀번호 변경
	@Override
	public int pwChange(MemberVO memberVO) throws Exception {
		log.info("MemberDAOimpl pwChange.....");		
		
		return sqlSession.update(namespace+".pwChange", memberVO);
	}

	@Override
	public int pwCheck(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne(namespace+".pwCheck", memberVO);	
		return  result;
	}
	
	

}
