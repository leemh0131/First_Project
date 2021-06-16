package com.myproject.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {		
	
	private int member_code; //번호 
	private String member_id; //아이디
	private String member_pw; //패스워드
	private String new_member_pw; // 새로 변경할 패스워드
	private String member_name; // 이름
	private String member_addr1; //주소
	private String member_addr2; //상세주소
	private String member_tel; //전화번호
	private String member_email; //이메일
	private String mobile;
	private String post_no; //우편번호
	private int mgender; //성별
	private int mlevel; //유저레벨
	private String mbirth; // 생일
	private String mcreate; // 가입일
	private String change_passwd_date; // 암호 변경
	private String del_Check_word; //회원 탈퇴시 "회원탈퇴"쓰게 하기 위해
	
	private String member_tel1; // 암호 변경일
	private String member_tel2; // 암호 변경일
	private String member_tel3; // 암호 변경일
	
	private String mobile1; // 암호 변경일
	private String mobile2; // 암호 변경일
	private String mobile3; // 암호 변경일
		
	public MemberVO () {}

}
