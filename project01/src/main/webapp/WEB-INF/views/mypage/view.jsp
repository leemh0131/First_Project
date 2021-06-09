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
	<title>주문상세보기</title>
	
	<style type="text/css">
	body{
		background-color: #F8F8F8;
		padding-top: 180px;
	}
	
	img{
		width: 200px;
		height: 200px;
		object-fit: fill;
	}
	</style>
	
</head>
<%@include file="../include/header.jsp" %>
<body>
	<div class="container">
		<h1>주문상세보기</h1><hr/>
		
		<table class="table table-sm table-response" style="width: 80%;">
			
				<thead class="thead-dark">
					<tr>
						<th colspan="2">상품명</th>
						<th>수량</th>
						<th>금액</th>					
					</tr>									
				</thead>
				<tbody>
				<tr>
					<td style="width: 30%;"><img src="${orderDetailview.products.img_view}"/></td>
					<td><a href="#">${orderDetailview.products.product_name}</a></td>
					<td>${orderDetailview.orders.order_count}</td>
					<td>${orderDetailview.orders.total_price}</td>
				</tr>
			</tbody>
		</table>
		
		
		<h3>주문자정보</h3>
		<div class="table-sm table-orderinfo">		
            <table class="table table-borderless">
                <colgroup>
                    <col width="140" />
                    <col width="*" />
                    <col width="140" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><div class="">주문코드</div></th>
                        <td><div class="">${orderDetailview.orders.order_code}</div></td>
                        <th scope="row"><div class="">주문일자</div></th>
                        <td><div class=""><fmt:formatDate value="${orderDetailview.orders.order_date}" pattern="yyyy-MM-dd"/></div></td>
                    </tr>
                    <tr>
                        <th scope="row"><div class="">주문자</div></th>
                        <td><div class="">${orderDetailview.member.member_name}</div></td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <h3>배송정보</h3>
		<div class="table-sm table-orderinfo">		
            <table class="table table-borderless">
                <colgroup>
                    <col width="140" />
                    <col width="*" />
                    <col width="140" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><div class="">수취인</div></th>
                        <td><div class="">${orderDetailview.orders.reciever}</div></td>
                        <th scope="row"><div class="">연락처</div></th>
                        <td><!-- ${orderDetailview.orders.delivery_tel}-->010-0000-0000</td> <!-- 임시 -->
                    </tr>
                    <tr>
                        <th scope="row"><div class="">주소</div></th>
                        <td><div class="">${orderDetailview.orders.roadFullAddr}</div></td>
                    </tr>
                    
                    <tr>
                    	<th scope="row"><div class="">배송상태</div></th>
                        <td><div class="">${orderDetailview.orders.order_status}</div></td>
                        <th scope="row"><div class=""></div></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</div>
</body>
<%@ include file="../include/footer.jsp" %>

<script src="../../../resources/js/jquery-3.6.0.min.js"></script>
<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
<script>

</script>

</html>