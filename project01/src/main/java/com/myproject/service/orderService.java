package com.myproject.service;

import com.myproject.domain.orderVO;

public interface orderService {	
		
	//주문완료
	public void orderComplete(orderVO orderVO) throws Exception;	
	
	//취소
	public void orderDelete(int order_code) throws Exception;

}
