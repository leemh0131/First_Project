package com.myproject.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.myproject.domain.orderVO;


@Repository
public class orderDAOImp implements orderDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(orderDAOImp.class);
	
	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "com.myproject.mappers.orderMapper";

	//단품주문완료
	@Override
	public void orderComplete(orderVO orderVO) throws Exception {
		logger.info("orderDAOImp orderComplete() => " + orderVO);
		sqlSession.insert(namespace + ".orderComplete", orderVO);		
	}

	//주문삭세
	@Override
	public void orderDelete(int order_code) throws Exception {
		logger.info("orderDAOImp orderDelete() => " + order_code);
		sqlSession.delete(namespace + ".orderDelete", order_code);		
	}
	
	// 주문 목록
	@Override
	public List<orderVO> orderList() throws Exception {
		return sqlSession.selectList(namespace + ".orderList");
	}
	
	// 회원 주문 조회
	@Override
	public List<orderVO> MemberOrdList(orderVO orderVO) throws Exception {
		return sqlSession.selectList(namespace + ".MemberOrdList", orderVO);
	}
	
	// 비회원 주문 조회
	@Override
	public List<orderVO> NonOrderList() throws Exception {
		return sqlSession.selectList(namespace + ".NonOrderList");
	}
	
	// 주문 상세보기
	@Override
	public List<orderVO> orderView(int order_code) throws Exception {
		return sqlSession.selectList(namespace + ".orderView", order_code);
	}
	
	// 배송 상태
	@Override
	public void delivery(orderVO vo) throws Exception {
		sqlSession.update(namespace + ".delivery", vo);
	}	

}
