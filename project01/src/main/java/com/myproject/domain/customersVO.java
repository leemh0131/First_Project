package com.myproject.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@ToString
public class customersVO {
	
	private	int member_code;			// 코드
	private	String member_id ;			// 회원아이디
	private String member_pw;			// 회원비번
	private String member_name;			// 이름
	private String member_addr;			// 주소
	private String member_email;		// 이메일
	private Timestamp member_birth;		// 생일
	private String member_gender;		// 성별
	private String member_phone;		// 번호
	private int member_level;			// 관리자 식별	
	private	Timestamp member_join;		// 회원가입 날자
	
	private	List<customersVO>	list;	//리스트형태로 저장
	
	public customersVO() {
		list = new ArrayList<customersVO>();
	}
	
}
