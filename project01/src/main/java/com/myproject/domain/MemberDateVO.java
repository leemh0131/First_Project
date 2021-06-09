package com.myproject.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class MemberDateVO {
	
	private String	 from_date;
	private String 	 to_date;
	private int 	 member_code;
	
	private List<MemberDateVO> list;
	
	public MemberDateVO() {
		list = new ArrayList<MemberDateVO>();
	}
}
