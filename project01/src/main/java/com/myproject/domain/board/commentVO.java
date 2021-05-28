package com.myproject.domain.board;

import java.sql.Timestamp;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class commentVO {
	
	private int 			comment_num; //답변번호
	private int 			question_num; //문의번호
	private String			comment_content; //내용
	private String 			comment_title; //제목
	private Timestamp		comment_date; //날짜

}
