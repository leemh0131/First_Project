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
public class orderVO {
	
	private int 			order_code;		//주문코드
	private int 			member_code;	//회원
	private int 			product_code;	//상품코드
	private int				order_count;	//갯수
	private int 			total_price;	//총가격
	private String			order_status;	//배송현황
	private Timestamp		order_date;		//날짜
	private String 			delivery_name;	//이름
	private String 			roadFullAddr;	//주소	
	
	private List<orderVO> 	list;	
	
	public orderVO() {					//생성자
		list = new ArrayList<orderVO>();
	}

}
