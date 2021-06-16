<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../resources/css/bootstrap.jsp" %>
<%@ page session="true"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원가입 페이지</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
#wrap {
	position : relative;
	width: 100%;
	margin: 0 auto;
	display: block;
	color : 1c1c1c;
}

#container{
	width: 1160px;
	min-height: 500px;
	margin: 0 auto;
	zoom: 1;
	position: relative;
	display: block;
	color: #1c1c1c;
	font : 0.75em "Apple SD Gothic Neo", "돋움", Dotum, AppleGothic, sans-serif;	
}

#container:after {
	content : "";
	display : block;
	clear : both;
}

.titleArea h3 {
	padding : 0 0 0 10px;
 	font-size : 30px;
 	color : #272823;
 	display : block;
 	margin-block-start : 0.83em;
 	margin-block-end : 0.83em;
 	margin-inline-start : 0px;
 	margin0inline-end : 0px;
 	font-weight : bold;
}

#joinForm h3 {
	padding : 50px 0 5px;
	font-size : 15px;
	color : #444;
	display : block;
	margin-block-start : 1em;
 	margin-block-end : 1em;
 	margin-inline-start : 0px;
 	margin0inline-end : 0px;
 	font : 1.2em "Apple SD Gothic Neo", "돋움", Dotum, AppleGothic, sans-serif;	
 	font-weight : bold;
}

.agreeBody{
	background : #f7f7f7;
	margin : 10px;	
	padding : 10px;
	display : block;
	font : 0.8em "Apple SD Gothic Neo", "돋움", Dotum, AppleGothic, sans-serif;	
	color :  #1c1c1c;	
}

.agreeBody:after{
	content: "";
	display: block;
	clear : both;
}

.agreeBody .agree1, .agreeBody .agree2 {
	width : 48%;	
	padding : 0 1% 0 4%;
	float : left;
	display : block;
	font : 0.75em "Apple SD Gothic Neo", "돋움", Dotum, AppleGothic, sans-serif;
	text-align: left;
	color :  #1c1c1c;	
}

.agreeBody .agree1 h3, .agreeBody .agree2 h3 {
	padding : 0 0 5px;
	font : 1.2em "Apple SD Gothic Neo", "돋움", Dotum, AppleGothic, sans-serif;
	color :  #1c1c1c;
}

.agreeBody .agree1 .agreeArea, .agreeBody .agree2 .agreeArea {
	padding : 10px 10px 10px;
	border-top : 1px solid #c0c0c0;
	border-bottom : 1px solid #c0c0c0;
	color : #747474;
	font-size : 11px;
	line-height : 20px;
	background : #fff;
	display : block;
	font : 0.75em "Apple SD Gothic Neo", "돋움", Dotum, AppleGothic, sans-serif;
}

.agreeBody .agree1 .agreeArea .agree, .agreeBody .agree2 .agreeArea .agree {
	overflow : auto;
	height: 110px;
	padding : 20px;
	border :  1px solid #e6e6e6;
	background : #fff;
	display : block;
	font-size : 11px;
	line-height : 20px;
	font : 0.75em "Apple SD Gothic Neo", "돋움", Dotum, AppleGothic, sans-serif;
}

.fr-view{
	word-wrap : break-word;
}

.all_agree {
	text-align : left;	
	padding-left : 50px;
}


</style>


</head>
<body>

