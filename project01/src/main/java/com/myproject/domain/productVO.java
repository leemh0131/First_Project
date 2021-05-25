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
public class productVO {
	
	private	int	product_code;			// 상품고유값
	private String img_view;			// 이미지미리보기
	private String img_addr;			// 이미지주소
	private int product_type;			// 상품유형(1(Outer)/2(Top)/3(Pants)/4(Accessory)/5(Shoes))
	private String product_type_name;	// 상품유형이름(1(Outer)/2(Top)/3(Pants)/4(Accessory)/5(Shoes))
	private String product_name;		// 상품명
	private int product_price;			// 가격
	private int product_read;			// 상품조회수
	private String product_content;		// 상품내용
	private int product_count;			// 갯수
	private	Timestamp product_date;		// 등록날짜
	private String product_like;		// 상품좋아요
	
	private	List<productVO>	list;		//리스트형태로 저장
	
	public productVO() {
		list = new ArrayList<productVO>();
	}
	
}
