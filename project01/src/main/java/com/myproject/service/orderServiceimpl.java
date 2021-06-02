package com.myproject.service;

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

	//취소
	@Override
	public void orderDelete(int order_code) throws Exception {		
		logger.info("orderServiceimpl orderDelete() => " + order_code);
		orberDAO.orderDelete(order_code);
	}

	

	

}
