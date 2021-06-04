package com.myproject.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.domain.MemberVO;
import com.myproject.domain.productVO;
import com.myproject.domain.board.reviewVO;
import com.myproject.service.productService;
import com.myproject.service.board.reviewService;

@Controller
@RequestMapping(value="/products/", produces="text/plain;charset=UTF-8")
public class productsController {

	// logger사용
	private static final Logger logger = LoggerFactory.getLogger(productsController.class);

	@Inject
	private productService productService;	
	
	@Inject
	private reviewService reviewService;

	// 리스트화면
	@RequestMapping(value = "/productList", method = {RequestMethod.GET, RequestMethod.POST})
	public void productList(Model model, @RequestParam(value = "product_type", defaultValue = "") String product_type,
											@RequestParam(value = "keyword", defaultValue = "") String keyword) throws Exception {
		logger.info("productList GET");
		
		List<productVO> list = null;
		//해시맵 선언
		HashMap<String,String> map = new HashMap<>();
		map.put("product_type", product_type);
		map.put("keyword", keyword);
		
		//해시맵에 k v 넣기 
		list = productService.productList(map); 
		
		model.addAttribute("productList", list);
		//System.out.println("model => " + model);
	}	

	// 상품등록 get
	@RequestMapping(value = "/insertProduct", method = RequestMethod.GET)
	public void insertProductGET(productVO vo, Model model) throws Exception {
		logger.info("insertProductGET");
	}

	// 상품등록 post
	@RequestMapping(value = "/insertProduct", method = RequestMethod.POST)
	public String insertProductPost(productVO vo) throws Exception {

		logger.info("insertProductPOST" + vo);
		productService.insertProduct(vo);		
		return "redirect:/products/productList?product_type=" + vo.getProduct_type();
	}

	// 상품상세보기
	@RequestMapping(value = "/productView", method = RequestMethod.GET)
	public void productView(@RequestParam("product_code") int product_code, HttpServletRequest req, Model model) throws Exception {
		logger.info("getView() GET");
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
		
		//보기
		productVO View = null;
		View = productService.productView(product_code);
		model.addAttribute("productView", View);
		
		//조회수
		productService.updateViewCnt(product_code);
		
		//리뷰보기	
		List<reviewVO> list = null;
		list = reviewService.reviewAll(Integer.toString(product_code));
		model.addAttribute("reviewAll", list);
		
		//리뷰갯수
		int cnt = 0;
		cnt = reviewService.reviewCnt(product_code);
		model.addAttribute("reviewCnt", cnt);		
		
	}		
	
	//상품 수정 get
	@RequestMapping(value = "/updateProduct", method = RequestMethod.GET)
	public void getupdateProduct(@RequestParam("product_code") int product_code, Model model) throws Exception {
		logger.info("getupdateProduct() GET => " + product_code);
		productVO View = null;
		View = productService.productView(product_code);
		model.addAttribute("productView", View);
	}	
	
	//상품 수정 post	
	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public String postupdateProduct(productVO vo) throws Exception {
		logger.info("postupdateProduct() POST => " + vo);
		productService.updateProduct(vo);
		return "redirect:/products/productList?product_type=" + vo.getProduct_type();
	}
	
	// 게시글 삭제 GET	
	@RequestMapping(value = "deleteProduct", method = RequestMethod.GET)
	public String deleteProduct(@RequestParam("product_code")int product_code) throws Exception {
		productService.deleteProduct(product_code);
		return "redirect:/products/productListBest";
	}
	
	// 좋아요	ajax사용으로 수정필요..
	@ResponseBody
	@RequestMapping(value = "productLike", method = RequestMethod.POST)
	public String productLike(@RequestParam("product_code")int product_code) throws Exception {
		productService.productLike(product_code);
		return Integer.toString(productService.productLikeCount(product_code));
	}

}
