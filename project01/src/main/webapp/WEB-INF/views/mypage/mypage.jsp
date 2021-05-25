<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 세션 사용여부 옵션 -->
<!-- page 디렉티브의 session 속성의 기본값은 true이므로 false로 지정하지 않으면 자동 생성된다. -->
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	
	<style type="text/css">
	body{
	background-color: #F8F8F8;
	padding-top: 150px;
	}
	</style>
</head>
<%@ include file="../include/header.jsp" %>
<body>
	<div class="container">		
	
		<h1>마이페이지 입니다.</h1>
		<h2>${Mypage}</h2>
		<h3>위 메세지는 model에 의한 메시지</h3>
		
		<h4>마이페이지 메뉴</h4>
		<ul>
			<li><a href="#">장바구니 내역</a></li>
			<li><a href="#">보유 포인트</a></li>
			<li><a href="#">보유 쿠폰</a></li>
			<li><a href="/myapp/mypage/likey">찜 목록</a></li>
			<li><a href="#">QnA</a></li>
			<li><a href="#">리뷰</a></li>
			<li><a href="#">주문내역</a></li>
		</ul>
	
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>	
		
	
	</div>

</body>
<%@ include file="../include/header.jsp" %>
</html>