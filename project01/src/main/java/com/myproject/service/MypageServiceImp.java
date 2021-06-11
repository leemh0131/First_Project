package com.myproject.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.dao.MypageDAO;
import com.myproject.domain.BasketVO;
import com.myproject.domain.LikeyMonthVO;
import com.myproject.domain.LikeyVO;
import com.myproject.domain.MemberDateVO;
import com.myproject.domain.TestBean;
import com.myproject.domain.orderVO;



@Service
public class MypageServiceImp implements MypageService {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageServiceImp.class);
	
	@Inject
	private MypageDAO mypageDAO;
	
	//찜 목록
	@Override
	public List<LikeyVO> likeyList(LikeyVO likeyVO) throws Exception {
		logger.info("MypageService => likeyList 가 일한다.🔥🔥🔥");
		return mypageDAO.likeyList(likeyVO);
	}
	
	//최근 한 달간 찜목록
	@Override
	public List<LikeyMonthVO> likeyListMonth(int member_code) throws Exception {
		logger.info("mypageService => 최근 한달간 찜목록 service");
		return mypageDAO.likeyListMonth(member_code);
	}
	
	//찜목록 삭제
	@Override
	public void deleteLikey(LikeyVO likeyvo) throws Exception{
		mypageDAO.deleteLikey(likeyvo);
	}
	
	//장바구니 목록
	@Override
	public List<BasketVO> basketList(BasketVO basketVO) throws Exception {
		logger.info("MypageService => basketList 가 일한다.🔥🔥🔥");
		return mypageDAO.basketList(basketVO);
	}
	
	//장바구니 목록 삭제
	@Override
	public void deleteBasket(BasketVO basketVO) throws Exception {
		mypageDAO.deleteBasket(basketVO);
	}
	
	//주문내역 보기
	@Override
	public List<orderVO> orderList(orderVO orderVO) throws Exception {
		logger.info("MypageService => orderList 가 일함.");
		return mypageDAO.orderList(orderVO);
	}
	
	//한 달간 주문내역 보기
	@Override
	public List<orderVO> orderListMonth(orderVO orderVO) throws Exception {
		logger.info("MypageService => orderListMonth ");
		return mypageDAO.orderListMonth(orderVO);
	}
	
	//날짜를 설정하여 주문목록을 가져온다.
	@Override
	public List<orderVO> getDateList(MemberDateVO memberdateVO) throws Exception {
		logger.info("mypageService => getDateList");
		return mypageDAO.getDateList(memberdateVO);
	}
	
	//주문목록 상세보기
	@Override
	public TestBean ordersDetailView(orderVO orderVO) throws Exception {
		logger.info("mypageService => ordersDetailView");
		return mypageDAO.ordersDetailView(orderVO);
	}

	//장바구니 추가
	@Override
	public int likeyInsert(LikeyVO likeyVO) throws Exception {
		logger.info("mypageService => likeyInsert");
		return mypageDAO.likeyInsert(likeyVO);
	}
	
	

}
