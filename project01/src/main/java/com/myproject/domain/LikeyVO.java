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
public class LikeyVO {
	
	private int 			member_code;
	private int 			product_code;
	private String			img_view;
	private String 			product_name;
	private int				product_price;
	private Timestamp		register_date;
	private List<LikeyVO> 	list;
	
	
	public LikeyVO() {					//생성자
		list = new ArrayList<LikeyVO>();
	}
	
	
	

}
