<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 주문조회</title>
</head>
<!-- 헤더 -->
<header>
<%@ include file="../include/header.jsp" %>
</header>

<body>
<br><br><br><br><br><br><br><br><br><br><br>
<div class="container">
		
	<h1 style="font-family: sans-serif; font-weight: bold; font-size: 35px">주문조회</h1>
		
		<hr><br>
				<table class="table table-hover">
					<thead>
						<tr style="font-family: sans-serif; font-weight: bold; font-size: 17px">
							<th>주문일자</th>
							<th>주문번호</th>
							<th>상품정보</th>
							<th>수량</th>
							<th>상품구매금액</th>
							<th>주문처리상태</th>
							<th>취소/교환/반품</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${member.mlevel == 1 }">
							<c:forEach items="${MemberOrdList}" var="MemberOrdList">
								<tr>
									<td>${MemberOrdList.order_date}</td>
									<td>${MemberOrdList.order_code}</td>
									<td>${MemberOrdList.product_name}</td>
									<td>${MemberOrdList.order_count}</td>
									<td><fmt:formatNumber pattern="###,###,###" value="${MemberOrdList.total_price}"/>원</td>
									<td>${MemberOrdList.order_status}</td>
									<td>-</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
</div>

</body>

<br><br><br><br><br><br><br><br>
<br><br><br><br>
<!-- footer -->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</html>