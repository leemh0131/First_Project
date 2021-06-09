package com.myproject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myproject.domain.MemberVO;
import com.myproject.domain.orderVO;
import com.myproject.domain.productVO;
import com.myproject.service.orderService;
import com.myproject.service.productService;

@Controller
@RequestMapping(value="/order", produces="text/plain;charset=UTF-8")
public class orderController {

	// logger사용
	private static final Logger logger = LoggerFactory.getLogger(orderController.class);
	
	@Inject
	productService productService;
	
	@Inject
	orderService orderService;
	
	// 주문
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public void order(Model model, HttpServletRequest req, @RequestParam("product_code") int product_code) throws Exception {	
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();			
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		//보기
		productVO View = null;
		View = productService.productView(product_code);
		model.addAttribute("productView", View);
		
	}
	
	// 결제완료
	@RequestMapping(value = "/orderComplete", method = {RequestMethod.GET, RequestMethod.POST})
	public void orderComplete(Model model, HttpServletRequest req, orderVO vo) throws Exception {	
		
		logger.info("orderController orderComplete()일한다.");
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();			
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		orderService.orderComplete(vo);			
		}		
	
	
	//주소찾기
	@RequestMapping(value = "/jusoPopup", method = {RequestMethod.GET, RequestMethod.POST})
	public void jusoPopup() throws Exception {
		
	}
	
	// 약관동의
	@RequestMapping(value = "/buyCheck", method = RequestMethod.GET)
	public void buyCheck() throws Exception {
			
	}
	
	// 관리자 주문조회 (전체 주문)
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public String orderList(Model model) throws Exception {
		logger.info("get orderList");
		List<orderVO> orderList;
		orderList = orderService.orderList();
		model.addAttribute("orderList",orderList);
		
		return "/order/orderList";
		
	}
	
	// 회원 주문 조회 (특정 회원) 
	@RequestMapping(value = "/MemberOrdList", method = RequestMethod.GET)
	public String MemberOrdList(HttpServletRequest req, Model model) throws Exception {
			logger.info("get MemberOrdList");
			HttpSession session = req.getSession();
	
			MemberVO member = (MemberVO)session.getAttribute("member");
			int member_code = member.getMember_code();
			System.out.println(member_code);
			
			orderVO orderVO = new orderVO();
			orderVO.setMember_code(member_code);
			logger.info(orderVO.toString());
			List<orderVO> MemberOrdList;
			MemberOrdList = orderService.MemberOrdList(orderVO);
			
			//logger.info("aaaa = " + MemberOrdList.get(0).getDelivery_name());
			model.addAttribute("MemberOrdList", MemberOrdList);		
			
			return "/order/MemberOrdList";
	}
	
		
	// 비회원 주문 조회
	@RequestMapping(value = "/NonMemberOrdList", method = RequestMethod.GET)
	public String NonOrderList(Model model) throws Exception {
		logger.info("get NonOrderList");
//			List<OrderVO> NonOrderList;
//			NonOrderList = service.NonOrderList();
//			model.addAttribute("NonOrderList",NonOrderList);
		
		return "/order/NonMemberOrdList";
		
	}
	
	// 주문 상세보기
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public String orderView(HttpServletRequest req, 
							@RequestParam("order_code") int order_code,
							Model model) throws Exception {
		logger.info("get orderView");
		
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		model.addAttribute("member", member);
		
		System.out.println(member);	
		
		List<orderVO> orderView;
		orderView = orderService.orderView(order_code);
		model.addAttribute("orderView", orderView);
		
		return "/order/orderView";

	}
	
	// 주문 상세 목록 - 배송 상태 변경
	@RequestMapping(value = "/orderView", method = RequestMethod.POST)
	public String delivery(orderVO vo) throws Exception {
		logger.info("update status =>" + vo);
		
		orderService.delivery(vo);
		
		return "redirect:/order/orderView?order_code=" + vo.getOrder_code();
			
	}







}
