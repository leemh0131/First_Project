<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/css/bootstrap.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비회원 주문조회</title>
</head>

<!-- 헤더 -->
<header>
<%@ include file="../include/header.jsp" %>
</header>

<!-- body -->
<body>
<br><br><br><br><br><br><br><br><br><br><br>

<div class="container" align="center">
	<form action="/orderlist/NonMemberOrdList" method="post">
			<div class="NonUser_login">
				<h2>비회원 주문조회</h2>
				<p>비회원으로 주문하신 경우 아래 정보를 모두 입력하시면 주문내역을 확인하실 수 있습니다.</p>
				<label class="name"> 
					<span>주문번호</span> 
					<input id="order_code" name="order_code" type="text">
				</label> 
				<label class="password"> 
					<span>비밀번호</span> 
					<input id="order_pw" name="order_pw" type="password">
				</label>
				<br><br>
				<button class="btn btn-primary" type="reset" id="reset">취소</button>
				<button class="btn btn-primary" type="submit" id="submit">확인</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$(document).ready(function(){
	
	//확인 버튼을 눌렀을 때
	$("#submit").on("click",function(){
		if($("#order_code").val()==""){
			alert("주문번호를 입력해주세요.");
			$("#order_code").focus();
			return false;
		}
		if($("#order_pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#order_pw").focus();
			return false;
		}
		
		location.href="../";
	});	
});

</script>

</body>

<br><br><br><br><br><br><br><br>
<br><br><br><br>

<!-- footer -->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</html>