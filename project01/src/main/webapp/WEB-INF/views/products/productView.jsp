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
	
	#product_cnt{
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
	<form id="pos" name="f" method="post" onsubmit="return false;" action="/order">
	
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
				<input id="product_code" type="hidden" value="${productView.product_code}"/>				
				
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
				<input type="hidden" id="product_count" name="product_count" value="${productView.product_count}">	
				<div id="product_content_div">				
					<label style="font-size: 16px; font-family: sans-serif;">수량</label><br><hr>
					<div>						
						<input name="order_count" id="order_count" onkeyup="product_cntResult()" onclick="product_cntResult()" type="number" step="1" min="1" max="" value='1' size="10"/>									
						<span id="priceResult" style="font-size: 18px; font-family: sans-serif; float: right;">${productView.product_price}&nbsp;KRW</span>					
					</div>					
				</div><br><br>
				
				<div class="row">
					
					<!-- 구매하기 -->
					<div class="col-md-4">
						<div id="btn3" class="btn1">
						<c:if test="${productView.product_count > 0}">
						<a href='/order/order?product_code=${productView.product_code}'><button type="button" id="Buy" onclick="ck()" class="btn1 btn-outline-dark btn-lg">
							<i class="fa fa-krw" aria-hidden="true"></i>&nbsp;Buy
						</button>
						</a>
						</c:if>
						<c:if test="${productView.product_count <= 0}">
						<button style="color: red;" disabled="disabled" type="button" id="Buy" onclick="ck()" class="btn1 btn-outline-dark btn-lg">
							SOLD OUT
						</button>						
						</c:if>
						
						
						</div>
					</div>				
							
					<!-- 장바구니담기 -->	
					<div class="col-md-4">
						<div class="btn1">
						<a href="#"><button type="button" id="Cart" class="btn1 btn-outline-dark btn-lg">
							<i class="fa fa-shopping-cart fa-lg pt-1"></i>&nbsp;Cart
						</button>
						</a>
						</div>
					</div>							
					
					<!-- 좋아요 -->
					<c:if test="${!empty member.mlevel}">
					<div class="col-md-4">
						<div  class="btn1">
						<button onclick="like(${productView.product_code})" type="button" id="productLike" class="btn1 btn-outline-dark btn-lg">
						<i class="fa fa-heart"></i>
						<span style="font-size: 17px; font-family: sans-serif;" id="likeResult">&nbsp;${productView.product_like}</span></button>
						</div>
					</div>						
					</c:if>
					
					<!-- 로그인 후 좋아요 가능 -->
					<c:if test="${empty member.mlevel}">
					<div class="col-md-4">
						<div  class="btn1">
						<button onclick="logoutlike()" type="button" id="productLike" class="btn1 btn-outline-dark btn-lg">
						<i class="fa fa-heart"></i>
						<span style="font-size: 17px; font-family: sans-serif;" id="likeResult">&nbsp;${productView.product_like}</span></button>
						</div>
					</div>						
					</c:if>
					
					<!-- 관리자 로그인 시 -->							
					<!-- 수정/삭제하기 -->
					<c:if test="${member.mlevel == 0 }">					
					<div class="col-md-6">
						<div class="btn1">
						<a href="/products/updateProduct?product_code=${productView.product_code}"><button type="button" id="update" class="btn1 btn-outline-dark btn-lg">
							<i class="fa fa-address-card" aria-hidden="true"></i>&nbsp;수정 / 삭제
						</button>
						</a>
						</div>
					</div>
					</c:if>					
				
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
			<h4 id="REVIEW">REVIEW&nbsp;<span class="badge badge-pill badge-dark">${reviewCnt}</span></h4><br>
		</div>
		
		<div class="col-md-12">
			<p id="REVIEW_p">상품을 구매하신 분들이 작성한 리뷰입니다.</p>
		</div>
		
		<!-- 리뷰작성버튼 
		<div class="col-md-2">
			<a href="#"><button id="REVIEW_b" class="btn btn-dark" type="button">구매평 작성				
			</button></a>
		</div>
		-->
		
		<!-- 임시용 리뷰 버튼 -> 구매현황페이지 -> 구매완료면 리뷰작성가능 하게 구현 -->
		<div class="col-md-2">
			<a onclick="fnModuleInfo(${productView.product_code})"> <button id="REVIEW_b" class="btn btn-dark" type="button">구매평 작성				
			</button></a>
		</div>
		
		
		<!-- Moa Modal-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    		<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">		    
		    	</div>
		  	</div>
		</div>		
		
		
	</div><br><br><hr style="border-color: #A5A5A5;">
	
	
		<c:choose>
			<c:when test = "${!empty reviewAll}">	
				<!-- 리뷰 -->
				<c:forEach items="${reviewAll}" var="reviewVO">	
				<div class="row" style="margin: 100px, 100px, 100px, 100px;">
					
					<input type="hidden" value="${reviewVO.review_num}" />
				
					<!-- 이름 -->
					<div class="col-md-2">				
						<h6 style="font-weight:bold;">${reviewVO.member_name}&nbsp;님</h6>
					</div>
					
					<!-- 별점 -->
					<div class="col-md-10">
					<c:choose>
						<c:when test="${reviewVO.review_star == 1}">
			        		<p style="font-size:20px; color: #FF0000;">★</p>
			   			</c:when>
			   			<c:when test="${reviewVO.review_star == 2}">
			        		<p style="font-size:20px; color: #FF0000;">★★</p>
			   			</c:when>
			   			<c:when test="${reviewVO.review_star == 3}">
			        		<p style="font-size:20px; color: #FF0000;">★★★</p>
			   			</c:when>
			   			<c:when test="${reviewVO.review_star == 4}">
			        		<p style="font-size:20px; color: #FF0000;">★★★★</p>
			   			</c:when>
			   			<c:when test="${reviewVO.review_star == 5}">
			        		<p style="font-size:20px; color: #FF0000;">★★★★★</p>
			   			</c:when>				
					</c:choose>
					</div>
				
				<!-- 사진 -->
				<div class="col-md-2" style="width:150px; height: 190px;">
					<img src="${reviewVO.review_Timg}" style="width:150px; height: 190px;"/>
				</div>
				
				<div class="col-md-10">
				
					<!-- 제목	 -->
					<h6 style="font-weight:bolder;" >${reviewVO.review_title}				
						<!-- 날짜 -->
						<label style="float: right;"><c:set var="date" value="${reviewVO.review_date}"/><fmt:formatDate value="${date}"/></label>
					</h6>
					
					<!-- 내용 -->
					<div class="col-md-10">		
						<h6>${reviewVO.review_content}</h6>
					</div>
					
					<!-- 본인삭제버튼 -->
					<c:if test="${reviewVO.member_code == member.member_code}">
					<div style="float: right;" class="col-md-2">		
						<button name="review_num" onclick="del(${reviewVO.review_num})" style="width: 70px;" type="button" class="btn1 btn-outline-dark btn-sm">삭제</button>
					</div>
					</c:if>
					
					<!-- 관리자삭제버튼 -->
					<c:if test="${member.mlevel == 0}">
					<div style="float: right;" class="col-md-2">		
						<button name="review_num" onclick="del(${reviewVO.review_num})" style="width: 70px;" type="button" class="btn1 btn-outline-dark btn-sm">삭제</button>
					</div>
					</c:if>
				</div>
				
			</div> <hr>
			</c:forEach>		
		</c:when>
		<c:otherwise>
			<!-- 리뷰가없을시  -->
			<div class="row">
				<div class="col-md-12">
					<h2 style="text-align: center; height: 500px; padding-top: 200px; color: #979491;">
					등록된 구매평이 없습니다.
					</h2>
				</div>
			</div>	
		</c:otherwise>	
		</c:choose>
			
	
