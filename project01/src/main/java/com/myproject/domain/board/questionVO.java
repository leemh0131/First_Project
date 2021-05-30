package com.myproject.domain.board;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class questionVO {
		
	private int 			question_num; //문의번호
	private String 			member_code; //회원코드
	private String 			member_name; //회원이름
	private	String 			member_id ;		//회원아디
	private String			question_title; //제목
	private String 			question_content; //내용
	private Timestamp		question_date; //날짜
	private int 			comment_num; //답변번호
	private String			comment_content; //내용
	private String 			comment_title; //제목
	private Timestamp		comment_date; //날짜
	
	private	List<questionVO>	list;		//리스트형태로 저장
	
	public questionVO() {
		list = new ArrayList<questionVO>();
	}

}
