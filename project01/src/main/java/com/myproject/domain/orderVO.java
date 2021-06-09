package com.myproject.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class orderVO {
	
	private int 			order_code;			// 주문번호
	private int 			member_code;		// 회원번호
	private int 			product_code;		// 상품번호
	private int 			order_count;		// 주문수량
	private int 			total_price;		// 주문합계
	private String			delivery_name;		// 수령인
	private String			roadFullAddr;		// 주소
	private String 			delivery_tel;		// 전화번호
	private String			order_status;		// 주문상태
	private Date			order_date;			// 주문날짜
	
	private String			product_name;		// 상품명
	private String			product_content;	// 상품내용
	private int				product_price;		// 상품가격
	private String			img_view;			// 이미지
	private String			member_id;			// 회원ID
	
	private List<orderVO> 	list;	
	
	public orderVO() {					//생성자
		list = new ArrayList<orderVO>();
	}

}
