<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.myproject.domain.LikeyVO"%>
<%@ page import="com.myproject.domain.orderVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
	padding-top: 180px;
	}
	
	#welcome{
	background-color: #888888;
	}
	
	#basket{
	background-color: #777777;
	}
	
	#likey{
	background-color: #666666;
	}
	
	#orders{
	background-color: #555555;
	}
	/*
	.row{
		border: 1px solid;
	}*/
	</style>
</head>
<%@ include file="include/header.jsp" %>
<body>
	<div class="container">
		<h1>마이페이지</h1><hr/>
		<div class=""></div>
		
		
		<div class="row">
			<div class="col-sm-12">
				<div id="welcome">
					<h2>${member.member_name}님 환영합니다.</h2>
					<a href="${path}/mypage/password">회원정보수정</a>
				</div>
			</div>
			
			<div class="col-sm-4">
			<a href="${path}/mypage/basket">
				<div id="basket">
					<p>장바구니</p>
					<a href="${path}/mypage/basket">${basket_list_size}건</a>
				</div>
			</a>
			</div>
			
			<div class="col-sm-4">
				<a href="${path}/mypage/likey">
					<div id="likey">
						<p>찜목록</p>
						<a href="${path}/mypage/likey">${likey_list_size}건</a>
					</div>
				</a>
			</div>
			
			<div class="col-sm-4">
				<a href="${path}/mypage/order">
					<div id="orders">
						<p>주문내역</p>
						<a href="${path}/mypage/order">바로가기</a>
					</div>
				</a>
			</div>
		</div>
		
		<br/><br/>
		<br/>
		
		<table class="table">
			<caption>최근 한 달간 목록만 표시됩니다.</caption>
			<thead class="thead-dark">
				<tr>
					<th colspan="2">상품명</th>
					<th>금액</th>
					<th>등록 일자</th>
				</tr>			
			</thead>
			<tbody>
				<c:forEach items="${likeyListMon}" var="LikeyMonthVO">
					<tr>
						<td style="width: 10%"><img src="${LikeyMonthVO.img_view}" alt="상품썸네일"/></td>
						<td><a href="#">${LikeyMonthVO.product_name}</a></td>
						<td>${LikeyMonthVO.product_price}</td>
						<td><fmt:formatDate value="${LikeyMonthVO.register_date}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<table class="table">
			<caption>최근 한 달간 목록만 표시됩니다.</caption>
			<thead class="thead-dark">
				<tr>
					<th colspan="2">상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>배송 상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderListMon}" var="OrdersVO">
					<tr>
						<td style="width: 10%"><img src="${OrdersVO.products.img_view}" alt="상품썸네일"/></td>
						<td><a href="#">${OrdersVO.products.product_name}</a></td>
						<td>${OrdersVO.orders.order_count}</td>
						<td>${OrdersVO.orders.total_price}</td>
						<td>${OrdersVO.orders.order_status}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<h2>찜목록 : "${likeyListMon_size}"건</h2>
		<h2>주문내역 : "${orderListMon_size}" 건</h2>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	
	</div>

</body>
<%@ include file="include/footer.jsp" %>
</html>