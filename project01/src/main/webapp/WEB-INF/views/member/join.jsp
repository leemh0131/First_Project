<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/css/bootstrap.jsp" %>
<%@ taglib prefix="c"   		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원가입 페이지</title>
</head>
<body>
<div id="wrap" class="form-horizontal">
	<div id="header">
		<!-- 헤더 -->
		<header>
		<%@ include file="../include/header.jsp" %>
		</header>
	</div>
	<div id="container" align="center">
		<div id="contents">
			<div class="titleArea">
				<h2>회원가입</h2>
			</div>
			<form id="joinForm" name="joinForm" action="" method="post">
				<div class="boardWrite_type">
					<table border="1" >
						<caption>회원가입</caption>
						<tbody>
							<tr>
								<th scope="row">회원구분</th>
								<td>
									<input id="member_type1" name="member_type" type="radio" checked="checked">
									<label for="member_type1">개인회원</label>
									<input id="member_type2" name="member_type" type="radio" checked="checked" style="display: none;">
									<label for="member_type2" style="display: none;">사업자 회원</label>
								</td>
							</tr>
						</tbody>
					</table>
				</div>				
				<h2>기본정보</h2>
				<div class="joinWrite">
					<table border="1">
						<caption>회원 기본정보</caption>
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td>
									<input type="text" id="member_id" name="member_id" readonly>
									<button class="btn btn-primary btn-sm" value="아이디 중복확인"onclick="checkIdLayer('check_id.html')">아이디 중복확인</button>
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td>
									<input type="password" id="member_passwd" name="member_passwd" maxlength="16">
									(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)-비밀번호 설정시 특수문자 *은 제외하세요
								</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인</th>
								<td>
									<input type="password" id="member_passwd_confirm" name="member_passwd_confirm" autocomplete="off" maxlength="16">								
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
									<input type="text" id="postcode" name="postcode" readonly="readonly" maxlength="14">
									-
									<button class="btn btn-primary btn-sm">우편번호</button><br>
									<input type="text" id="addr1" name="addr1" class="inputTypeText" readonly="readonly">기본주소
									<br>
									<input type="text" id="addr2" name="addr2" class="inputTypeText">나머지주소
								</td>
							</tr>
							<tr>
								<th scope="row">휴대전화</th>
							 	<td>
							 		<select id="member_tel1" name="member_tel[]">
							 			<option value="010">010</option>
							 			<option value="011">011</option>
							 			<option value="016">016</option>
							 			<option value="017">017</option>
							 			<option value="018">018</option>
							 			<option value="019">019</option>
							 		</select>
							 		-
							 		<input type="text" id="member_tel2" name="member_tel[]">
							 		-
							 		<input type="text" id="member_tel3" name="member_tel[]">
							 	</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
									<input type="text" id="email" name="email" >
								</td>
							</tr>
							
														
						</tbody>
					</table>
				</div>
				<!-- <h3 class="displaynone">추가정보</h3> -->
				<div class="agreeBody">
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
							</div>
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
									
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 회원가입 버튼 -->
				<div class="btnArea center">
					<a href="#" onclick="memberJoinAction()">
						<span class="creer_btn btn_l btn_color">회원가입</span>
					</a>
					<a href="#" onclick="location.href='../memberMain'; return false">
					
					</a>
				</div>			
			</form>			
		</div>
	</div>
	<div class="scrollArea">
		<a href="#" class="scrollup" style="display: inline;">TOP</a>
	</div>
	<div id="footer">
		<!-- footer -->
		<footer>
		<%@ include file="../include/footer.jsp" %>
		</footer>	
	</div>
	

</div>

</body>

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
}
</style>



</html>