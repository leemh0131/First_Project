package com.myproject.dao;

import java.util.List;

import com.myproject.domain.LikeyVO;

public interface MypageDAO {
	
	//찜목록 보기
	public List<LikeyVO> list(String tbl) throws Exception;

}
