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
	private String member_name; // 이름
	private String member_addr; //주소
	private String member_tel; //전화번호
	private String member_email; //이메일
	private int post_no; //우편번호
	private int mgender; //성별
	private int mlevel; //유저레벨
	private String mbirth; // 생일
	private String mcreate; // 가입일
	private String change_passwd_date; // 암호 변경일
		
	public MemberVO () {}

}
