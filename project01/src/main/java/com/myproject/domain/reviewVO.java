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
public class reviewVO {
	
	private	int review_num;			// 코드
	private	int product_code ;		// 상품코드
	private int member_code;		// 회원코드
	private int review_star;		// 평별 별
	private String review_title;	// 제목
	private String review_content;	// 내용
	private	Timestamp review_date;	// 날짜
	
	private	List<reviewVO>	list;		//리스트형태로 저장
	
	public reviewVO() {
		list = new ArrayList<reviewVO>();
	}
	
	//조인
	private productVO productvo;
	private customersVO customersVO;
	
}
