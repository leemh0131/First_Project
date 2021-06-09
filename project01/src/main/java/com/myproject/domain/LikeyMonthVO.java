package com.myproject.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class LikeyMonthVO {
	private String 			img_view;
	private String 			product_name;
	private int 			product_price;
	private Timestamp		register_date;
}