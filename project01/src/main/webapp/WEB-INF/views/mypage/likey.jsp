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
	<title>찜목록</title>
	
	<style type="text/css">
	body{
	background-color: #F8F8F8;
	padding-top: 150px;
	}
	</style>
	
</head>

<body>
<%@ include file="../include/header.jsp" %>
	<div class="container">		
		
		<h1>찜 목록</h1><hr/>
		<table class="table table-boardered table-striped table-hover">
			<thead>
				<tr>
					<th>사진</th>
					<th>상품명</th>
					<th>가격</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="list">
					<tr>
						<td>${list.img_view }</td>
						<td><a href="#">${list.product_name }</a></td>
						<td>${list.product_price }</td>
						<td><fmt:formatDate value="${list.register_date}" pattern="yyyy-MM-dd"/></td>					
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>