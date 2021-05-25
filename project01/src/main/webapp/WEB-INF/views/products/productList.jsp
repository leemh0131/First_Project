<%@ page import="com.myproject.domain.productVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품리스트페이지</title>
	<style type="text/css">
	#product {
	/* background-color: red; */
	height: 400px;	
	}
	
	.product_img {
	margin-top: 20px;
	/* background-color: green; */	
	height: 370px;
	text-align: center;	
	}
	
	img{
	object-fit: cover;
	width: 100%;
	height: 300px;
	}
	
	img:hover{
		box-shadow: 1px 1px 20px gray;
		filter: brightness(120%);
	}
	
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: black; text-decoration: none;}
	
	.product_name{
	margin-top: 8px;
	margin-bottom: -1px;
	font-family: sans-serif;
	font-weight: bold;
	
	}
	
	.product_price{
	font-family: sans-serif;	
	}
	
	</style>	
</head>
<!-- 헤더 -->
<header>
<%@ include file="../include/header.jsp" %>
</header>

<!-- body -->
<body>
<br><br><br><br><br><br><br><br><br><br><br>
<div class="container">

<div class="row">
<c:forEach items="${productList}" var="productVO">	
	<div id="product" class="col-sm-3">		
		<a href="/products/productView?product_code=${productVO.product_code}">			
			<div class="product_img">		
				<img src="${productVO.img_view}" alt="image"/>
				<h3 class="product_name">${productVO.product_name}</h3>
				<c:if test="${productVO.product_count <= 0}">
				<h4 style="font-weight: bolder; color: red;" class="product_price">SOLD OUT</h4>
				</c:if>
				<c:if test="${productVO.product_count > 0}">			
				<h4 class="product_price">${productVO.product_price} KRW</h4>
				</c:if>
			</div>
		</a>
	</div>
</c:forEach>
</div>

</div>
</body>
<!-- footer -->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</html>