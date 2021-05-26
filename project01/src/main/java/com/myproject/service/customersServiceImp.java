package com.myproject.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myproject.dao.customersDAO;






@Service
public class customersServiceImp implements customersService {
	
	private static final Logger logger = LoggerFactory.getLogger(customersServiceImp.class);
	
	@Inject
	private customersDAO dao;
	
	

}
