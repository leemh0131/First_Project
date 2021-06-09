package com.myproject.dao;

import java.util.List;

import com.myproject.domain.orderVO;

public interface orderDAO {
	
	//주문완료
	public void orderComplete(orderVO orderVO) throws Exception;	
	
	// 주문 목록
	public List<orderVO> orderList() throws Exception;
	
	// 회원 주문 조회
	public List<orderVO> MemberOrdList(orderVO orderVO) throws Exception;
	
	// 비회원 주문 조회
	public List<orderVO> NonOrderList() throws Exception;
	
	// 주문 상세보기
	public List<orderVO> orderView(int order_code) throws Exception;
	
	// 배송 상태
	public void delivery(orderVO vo) throws Exception;

	//취소
	public void orderDelete(int order_code) throws Exception;
	

}
