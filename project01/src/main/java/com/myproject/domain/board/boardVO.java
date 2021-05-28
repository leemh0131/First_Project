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
public class boardVO {
	
	private	int board_num;			// 코드
	private	int board_readcount ;	// 조회수
	private String board_title;		// 제목
	private String board_content;	// 내용
	private	Timestamp board_date;	// 날짜
	
	private	List<boardVO>	list;		//리스트형태로 저장
	
	public boardVO() {
		list = new ArrayList<boardVO>();
	}	
	
	
}
