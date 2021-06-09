<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 세션 사용여부 옵션 -->
<!-- page 디렉티브의 session 속성의 기본값은 true이므로 false로 지정하지 않으면 자동 생성된다. -->
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보수정-비밀번호 입력</title>
	
	<style type="text/css">
	body{
		background-color: #F8F8F8;
		padding-top: 180px;
	}
	</style>
	
</head>

<header>
<%@include file="../include/header.jsp" %>
</header>

<body>
	<div class="container">
		<h1>회원정보수정</h1><hr/>
		
		<form class="form-horizontal" action="${path}/mypage/password" method="post">
			<div class="form-group">
		
				<label class="password">비밀번호를 다시 입력해주세요.</label>
				
				<div class="col-sm-2">
					<input type="password" id="input_pw_txtbox" name="member_pw" placeholder="password"/>
				</div>
				
				<div class="col-sm-2">
					<button id="btn_ok" class="btn btn-dark btn-sm" type="submit">OK</button>
				</div>
				
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				
			
			</div>
		</form>
		
		
		
		
		
		
		
	</div>
</body>
<%@ include file="../include/footer.jsp" %>

<script src="../../../resources/js/jquery-3.6.0.min.js"></script>
<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	
	//널 체크
	$("#btn_ok").click(function() {
		if($("#input_pw_txtbox").val() == "") {
			alert("비밀번호를 입력해주새요");
			$("#input_pw_txtbox").focus();
			return false;
		}
	})
})





</script>

</html>