package com.myproject.dao;

import java.util.List;

import com.myproject.domain.BasketVO;
import com.myproject.domain.LikeyMonthVO;
import com.myproject.domain.LikeyVO;
import com.myproject.domain.MemberDateVO;
import com.myproject.domain.TestBean;
import com.myproject.domain.orderVO;
import com.myproject.domain.productVO;

public interface MypageDAO {
	
	//찜목록 추가
	public int likeyInsert(LikeyVO likeyVO) throws Exception;
	
	//장바구니 추가
	//public void basketInsert(LikeyVO likeyVO) throws Exception;
	
	//찜목록 보기
	public List<LikeyVO> likeyList(LikeyVO likeyVO) throws Exception;
	
	//찜목록 삭제
	public void deleteLikey(LikeyVO likeyvo) throws Exception;
	
	//최근 한 달간 찜목록 보기
	public List<LikeyMonthVO> likeyListMonth(int member_code) throws Exception;
	
	//장바구니 목록 보기
	public List<BasketVO> basketList(BasketVO basketVO) throws Exception;
	
	//장바구니 목록 삭제
	public void deleteBasket(BasketVO basketVO) throws Exception;
	
	//주문내역 보기
	public List<orderVO> orderList(orderVO ordersVO) throws Exception;

	//최근 한 달 주문내역 보기
	public List<orderVO> orderListMonth(orderVO ordersVO) throws Exception;
	
	//날짜를 설정하여 주문목록을 가져온다.
	public List<orderVO> getDateList(MemberDateVO memberdateVO) throws Exception;
	
	//주문목록 상세보기
	public TestBean ordersDetailView(orderVO ordersVO) throws Exception;

}
