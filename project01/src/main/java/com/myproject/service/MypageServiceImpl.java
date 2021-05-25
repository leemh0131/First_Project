package com.myproject.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.dao.MypageDAO;
import com.myproject.domain.LikeyVO;



@Service
public class MypageServiceImpl implements MypageService {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);
	
	@Inject
	private MypageDAO mypageDAO;
	
	//찜 목록
	@Override
	public List<LikeyVO> list(String tbl) throws Exception {
		logger.info("MypageService 가 일한다.");
		return mypageDAO.list(tbl);
	}
	
	

}
