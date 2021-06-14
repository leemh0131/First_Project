package com.myproject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.domain.BasketVO;
import com.myproject.domain.LikeyVO;
import com.myproject.domain.MemberDateVO;
import com.myproject.domain.MemberVO;
import com.myproject.domain.TestBean;
import com.myproject.domain.orderVO;
import com.myproject.domain.productVO;
import com.myproject.service.MemberService;
import com.myproject.service.MypageService;
import com.myproject.utils.ScriptUtils;



@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Inject
	MypageService mypageService;
	
	@Inject
	MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	/*
	//마이페이지 get
	@RequestMapping(value="/main", method= RequestMethod.GET)
	public void getMypageMain(Model model) throws Exception {
		logger.info("Mypage 가 컨트롤러에 의해 get 실행");
		model.addAttribute("Mypage", "마이페이지 입니다.");		
	}
	
	//마이페이지 post
	@RequestMapping(value="/main", method= RequestMethod.POST)
	public String postMypageMain(Model model) throws Exception {
		logger.info("Mypage 가 컨트롤러에 의해 post 실행");
		model.addAttribute("Mypage", "마이페이지 입니다.");
		return "redirect:/mypage/main";
	}
	*/
	
	
	//찜 목록 보기
	@RequestMapping(value="/likey", method=RequestMethod.GET)
	public void getLikeyList(Model model, HttpServletRequest req, LikeyVO likeyVO) throws Exception {
		logger.info("likey 페이지가 컨트롤러에 의해 GET 실행");
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); //memberVO는 세션
		model.addAttribute("member", memberVO);
		
		int member_code = memberVO.getMember_code();
		
		if(memberVO != null) { //세션이 붙어있는상태
			
			//likeyVO에 세션 member_code를 부여.
			likeyVO.setMember_code(member_code);
			
			//리스트 생성
			List<LikeyVO> list = null;
			
			//서비스에 전달
			list = mypageService.likeyList(likeyVO);
			
			//화면으로 전달
			model.addAttribute("likey_list", list);
		}
		
	}
	
	//찜 목록 리스트 삭제
	@ResponseBody
	@RequestMapping(value="/delete_likey", method=RequestMethod.POST)
	public int postLikeyListDelete(@RequestParam("selected_item[]") List<String> selected_item, LikeyVO likeyVO, HttpServletRequest req) throws Exception {
		
		logger.info("delete_likey 컨트롤러가 실행");
		
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); //memberVO는 세션
		int member_code = memberVO.getMember_code();
		
		int result = 0;
		int likeyBno = 0;
		
		if(memberVO != null) {
			likeyVO.setMember_code(member_code);
			
			for(String i : selected_item) {		//selected_item 의 값을 차례로 for문에서 사용.
				likeyBno = Integer.parseInt(i); 		//selected_item 요소들을 int로 변환하여 cartBno에 넣어줌
				likeyVO.setBno(likeyBno);			//LikeyVO에 cartBno를 넣어줌
				mypageService.deleteLikey(likeyVO);	//서비스로 넘김.
				//System.out.println("값 : " + likeyBno);
			}
			result = 1;
		}
		return result;
	}
	
	//장바구니 리스트 보기
	@RequestMapping(value="/basket", method=RequestMethod.GET)
	public void getBasketList(/*@RequestParam("name[]") List<String> name, @RequestParam("price[]") List<String> price,*/Model model, HttpServletRequest req, BasketVO basketVO) throws Exception {
		logger.info("basket 페이지가 컨트롤러에 의해 실행");
		
		//로그인세션가져오기
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); //memberVO는 세션
		model.addAttribute("member", memberVO);
		int member_code = memberVO.getMember_code();
		
		/*
		List<String> product_name = null;
		List<String> basket_price = null;
		*/
		
		if(memberVO != null) { //세션이 붙어있는상태
			basketVO.setMember_code(member_code);
			List<BasketVO> list = null;
			list = mypageService.basketList(basketVO);
			model.addAttribute("basket_list", list);
			/*
			for(String i : name) {
				for(String j : price) {
					product_name = i;
				}
			}*/
				
			
		}
	}
	
	//장바구니 리스트 삭제
	@ResponseBody
	@RequestMapping(value="/delete_basket", method=RequestMethod.POST)
	public int postBasketListDelete(@RequestParam("selected_item[]") List<String> selected_item, BasketVO basketVO,  HttpServletRequest req) throws Exception {
		logger.info("delete_basket 컨트롤러가 실행");
		
		//로그인세션가져오기		  
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); //memberVO는 세션
		int member_code = memberVO.getMember_code();
			
		int result = 0;
		int basketBno = 0;
			
		if(memberVO != null) {  //세션이 붙어있는 상태
			basketVO.setMember_code(member_code);
			
			for(String i : selected_item) {	 			//selected_item 의 값을 차례로 for문에서 사용.
				basketBno = Integer.parseInt(i);		//select_item 요소들을 int 로 변환하여 basketBno에 넣어줌
				basketVO.setBno(basketBno);				//BasketVO에 BasketBno를 넣어줌
				mypageService.deleteBasket(basketVO);	//서비스로 넘김.
				//System.out.println("값 : " + basketBno);
			}
			result = 1;
		}
		return result;
	}
		
	//주문내역 보기 get
	@RequestMapping(value="/order", method=RequestMethod.GET)
	public void getOrderList(Model model, HttpServletRequest req, orderVO orderVO) throws Exception {	
		
		//로그인세션가져오기
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); //memberVO는 세션
		model.addAttribute("member", memberVO);
		
		//세션에서 받아온 member_code
		int member_code = memberVO.getMember_code();

		
		if(memberVO != null) { //세션이 붙어있는상태
			
			orderVO.setMember_code(member_code);  //ordersVO 에 회원코드를 현재 세션값의 member_code로 가져옴
			List<orderVO> list = null;
			list = mypageService.orderList(orderVO);
			model.addAttribute("order_list", list);
		}		
	}
	
	//주문내역 보기 post(날짜 설정하여 주문내역 보기)
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public void postOrderList(Model model, HttpServletRequest req, MemberDateVO memberdateVO, String from_date, String to_date) throws Exception {
		//로그인세션가져오기
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); //memberVO는 세션
		model.addAttribute("member", memberVO);
		
		//세션에서 받아온 member_code
		int member_code = memberVO.getMember_code();
		
		//테스트용
		//System.out.println("값 : " + from_date);
		//System.out.println("값 : " + to_date);
		
		if(memberVO != null) { //세션이 붙어있는상태
			memberdateVO.setFrom_date(from_date);
			memberdateVO.setTo_date(to_date);			
			memberdateVO.setMember_code(member_code);  //memberdateVO 에 회원코드를 현재 세션값의 member_code로 가져옴
			List<orderVO> list = null;
			list = mypageService.getDateList(memberdateVO);
			model.addAttribute("order_list", list);
			model.addAttribute("from_date", from_date);
			model.addAttribute("to_date", to_date);
		}
	}
	
	//주문상세보기
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public void getOrdersDetailView(@RequestParam("order_code") int order_code, Model model, HttpServletRequest req, orderVO orderVO) throws Exception {
		//로그인세션가져오기
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); //memberVO는 세션
		model.addAttribute("member", memberVO);
		
		//세션에서 받아온 member_code
		int member_code = memberVO.getMember_code();
		
		System.out.println("zzzzzzzzzzzzz"+member_code);
		
		if(memberVO != null) { //세션이 붙어있는상태
			orderVO.setMember_code(member_code);
			orderVO.setOrder_code(order_code);
			
			//ordersDetailView 는 컬럼이 하나만 나오기때문에 List로 받을 필요없다.
			TestBean view = mypageService.ordersDetailView(orderVO);
			model.addAttribute("orderDetailview", view);
		}
	}
	
	//회원정보 수정을 위한 비밀번호get
	@RequestMapping(value="/password", method=RequestMethod.GET)
	public String getInputPassword(Model model, HttpServletRequest req) throws Exception {
		//로그인세션가져오기
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); //memberVO는 세션
		model.addAttribute("member", memberVO);
		
		logger.info("inputPassword() GET...");
		return "/mypage/password";
	}
	
	
	
	//회원정보 수정을 위한 비밀번호post
	@RequestMapping(value="/password", method=RequestMethod.POST)
	public int postInputPassword(MemberVO MemberVO, Model model, HttpServletResponse rep, HttpServletRequest req) throws Exception {
		
		//로그인세션가져오기
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); //memberVO는 세션
		model.addAttribute("member", memberVO);
		
		//세션에서 받아온 id값.
		String member_id = memberVO.getMember_id();
		int returnValue = 0;						//이 함수의 최종 결과값을 담을 변수선언.
		
		//테스트용
		logger.info("member_id = " + member_id);
		logger.info("member_pw = " + MemberVO.getMember_pw());
		
		if(memberVO != null) { //세션이 붙어있는상태
			MemberVO.setMember_id(member_id);  				// 현재 세션에 있는 회원 id 설정하여 
			MemberVO result = memberService.login(MemberVO);//서비스에 메소드에 매개변수로 전달.
			
			if(result == null) { //해당되는 회원이 없을때
				//logger.info("없음");
				ScriptUtils.alertAndMovePage(rep, "비밀번호를 확인해주세요", "/mypage/password");
				//out.println("<script> $('#input_pw_txtbox').focus(); </script>");
				//ScriptUtils.onlyUseHtmlTag(rep, "<script> $('#input_pw_txtbox').focus(); </script>");
				returnValue = 0;
				
			}else {				//해당되는 회원이 있을 때
				//logger.info("있음");
				ScriptUtils.alertAndMovePage(rep, "비밀번호를 확인했습니다. 다음페이지로 넘어갑니다.", "/mypage/update");
				returnValue = 1;
			}			
		}		
		return returnValue;
	}
	
	//비밀번호 인증 후 회원정보 수정 화면 get
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void getUpdateMember(MemberVO paramMVO, Model model, HttpServletRequest req) throws Exception {
		//로그인세션가져오기
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); //memberVO는 세션
		model.addAttribute("member", memberVO);		
	}
	
	//비밀번호 인증 후 수정 버튼을 눌렀을 시 처리할 post
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public void postUpdateMember(MemberVO paramMVO, Model model, HttpServletRequest req, HttpServletResponse rep, Boolean checkBox_val) throws Exception{
		//로그인세션가져오기
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); //memberVO는 세션
		model.addAttribute("member", memberVO);	
		
		//세션에서 가져온 사용자 정보 값 치환
		int member_code = memberVO.getMember_code();
		String member_pw = memberVO.getMember_pw();
		String member_name = memberVO.getMember_name();
		String member_addr = memberVO.getMember_addr1();
		String member_email = memberVO.getMember_email();
		String member_phone = memberVO.getMember_tel();
		
		//체크값 처리
		//체크값이 넘어올때 	체크   -> true.
		//				  		미체크 -> null.
		//미체크 상태에서 null로 넘어올때를 잡아준다.
		checkBox_val = (checkBox_val == null) ? false : true ;
		
		System.out.println("체크 상태 : " + checkBox_val);
		
		if(checkBox_val) {
			//오류 방지(cannot be null)
			paramMVO.setMember_name(member_name);
			paramMVO.setMember_addr1(member_addr);
			paramMVO.setMember_email(member_email);
			paramMVO.setMember_tel(member_phone);
			
			//멤버 코드 전송
			paramMVO.setMember_code(member_code);
			
			//sql문이 실행되면 1이 저장된다.
			if(memberService.updatePwMember(paramMVO) == 1) {
				ScriptUtils.alertAndBackPage(rep, "비밀번호가 수정되었습니다!");
			}else {
				ScriptUtils.alertAndBackPage(rep, "비밀번호 수정 오류 발생!");
			}
			
			
			
		}else {
			//오류 방지(cannot be null)
			paramMVO.setMember_pw(member_pw);
			
			//멤버 코드 전송
			paramMVO.setMember_code(member_code);
			
			if(memberService.updateMember(paramMVO) == 1) {
				ScriptUtils.alertAndBackPage(rep, "회원정보가 수정되었습니다!");
			}else {
				ScriptUtils.alertAndBackPage(rep, "회원정보가 수정 오류 발생!");
			}
		}
	}
	
}

//2021-06-07
/* DAO 에서 sqlSession에 접근해 update 메서드를 호출하면(mapper에서 update문이 실행되면)
 * int형 값 1이 나온다.(원리는 자세히 모른다.)
 * DAO 메서드는 반환값이 위 sqlSession값(1) 이고
 * Service 메서드의 반환값은 DAO 메서드 반환값을 기준으로 1이면 1, 1이 아니면 0 이다.
 * Controller에선 Service가 반환하는 값을 가지고 에러 처리를 한다.
 * sqlSession 에서 update 메서드를 호출하면 결과값이 왜 1인지 모르겠다.
 * */


/*java에서 html 태그 사용할 때
 * 1. response 객체에 setContentType을 사용한다.
 * 2. PrintWriter 객체를 생성하고 response 변수에 getWriter()메서드로 초기화 해준다.
 * out.println("<script> $('#input_pw_txtbox').focus(); </script>");
*/
	
