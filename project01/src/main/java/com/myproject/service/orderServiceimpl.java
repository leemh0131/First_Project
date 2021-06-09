package com.myproject.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.dao.orderDAO;
import com.myproject.domain.orderVO;




@Service
public class orderServiceimpl implements orderService {
	
	@Inject	
	orderDAO orberDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(orderServiceimpl.class);

	//단품구매
	@Override
	public void orderComplete(orderVO orderVO) throws Exception {		
		logger.info("orderServiceimpl orderComplete() => " + orderVO);
		orberDAO.orderComplete(orderVO);
	}
	
	// 주문 목록
	@Override
	public List<orderVO> orderList() throws Exception {
		return orberDAO.orderList();
	}	
	
	// 회원 주문 조회
	@Override
	public List<orderVO> MemberOrdList(orderVO orderVO) throws Exception {
		return orberDAO.MemberOrdList(orderVO);
	}
	
	// 비회원 주문 조회
	@Override
	public List<orderVO> NonOrderList() throws Exception {
		return orberDAO.NonOrderList();
	}
	
	// 주문 상세보기
	@Override
	public List<orderVO> orderView(int order_code) throws Exception {
		return orberDAO.orderView(order_code);
	}
	
	// 배송 상태
	@Override
	public void delivery(orderVO vo) throws Exception {
		orberDAO.delivery(vo);
	}

	//취소
	@Override
	public void orderDelete(int order_code) throws Exception {		
		logger.info("orderServiceimpl orderDelete() => " + order_code);
		orberDAO.orderDelete(order_code);
	}

	

	

}
