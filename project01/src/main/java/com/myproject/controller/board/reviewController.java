package com.myproject.controller.board;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myproject.domain.MemberVO;
import com.myproject.domain.board.reviewVO;
import com.myproject.service.board.reviewService;
import com.myproject.utils.UploadFileUtils;

@Controller
@RequestMapping(value="/review/", produces="text/plain;charset=UTF-8")
public class reviewController {

	// logger사용
	private static final Logger logger = LoggerFactory.getLogger(reviewController.class);
	
	@Inject
	private reviewService reviewService;
	
	//이미지폴더가져오기
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 리뷰작성 get
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.GET) 
	public void getreviewWrite(@RequestParam("product_code")int product_code, Model model, HttpServletRequest req) throws Exception {		
		logger.info("reviewController reviewWrite() GET" + product_code);
		model.addAttribute("product_code", product_code);
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		model.addAttribute("member", memberVO);
	}	
	
	// 리뷰작성 POST	RequestMethod.POST
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public String reviewWrite(reviewVO vo, MultipartFile file,@RequestParam("product_code")int product_code) throws Exception {
		
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 첨부파일이 있으면
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			// img 파일저장
			vo.setReview_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// Timg 파일저장
			vo.setReview_Timg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);		
			
		} else {
			// 첨부파일이 없으면 놉 파일을 설정.			
			fileName = File.separator + "images" + File.separator + "none.png";
			vo.setReview_img(fileName);
			vo.setReview_Timg(fileName);
			System.out.println("fileName nnnnnooooooo = " + fileName);
		}

		
		logger.info("reviewController reviewWrite() => " + vo);
		reviewService.reviewWrite(vo);
		
				
		return "redirect:/products/productView?product_code=" + product_code;
	}
	
	// 리뷰삭제	
	@RequestMapping(value = "reviewdelete", method = RequestMethod.GET)
	public String reviewdelete(@RequestParam("review_num")int review_num) throws Exception {
		reviewService.reviewdelete(review_num);
		return "redirect:/";
	}

}