<div id="wrap" class="form-horizontal">
	<div id="header">
		<!-- 헤더 -->
		<header>
		<%@ include file="../include/header.jsp" %>
		</header>
		<br><br><br><br><br><br><br><br><br>
	</div>
	<div id="container" align="center">
		<div id="contents">
			<div class="titleArea">
				<h3>회원가입</h3><hr>
			</div>
			<form class="form-horizontal" id="joinForm" name="joinForm" action="" method="post" onsubmit="return false;">
				<input type="hidden" id="member_checked" name="member_checked" maxlength="16" value="1">				
				<h3 align="left">기본정보</h3>
				<div class="joinWrite">
					<table class="table">						
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td>
									<input type="text" id="member_id" name="member_id" maxlength="16" >
									<button class="idCheck btn btn-primary btn-sm" type="button" id="idCheck"  onclick="fn_idCheck();" value="N">아이디 중복확인</button>
									<br>
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td>
									<input type="password" id="member_pw" name="member_pw" maxlength="16">
									<label class="pw_rule" style="font : 0.75em 'Apple SD Gothic Neo', '돋움', Dotum, AppleGothic, sans-serif;">
										(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)-비밀번호 설정시 특수문자 *은 제외하세요.&nbsp;&nbsp;
									</label>									
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인</th>
								<td>
									<input type="password" id="member_pw_confirm" name="member_pw_confirm" autocomplete="off" maxlength="16">
									<br>								
								</td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td>
									<input id="member_name" name="member_name" type="text" >									
								</td>								
							</tr>							
							<tr>
								<th scope="row">주소</th>
								<td>
									<input type="text" id="post_no" name="post_no" readonly="readonly" maxlength="14">
									-
									<button class="btn btn-primary btn-sm" onclick="daumZipCode()">우편번호</button><br>
									<input type="text" id="member_addr1" name="member_addr1" class="inputTypeText" readonly="readonly" >
									<label style="font : 0.75em 'Apple SD Gothic Neo', '돋움', Dotum, AppleGothic, sans-serif;">기본 주소</label>
									<br>
									<input type="text" id="member_addr2" name="member_addr2" class="inputTypeText">
									<label style="font : 0.75em 'Apple SD Gothic Neo', '돋움', Dotum, AppleGothic, sans-serif;">나머지 주소</label>
								</td>
							</tr>		
							<tr>
								<th scope="row">전화번호</th>
							 	<td>
							 		<input class="col-sm-2" type="number" id="member_tel1" name="member_tel1"  maxlength="3" oninput="maxLengthCheck(this)">
							 		-
							 		<input class="col-sm-2" type="number" id="member_tel2" name="member_tel2" maxlength="4" oninput="maxLengthCheck(this)">
							 		-
							 		<input class="col-sm-2" type="number" id="member_tel3" name="member_tel3" maxlength="4" oninput="maxLengthCheck(this)">
							 	</td>
							</tr>					
							<tr>
								<th scope="row">휴대전화</th>
							 	<td>
							 		<select class="col-sm-1" id="mobile1" name="mobile1">
							 			<option value="010">010</option>
							 			<option value="011">011</option>
							 			<option value="016">016</option>
							 			<option value="017">017</option>
							 			<option value="018">018</option>
							 			<option value="019">019</option>
							 		</select>
							 		-
							 		<input class="col-sm-2" type="number" id="mobile2" name="mobile2" maxlength="4" oninput="maxLengthCheck(this)">
							 		-
							 		<input class="col-sm-2" type="number" id="mobile3" name="mobile3" maxlength="4" oninput="maxLengthCheck(this)">
							 	</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="mgender" value="1" checked="checked">남 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="mgender" value="2">여
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
									<input type="text" id="member_email" name="member_email" >
								</td>
							</tr>
							<tr>
								<th scope="row">생일</th>
								<td>
									<input type="text" id="datepicker" name="mbirth" placeholder="날짜를 선택하십시오."/>									
								</td>								
							</tr>																				
						</tbody>
					</table>
					<hr>
				</div>
				<!-- <h3 class="displaynone">추가정보</h3> -->
				<div class="agreeBody" align="center">							
					<div class="agree1">
						<h3>이용약관 동의</h3>
						<div class="agreeArea">
							<div class="agree">
								<div class="fr-view fr-view-agreement">
									<p>제1조 (목적)</p>
									<p>&nbsp;</p>
									이 약관은 사이버 몰(이하 "몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에
									있어 사이버 몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다. <br> 「PC통신,
									무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」 <br>
									</div>
									<br>
							</div>
							<br>
							이용약관에 동의하십니까?&nbsp;&nbsp;
							<input type="checkbox" id="checkbox2"> &nbsp;동의			
							<br>
						</div>
					</div>
					<div class="agree2">
						<h3>개인정보 수집 및 이용 동의</h3>
						<div class="agreeArea">
							<div class="agree">
								<div class="fr-view fr-view-agreement">
									<p>■ 수집하는 개인정보 항목</p>
									<p>회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
									<p>
										<br>
										ο 수집항목 : 이름 , 생년월일 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 서비스 이용기록 , 접속 로그 , 결제기록
										<br>
										ο 개인정보 수집방법 : 홈페이지(회원가입) , 배송 요청 										
									</p>
									<p>■ 개인정보의 수집 및 이용목적</p>
									<p>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다..</p>
									<p>
										 &nbsp;ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
										 <br>
										 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송
										 <br>
										 &nbsp; ο 회원 관리
										 <br>
										 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 불만처리 등 민원처리 , 고지사항 전달
										 <br>
										 &nbsp; ο 마케팅 및 광고에 활용
										 <br>
										 신규 서비스(제품) 개발 및 특화 , 이벤트 등 광고성 정보 전달
									</p>
									<br>
								</div>
							</div>
							<br>
							이용약관에 동의하십니까?&nbsp;&nbsp;
							<input type="checkbox" id="checkbox3"> &nbsp;동의			
							<br>
						</div>
						<br>
					</div>	
					
					<div class="all_agree">						
						<label id="all_agree_label">
							전체 이용약관에 동의하십니까?&nbsp;&nbsp;
						</label>
						<input type="checkbox" id="checkbox1" > &nbsp;동의								
					</div>	
					<hr>				
				</div>
				
				<!-- 회원가입 버튼 -->
				<div class="btnArea center">
					
					<button class="btn btn-primary" type="button" id="join_btn">회원가입</button>
					<button class="cancle btn btn-danger" type="button">취소</button>
					<br><br>
				</div>			
			</form>			
		</div>
	</div>
	
	<div id="footer">
		<!-- footer -->
		<footer>
		<%@ include file="../include/footer.jsp" %>
		</footer>	
	</div>
	

</div>



	
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 우편번호 검색기능 -->
<script type="text/javascript">

$(document).ready(function(){
	
	
	// 취소
	$(".cancle").on("click", function(){
		location.href="/"; //메인페이지로 돌아감
	})
	
	// 아이디 재 입력시 아이디 체크 다시하도록
	$("#member_id").on("keyup", function(){
		$("#member_checked").val("1");
	});
	
	$("#member_id").on("change", function(){
		$("#member_checked").val("1");
	});
	
	
	// 회원약관 동의 체크박스 컨트롤
	$("#checkbox1").on("click", function(){
		if($("#checkbox1").is(":checked")== true){
			$("#checkbox2").prop("checked", true);
			$("#checkbox3").prop("checked", true);
		}else {
			$("#checkbox2").prop("checked", false);
			$("#checkbox3").prop("checked", false);
		}
	});
	
	$("#checkbox2").on("click",function(){
		if($("#checkbox2").is(":checked") == false){
			$("#checkbox1").prop("checked", false)
		}
	});
	
	
	$("#checkbox3").on("click",function(){
		if($("#checkbox3").is(":checked") == false){
			$("#checkbox1").prop("checked", false)
		}
	});
	
	//회원가입 버튼 클릭시 체크하도록
	$("#join_btn").on("click", function(){		
		
		$.ajax({
			url : "/member/emailCheck",
			type : "post",
			dataType : "json",			
			data : {"member_email" : $("#member_email").val()},
			success : function(data){
				//alert("Return Value : " + data);
				if(data == false) {
					alert("중복된 이메일입니다.");
					$("#member_email").focus();
					return false;
				}else{

					
					if($("#checkbox2").is(":checked") == false){
						alert("이용약관을 체크를 해주세요.");
						return false;
					}
					
					if($("#checkbox3").is(":checked") == false){
						alert("개인정보 수집동의를 체크를 해주세요.");
						return false;
					}
					
					if($("#member_checked").val() != "0"){
						alert("아이디 중복 체크를 해주세요.");
						return false;
					}
					
					if($("#member_id").val()==""){
						alert("아이디를 입력해주세요.");
						$("#member_id").focus();
						return false;
					}
					if($("#member_pw").val()==""){
						alert("비밀번호를 입력해주세요.");
						$("#member_pw").focus();
						return false;
					}
					
					//패스워드 암호 생성식
					var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&-]).{8,16}$/;		
					var password = $("#member_pw").val();
					if(!reg.test(password)){
						alert("(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)-비밀번호 설정시 특수문자 *은 제외하세요");
						$("#member_pw").focus();
						return false;
					}
					
					
					if($("#member_pw_confirm").val()!=$("#member_pw").val()){
						alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
						$("#member_pw_confirm").focus();
						return false;
					}
					if($("#member_pw_confirm").val()==""){
						alert("비밀번호 확인란을 입력해주세요.");
						$("#member_pw_confirm").focus();
						return false;
					}
					if($("#member_name").val()==""){
						alert("성명을 입력해주세요.");
						$("#member_name").focus();
						return false;
					}
					if($("#post_no").val()==""){
						alert("우편번호를 입력해주세요.");
						$("#post_no").focus();
						return false;
					}
					if($("#member_addr2").val()==""){
						alert("나머지 주소를 입력해주세요.");
						$("#member_addr2").focus();
						return false;
					}
					
					if($("#mobile2").val()==""){
						alert("핸드폰번호를 입력해주세요.");
						$("#mobile2").focus();
						return false;
					}
					if($("#mobile3").val()==""){
						alert("핸드폰번호를 입력해주세요.");
						$("#mobile2").focus();
						return false;
					}
							
					if($("#member_email").val()==""){
						alert("이메일 주소를 입력해주세요.");
						$("#member_email").focus();
						return false;
					}
					
					if($("#datepicker").val()==""){
						alert("생일을 입력해주세요.");
						$("#datepicker").focus();
						return false;
					}
					
					

					var f = document.joinForm;
					f.action = "/member/joinForm";
					f.submit();
										
				} 			
			}
			, error : function(data){
				console.log(data);	
			}
		})
		
		
	});
})