</div>


<br><br><br>

<script type="text/javascript">
//쿠키사용
var setCookie = function(name, value, exp) {
var date = new Date();
date.setTime(date.getTime() + exp*24*60*60*1000);
document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
};

var buy = 1;
var product_count = document.getElementById('product_count').value;

//실시간 가격
function product_cntResult() {
	
	buy = document.getElementById('order_count').value;	
 	document.getElementById("priceResult").innerText = buy * ${productView.product_price} + " KRW"; 	
 	
 	if(product_count < buy){
 		alert("재고수량이 부족합니다.\n수량을 내려주세요!");
 		const target = document.getElementById('Buy');
 		target.disabled = true;
 		
 	} else {
 		
 		const target = document.getElementById('Buy');
 		target.disabled = false;
 		
 	}
 	
 	
}


function ck() {
	//상풍코드 
	var productCode = document.getElementById('product_code').value;
	//쿠키상풍코드
	setCookie('product_code', productCode, 1);
	//쿠키상품갯수
	setCookie('order_count', buy, 1);
	
}



//모달사용
function fnModuleInfo(str){
   $('#myModal .modal-content').load("../../review/reviewWrite?product_code="+str);
   $('#myModal').modal();
}

//삭제
function del(review_num) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='../review/reviewdelete?review_num=' + review_num;
	}
}

function logoutlike() {
	alert("로그인 후 이용해주세요.")	
}

  
//좋아요 ajax사용 중복수정
/* var click = true;
function like(product_code) {
	if(click) {
		 $.ajax({
		        url : 'productLike',
		        type : 'post',
		        data : {'product_code': product_code},
		        success : function(data){
		        	document.getElementById("likeResult").innerText = " " + data;
		        }
		    });
	} else {
		alert("좋아요는 한번만 가능합니다.");
	}  	
} */
  
  
  
  
//좋아요 ajax사용 중복수정필요
function like(product_code) {	
$.ajax({
       url : 'productLike',
       type : 'post',
       data : {'product_code': product_code},
       success : function(data){
       	document.getElementById("likeResult").innerText = " " + data;
       }
   });
}


</script>

</body>
<!-- footer -->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>



</html>





