<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/css/bootstrap.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
</head>
<body>
<div id="wrap">
	<div id="header">		
		<!-- 헤더 -->
		<header>
		<%@ include file="../include/header.jsp" %>
		</header>
		<br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div id="container" align="center">
		<form action="/member/login" method="post">
			<div class="mlogin">
				<h2>회원 로그인</h2>
				<label class="id"> 
					<span>아이디</span> 
					<input id="member_id" name="member_id" type="text">
				</label> 
				<label class="password"> 
					<span>패스워드</span> 
					<input id="member_pw" name="member_pw" type="password">
				</label>
				<p class="security">
					<input id="member_check_save_id" name="member_check_save_id" type="checkbox"> 
					<label for="member_check_save_id">아이디 저장</label>
				</p>
				<button class="btn btn-primary" type="submit" id="submit">로그인</button>
					<ul>
					<li class="join">"아직 회원이 아니십니까?" 
						<a href="/member/join">회원가입하기</a>
					</li>
					<li>"아이디를 잊으셨나요?" 
						<a href="#">아이디 찾기</a>
					</li>
					<li>"비밀번호를 잊으셨나요?" 
						<a href="#">비밀번호 찾기 찾기</a>
					</li>
				</ul>
			</div>
		</form>
	</div>

	<div id="footer">
		<!-- footer -->
		<footer>
		<%@ include file="../include/footer.jsp" %>
		</footer>
	</div>
	
	
	
	
	
</div>

<script type="text/javascript">
$(document).ready(function(){
	
	//로그인 버튼을 눌렀을 때
	$("#submit").on("click",function(){
		if($("#userid").val()==""){
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		if($("#passwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#passwd").focus();
			return false;
		}
		
		location.href="../";
	});	
});

</script>

</body>
</html>