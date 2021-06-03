package com.myproject.domain.board;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.myproject.domain.MemberVO;
import com.myproject.domain.productVO;

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
	private String product_name;	// 상품이름
	private String member_name;		// 회원이름
	private String review_img;		// 리뷰사진
	private String review_Timg;		// 썸네일리뷰사진
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
	private MemberVO membervo;
	
}
