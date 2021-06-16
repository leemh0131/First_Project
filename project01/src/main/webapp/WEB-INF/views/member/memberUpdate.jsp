<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%//@ include file="../../../resources/css/bootstrap.jsp" %>
<%@ page session="true"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원정보 수정 페이지</title>
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
	/*font : 0.75em "Apple SD Gothic Neo", "돋움", Dotum, AppleGothic, sans-serif;*/
	font : "Apple SD Gothic Neo", "돋움", Dotum, AppleGothic, sans-serif;
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
				<h3>회원정보 수정</h3>
				<hr>
				<div align="right">
					<button class="btn btn-danger btn-sm" type="button" id="mDelete_btn" onclick="delete_member();" >회원 탈퇴</button>
				</div>
			</div>
			<form class="form-horizontal" id="joinForm" name="joinForm" action="" method="post" onsubmit="return false;">								
				<h3 align="left">기본정보</h3>
				<div class="joinWrite">
					<table class="table">						
						<tbody>							
							<tr>
								<th scope="row">아이디</th>
								<td>
									<input type="text" id="member_id" name="member_id" maxlength="16" value="${member.member_id}" readonly="readonly">									
									<br>
								</td>
							</tr>							
							<tr>
								<th scope="row">이름</th>
								<td>
									<input id="member_name" name="member_name" type="text" value="${member.member_name}">									
								</td>								
							</tr>							
							<tr>
								<th scope="row">주소</th>
								<td>
									<input type="text" id="post_no" name="post_no" readonly="readonly" maxlength="14" value="${member.post_no}">
									-
									<button class="btn btn-primary btn-sm" onclick="daumZipCode()">우편번호</button><br>
									<input type="text" id="member_addr1" name="member_addr1" class="inputTypeText col-sm-4" readonly="readonly" value="${member.member_addr1}">
									<label style="font : 0.75em 'Apple SD Gothic Neo', '돋움', Dotum, AppleGothic, sans-serif;">기본 주소</label>
									<br>
									<input type="text" id="member_addr2" name="member_addr2" class="inputTypeText col-sm-4" value="${member.member_addr2}">
									<label style="font : 0.75em 'Apple SD Gothic Neo', '돋움', Dotum, AppleGothic, sans-serif;">나머지 주소</label>
								</td>
							</tr>		
							<tr>
								<th scope="row">전화번호</th>
							 	<td>
							 		<input class="col-sm-3" type="number" id="member_tel" name="member_tel"  maxlength="11" oninput="maxLengthCheck(this)" value="${member.member_tel}">							 		
							 	</td>
							</tr>					
							<tr>
								<th scope="row">휴대전화</th>
							 	<td>
							 		<input class="col-sm-3" type="number" id="mobile" name="mobile"  maxlength="11" oninput="maxLengthCheck(this)" value="${member.mobile}">
							 	</td>
							</tr>
							<tr>
								<th scope="row">회원타입</th>
							 	<td>
							 		<select class="col-sm-2" id="mlevel" name="mlevel">
							 			<option value="1" <c:if test="${member.mlevel eq '1'}">selected</c:if>>일반고객</option>
							 			<option value="2" <c:if test="${member.mlevel eq '2'}">selected</c:if>>관리자</option>							 									 			
							 		</select>							 		
							 	</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>
									&nbsp;&nbsp;&nbsp;
									<input type="radio" name="mgender" value="1" <c:if test="${member.mgender eq '1'}">checked</c:if>>남 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="mgender" value="2" <c:if test="${member.mgender eq '2'}">checked</c:if>>여
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
									<input type="text" id="member_email" name="member_email" value="${member.member_email}">
								</td>
							</tr>
							<tr>
								<th scope="row">생일</th>
								<td>
									<input type="text" id="datepicker" name="mbirth" placeholder="날짜를 선택하십시오." value="${member.mbirth}"/>									
								</td>								
							</tr>																				
						</tbody>
					</table>
					<hr>
				</div>
			
				<!-- 회원가입 버튼 -->
				<div class="btnArea center">					
					<button class="btn btn-primary" type="button" id="update_btn">회원 정보 수정</button>
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
	
	$("#update_btn").on("click", function(){
				
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
		
		if($("#mobile").val()==""){
			alert("핸드폰번호를 입력해주세요.");
			$("#mobile").focus();
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
		f.action = "/member/updateForm";
		f.submit();
	});
})


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

//회원 탈퇴
function delete_member(){
	var url="/member/memberDelete"
	window.open(url,"회원탈퇴","top=100px, left=100px, width=450, height=300, resizable=no");
}



</script>


</body>
</html>