//아이디 중복검사 함수
function fn_idCheck() {
	//alert("중복확인");
	$.ajax({
		url : "/member/idCheck",
		type : "post",
		dataType : "json",
		////data : {"userid" : $("#userid").val()},
		data : {"member_id" : $("#member_id").val()},
		success : function(data){
			//alert("Return Value : " + data);
			if(data == 1) {
				alert("중복된 아이디입니다.");
			} else if(data == 0) {
				$("#idCheck").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
			
			$("#member_checked").val(data);
		}
		, error : function(data){
			console.log(data);	
		}
	})
}

//달력관련
$(function() {
    $("#datepicker").datepicker({
        //옵션들 생략//
        //옵션들 생략//
    }); 
});

$.datepicker.setDefaults({
	//showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다. 
	changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다. 
	changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다. 
	showAnim: "slide", //애니메이션을 적용한다. 
    dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
    prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
    nextText: '다음 달',	// 마우스 오버시 다음달 텍스트
    closeText: '닫기', // 닫기 버튼 텍스트 변경
    currentText: '오늘', // 오늘 텍스트 변경
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
    showMonthAfterYear: true,	// true : 년 월  false : 월 년 순으로 보여줌
    yearSuffix: '년',	//
    showButtonPanel: true,	// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
	// buttonImageOnly: true,	// input 옆에 조그만한 아이콘으로 캘린더 선택가능하게 하기
	// buttonImage: "images/calendar.gif",	// 조그만한 아이콘 이미지
	// buttonText: "Select date"	// 조그만한 아이콘 툴팁
});

//우편번호 검색관련
function daumZipCode() {
	new daum.Postcode({
		oncomplete: function(data) {
			//팝업창에서 검색한 결과 중 항목을 클릭하였을 경우에 
			//실행할 코드를 이곳에 작성한다.

			//각 주소의 노출 규칙에 따라 주소를 조합한다.
			//내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로,
			//이름 참고하여 분기한다.
			var fullAddr  = '';	//최종 주소 변수
			var subAddr   = ''; //조합형 주소 변수

			//사용자가 선택한 주소의 타입에 따라서 해당 주소값을 가져온다.
			if(data.userSelectedType == 'R') { //도로명 주소를 선택한 경우
				fullAddr = data.roadAddress;
			} else { //지번 주소를 선택한 경우
				fullAddr = data.jibunAddress;
			}

			//사용자가 선택한 주소가 도로명 타입일 때 조합한다.
			if(data.userSelectedType == 'R') {
				//법정동명이 있을 경우 추가한다.
				if(data.bname != '') {
					subAddr += data.bname;
				}
				//건물명이 있을 경우에 추가한다.
				if(data.buildingName != '') {
					subAddr += (subAddr != '' ? ', ' + data.buildingName : data.buildingName);
				}
				//조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (subAddr != '' ? '(' + subAddr + ')' : '');
			}
			//우편번호와 주소정보를 행당 필드에 나타낸다.
			//5자리의 새 우편번호
			document.getElementById('post_no').value   = data.zonecode; 
			document.getElementById('member_addr1').value = fullAddr;
			//커서를 상세주소 입력필드로 이동시킨다.
			document.getElementById('member_addr2').focus();
		}
	}).open({
		popupName : 'postPopup'		
	});
}


//maxLength 체크 함수
function maxLengthCheck(object) {
	if (object.value.length > object.maxLength) {
	    object.value = object.value.slice(0, object.maxLength);
	}    
}
</script>


</body>
</html>