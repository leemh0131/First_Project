package com.myproject.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class BasketVO {
	
	private int 			bno;
	private int 			member_code;
	private int 			product_code;
	private int 			basket_count;
	private int 			basket_price;
	private Timestamp 		register_date;
	
	private List<BasketVO> 	list;
	
	public BasketVO() {
		list = new ArrayList<BasketVO>();
	}
}
