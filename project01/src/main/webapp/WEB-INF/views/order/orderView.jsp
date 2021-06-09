<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세 주문 조회</title>
	
	<style>
		.container ul {list-style: none;}
		.container ul {border:5px solid #eee; padding:10px 20px; margin-bottom:20px;}
		.container ul li {border:1px solid #eee; padding:10px 20px; margin-bottom:20px;}
		.container .orderList 	   {border: 5px solid #eee; padding:10px 20px; margin-bottom:20px;}
		.container .orderList span {font-size:20px; font-weight:bold; display:inline-block;
		width:90px; margin-right:10px;}
		
		.orderlist {border: 5px solid #eee; padding:10px 20px; margin:20px 0;}
		.orderlist span {font-size:20px; font-weight:bold; display:inline-block; width:90px;}
		
		.orderView li {margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
		.orderView li::after {content:""; display:block; clear:both;}
		
		.imgView {float:left; width:200px;}
		.imgView img {width:200px; height:200px;}
		
		.info{float:right; width:calc(100% - 220px); line-height:2;}
		.info span {font-size:20px; font-weight:bold; display:inline-block; width:100px;
					margin-right:10px;}
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

	<h1 style="font-family: sans-serif; font-weight: bold; font-size: 35px">주문관리</h1>
	
		<hr><br>

		<div class="orderList">
			<c:forEach items="${orderView}" var="orderView">
				<p><span>수령인</span>${orderView.delivery_name}</p>
				<p><span>주소</span>${orderView.roadFullAddr}</p>
				<p><span>번호</span>${orderView.delivery_tel}</p>
				<p><span>상태</span>${orderView.order_status}</p>
				
				<div class="deliveryChange">
					<form role="form" method="post" class="deliveryForm">
									
							<input type="hidden" name="order_code" value="${orderView.order_code}"/>
							<input type="hidden" name="delivery"   class="delivery" value=""/>
									
							<button type="button" class="delivery1_btn">배송 중</button>
							<button type="button" class="delivery2_btn">배송 완료</button>
								
					</form>
				</div>
			</c:forEach>
		</div>
	
		<ul class="orderView">
			<c:forEach items="${orderView}" var="orderView">
			<li>
				<div class="imgView">
					<img src="${orderView.img_view}" alt="이미지"/>
				</div>
			<div class="info">
				<p>
					<span>상품명</span>${orderView.product_name}<br/>
					<span>상품가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.product_price}"/>원<br/>
					<span>구입수량</span>${orderView.order_count}개<br/>
					<span>총합</span><fmt:formatNumber pattern="###,###,###" value="${orderView.total_price}"/>원
				</p>		
			</div>
			</li>
			</c:forEach>
	
		</ul>
</div>

</body>
<br><br><br><br><br><br><br><br>
<br><br><br><br>
<!-- footer -->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>

<script type="text/javascript">

$(".delivery1_btn").click(function(){
	$(".delivery").val("배송 중");
	run();
});
										
$(".delivery2_btn").click(function(){
	$(".delivery").val("배송 완료");
	run();
});
											
function run(){
	$(".deliveryForm").submit();
}
							
</script>
</html>