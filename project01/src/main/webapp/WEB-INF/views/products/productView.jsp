<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품정보</title>
	<style type="text/css">
	
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: black; text-decoration: none;}
	
	#menu{
	font-size: 13px
	
	}
	
	.product_name{
	font-size: 50px;
	font-weight: bold;
	font-family: sans-serif;	
	}	
	
	.product_price{
	font-size: 30px;	
	font-family: sans-serif;
	}
	
	#content_content{
	height: 400px;
	
	}
	
	.product_content{
	font-size: 20px;	
	font-family: sans-serif;	
	}
	
	.btn1{
	width: 100%;
	}
	
	#Cart, #Buy, #like, #update{
	font-size: 17px;
	font-family: sans-serif;
	width: 100%;
	}
	
	#REVIEW{
	font-family: sans-serif;
	font-weight: bold;
	}
	
	#REVIEW_p{
	font-family: sans-serif;
	font-size: 14px;
	}
	
	#REVIEW_b{
	font-family: sans-serif;
	font-size: 14px;
	height: 40px;
	}
	
	img{
	width: 100%;
	object-fit: cover;
	height: 600px;
	}
	
	#img {	
	width: 100%;
	height: 600px;
	/* background-color: red; */
	padding-left: 30px;
	}	
	
	#content{
	padding-left: 60px;
	}
	
	#product_content_input{
	font-size: 17px;
	font-family: sans-serif;
	width: 100px;
	margin-top: 3px;
	text-align: center;
	
	}
	
	#product_content_div{	
	margin: 0 auto;
	width: 100%;
	
	}	
	
	
	
	
	
	

	</style>	
</head>
<!-- 헤더 -->
<header>
<%@ include file="../include/header.jsp" %>
</header>
<!-- body -->
<body>
<br><br><br><br><br><br><br><br>

<div class="container">	
<!-- 메인메뉴 -->
<nav id="menu" class="woocommerce-breadcrumb"><a href="/">Home</a> / <a href='/products/productList?product_type=${productView.product_type}'>${productView.product_type_name}</a> / ${productView.product_name}</nav>
<br>

	<div class="container">
	<form method="post" onsubmit="return false;">
	
		<div class="row">
		<!-- 사진 -->
		<div id="img" class="col-md-6">															
			<img src="${productView.img_view}" alt="이미지"></img>
		</div>	
		
			<div id="content" class="col-md-6">			
				<!-- 상품이름 -->
				<h1 class="product_name">${productView.product_name}</h1>
				
				<!-- 조회수 -->
				<input type="hidden" value="${productView.product_read}"/>
				<input type="hidden" value="${productView.product_code}"/>
				
				<!-- 가격 -->
				<div>
					<c:if test="${productView.product_count <= 0}">				
					<p style="color: red;" class="product_price"><span>SOLD OUT</span></p>
					</c:if>	
					<c:if test="${productView.product_count > 0}">			
					<p class="product_price"><span>${productView.product_price}&nbsp;KRW</span></p>	
					</c:if>				
				</div>
				
				<!-- 설명 -->
				<div id="content_content">			
					<p class="product_content">${productView.product_content}</p>			
				</div>
				
				<!-- 수량선택 -->			
				<div id="product_content_div">				
					<label style="font-size: 16px; font-family: sans-serif;">수량</label><br><hr>
					<div>
						<input id="product_content_input" onkeyup="productContentBuy()" onclick="productContentBuy()" type="number" step="1" min="1" max="" name="product_content_buy" value='1' size="10"/>
						<span id="priceResult" style="font-size: 18px; font-family: sans-serif; float: right;">${productView.product_price}&nbsp;KRW</span>					
					</div>					
				</div><br><br>
				
				<div class="row">
					
					<!-- 구매하기 -->
					<div class="col-md-4">
						<div class="btn1">
						<a href="#"><button type="submit" id="Buy" class="btn1 btn-outline-dark btn-lg">
							<i class="fa fa-krw" aria-hidden="true"></i>&nbsp;Buy
						</button>
						</a>
						</div>
					</div>				
							
					<!-- 장바구니담기 -->	
					<div class="col-md-4">
						<div class="btn1">
						<a href="#"><button type="submit" id="Cart" class="btn1 btn-outline-dark btn-lg">
							<i class="fa fa-shopping-cart fa-lg pt-1"></i>&nbsp;Cart
						</button>
						</a>
						</div>
					</div>							
					
					<!-- 좋아요 -->
					<div class="col-md-4">
						<div  class="btn1">
						<button onclick="like(${productView.product_code})" type="button" id="productLike" class="btn1 btn-outline-dark btn-lg">
						<i class="glyphicon glyphicon-heart-empty"></i>
						<span style="font-size: 17px; font-family: sans-serif;" id="likeResult">&nbsp;${productView.product_like}</span></button>
						</div>
					</div>						
							
					<!-- 관리자 로그인 시 -->
								
					<!-- 수정/삭제하기
					<div class="col-md-6">
						<div class="btn1">
						<a href="/products/updateProduct?product_code=${productView.product_code}"><button type="button" id="update" class="btn1 btn-outline-dark btn-lg">
							<i class="fa fa-address-card" aria-hidden="true"></i>&nbsp;수정 / 삭제
						</button>
						</a>
						</div>
					</div>
					-->
				
				</div>
			</div>
			<br><br><br>
			
		</div>				
	</form>		
	</div>
	<hr style="border-color: #A5A5A5;"><br><br>
	
	<!-- 리뷰 -->
	<div class="row">
		<div class="col-md-12">
			<h4 id="REVIEW">REVIEW&nbsp;<span class="badge badge-pill badge-dark">0</span></h4><br>
		</div>
		<div class="col-md-12">
			<p id="REVIEW_p">상품을 구매하신 분들이 작성한 리뷰입니다.</p>
		</div>
		
		<!-- 리뷰작성버튼 --> 
		<div class="col-md-2">
			<a href="#"><button id="REVIEW_b" class="btn btn-dark" type="button">구매평 작성				
			</button></a>
		</div>	
		
		
		
	</div><br><br><hr style="border-color: #A5A5A5;">
	
	<div class="row">
	
		<!-- 리뷰가없을시 -->
		<div class="col-md-12">
			<h2 style="text-align: center; height: 500px; padding-top: 200px; color: #979491;">
			등록된 구매평이 없습니다.
			</h2>
		</div>		
		
		
		
		
		<!-- 리뷰 -->
		<form method="">
		
		
		
		
		</form>
				
	</div>
</div>

<br><br><br><br><br><br>

<script type="text/javascript">

//실시간 가격
function productContentBuy()  {
    var buy = document.getElementById('product_content_input').value;
  
    document.getElementById("priceResult").innerText = buy * ${productView.product_price} + " KRW";
  }
  
//좋아요요 ajax사용으로 수정필요.. 중복, 새로고침
var click = true;
function like(product_code)  {	
	if(click) {
		location.href='productLike?product_code='+product_code;
		click = false;
	} else {
		alert("좋아요는 한번만 가능합니다.");
	}
    document.getElementById("likeResult").innerText = " " + ${productView.product_like};
  }
  


</script>

</body>
<!-- footer -->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>



</html>





