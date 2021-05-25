package com.myproject.service;

import java.util.List;

import com.myproject.domain.LikeyVO;



public interface MypageService {
	
	//찜목록
	public List<LikeyVO> list(String tbl) throws Exception;

}
