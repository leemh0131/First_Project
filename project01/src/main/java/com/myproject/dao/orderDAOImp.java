package com.myproject.dao;

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

	

}
