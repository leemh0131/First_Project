<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
	<title>쇼핑몰 메인 페이지</title>
	<style type="text/css">
		#main_img{
		width: 100%;
		}
		
		.h_1{
		text-align: center;
		font-weight: 600 !important; 
		font-style: italic;
		font-family: sans-serif;
		color: black;
		}
		
		#main_img2{
		width: 100%;
		}		
		
		.t{
		width: 100%;
		-webkit-transform:scale(1);
	    -moz-transform:scale(1);
	    -ms-transform:scale(1); 
	    -o-transform:scale(1);  
	    transform:scale(1);
	    -webkit-transition:.3s;
	    -moz-transition:.3s;
	    -ms-transition:.3s;
	    -o-transition:.3s;
	    transition:.3s;
		}
		
		.t:hover{
		-webkit-transform:scale(1.2);
	    -moz-transform:scale(1.2);
	    -ms-transform:scale(1.2);   
	    -o-transform:scale(1.2);
	    transform:scale(1.2);
		}
		
		#best10{
		margin-top: 50px;
		/* width: 350px; */
		/* height: 500px; */
		}
		
		#outer{		
		width: 350px;
		height: 500px;
		margin-left: 50px;
		}
		
		#top{
		margin-top: 60px;
		}
		
		#pants{
		margin-top: 110px;
		}
		
		#shoes{
		width: 350px;
		height: 500px;
		margin-top: 70px;
		margin-left: 110px;
		}
		
		#accessory{
		margin-top: 90px;
		margin-left: 110px;
		width: 350px;
		height: 500px;
		}
	
	
	</style>		
</head>

<!-- 헤더 -->
<header>
<%@ include file="include/header.jsp" %>
</header>

<!-- body -->
<body>
<br><br><br><br><br><br><br>
<div class="container">

	<c:if test="${member.mlevel == 1 || empty member.mlevel}">
	<div class="row">
		<div class="col-md-12">
			<img id="main_img" alt="메인이미지" src="../../resources/images/main_img.png">
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12 mt-5 mb-3">
			<h1 class="h_1">Welcome to the LogoTest world!<br>
			For your style add life and help clean the Eye.</h1>
		</div>
	</div>
	
	<div class="container row" style="float: none; margin:100 auto;">
	 	<div class="col-md-8" style="float: none; margin:0 auto;">
			<img id="main_img2" alt="메인이미지2" src="../../resources/images/main_img2.png">
		</div>	
	</div>
	
	<div class="row">
		<div class="col-md-6">
			<a href="products/productListBest"><img title="Best10 바로가기" class="t" id="best10" alt="best10" src="../../resources/images/best10.png"></a>
		</div>
		<div class="col-md-6">
			<a href="products/productList?product_type=1"><img title="Outer 바로가기" class="t" id="outer" alt="outer" src="../../resources/images/outer.png"></a>
		</div>
	</div><br>
	
	<div class="row">
		<div class="col-md-6">
			<a href="products/productList?product_type=2"><img title="Top 바로가기" class="t" id="top" alt="top" src="../../resources/images/top.png"></a>
		</div>
		<div class="col-md-6">
			<a href="products/productList?product_type=3"><img title="Pants 바로가기" class="t" id="pants" alt="pants" src="../../resources/images/pants.png"></a>
		</div>
	</div><br>
	
	<div class="row" >
		<div class="col-md-6">
			<a href="products/productList?product_type=4"><img title="Accessory 바로가기" class="t" id="accessory" alt="accessory" src="../../resources/images/accessory.png"></a>
		</div>
		<div class="col-md-6" >
			<a href="products/productList?product_type=5"><img title="Shoes 바로가기" class="t" id="shoes" alt="shoes" src="../../resources/images/shoes.png"></a>
		</div>		
	</div>
	
	<div class="row">
		<div class="col-md-12 mt-5 mb-3">
			<h1 class="h_1">Enjoy shopping</h1>
		</div>
	</div>


	</c:if>

<c:if test="${member.mlevel == 0}">
<H2 style="color: red;">관리자모드입니다</H2>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</c:if>


</div>

<br><br><br>
</body>

<!-- footer -->
<footer>
<%@ include file="include/footer.jsp" %>
</footer>

</html>

