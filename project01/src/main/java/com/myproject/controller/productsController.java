package com.myproject.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.myproject.domain.productVO;
import com.myproject.service.productService;

@Controller
@RequestMapping(value="/products/", produces="text/plain;charset=UTF-8")
public class productsController {

	// logger사용
	private static final Logger logger = LoggerFactory.getLogger(productsController.class);

	@Inject
	private productService productService;
	
	
//	//리스트화면
//	 
//	@RequestMapping(value="/productList",method=RequestMethod.GET)
//	public void	productList(Model model) throws Exception { logger.info("productList GET");
//	
//	List<productVO> list = null; list =
//	productService.productList("productList");
//	model.addAttribute("productList",list);
//	 
//	}

	// 리스트화면
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public void productList(Model model, @RequestParam("product_type") String product_type) throws Exception {
		logger.info("productList GET");

		List<productVO> list = null;
		list = productService.productList(product_type);
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

		logger.info("insertProductGET" + vo);

		productService.insertProduct(vo);
		

		return "redirect:/products/productList?product_type=" + vo.getProduct_type();
	}

	// 상품상세보기
	@RequestMapping(value = "/productView", method = RequestMethod.GET)
	public void productView(@RequestParam("product_code") int product_code, Model model) throws Exception {
		logger.info("getView() GET");
		
		//보기
		productVO View = null;
		View = productService.productView(product_code);
		model.addAttribute("productView", View);
		
		//조회수
		productService.updateViewCnt(product_code);
		
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
		return "redirect:/";
	}
	
	// 좋아요	ajax사용으로 수정필요..
	@RequestMapping(value = "productLike", method = RequestMethod.GET)
	public String productLike(@RequestParam("product_code")int product_code) throws Exception {
		productService.productLike(product_code);
		return "redirect:/products/productView?product_code=" + product_code;
	}

}
