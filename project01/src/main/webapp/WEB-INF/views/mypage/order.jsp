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
	<title>주문내역</title>
	
	<style type="text/css">
	body{
		background-color: #F8F8F8;
		padding-top: 180px;
	}
	
	td, th{
		font-size: 14px;
	}
	
	table{
		margin-left: auto;
		margin-right: auto;
	}
	
	img{
		width: 100px;
		height: 100px;
		object-fit: fill;
	}
	
	#pdt_name{
		width: 25%;
	}
	</style>
	<!-- DateTimePicker CSS -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- DateTimePicker CSS 종료 -->
</head>
<%@include file="../include/header.jsp" %>
<body>
	<div class="container">
		<h1>주문내역</h1><hr/>
		<br/>
		
		
		<form class="form-horizontal" action="${path}/mypage/order" method="post">
		
			<div class="form-group" align="center">
				<!-- datepicker -->
				<input type="text" name="from_date" id="from_date" value="${from_date}"> ~
		  		<input type="text" name="to_date" id="to_date" value="${to_date}">
				<!-- datepicker -->
			</div>
			
			
			<div class="form-group" align="center">
				<button type="submit" id="btn_view" class="btn btn-success btn-sm">보기</button>
			</div>
		</form> 
		
		
		
		<table style="width: 70%" class="table table-hover table-responsive">
			<thead class="thead-dark">
				<tr>
					<th>주문일자</th>
					<th colspan="2">상품명</th>
					<th>주문수량</th>
					<th>결제금액</th>
					<th>상세</th>
					<th>배송상태</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${order_list}" var="TestBean">
					<tr>
						<td><fmt:formatDate value="${TestBean.orders.order_date}" pattern="yyyy-MM-dd"/></td>
						<td><img src="${TestBean.products.img_view}" alt="이미지"/></td>
						<td id="pdt_name"><a href="#">${TestBean.products.product_name}</a></td>
						<td>${TestBean.orders.order_count}</td>
						<td>${TestBean.orders.total_price}</td>
						<td><a href="${path}/mypage/view?order_code=${TestBean.orders.order_code}"><button class="btn btn-dark btn-sm">상세보기</button></a></td>
						<td>${TestBean.orders.order_status}</td>				
					</tr>
				</c:forEach>
			</tbody>
		</table>
					
					
		<!-- 페이징 처리 -->	
		<!-- <div class="col-sm-offset-4">
			<ul class="btn-group pagination">
			    <c:if test="${pageMaker.prev }">
			    <li>
			        <a href='<c:url value="${path}/mypage/order?page=${pageMaker.startPage-1 }"/>'><span class="glyphicon glyphicon-chevron-left"></span></a>
			    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
			    <li>
			        <a href='<c:url value="${path}/mypage/order?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
			    </li>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			    <li>
			        <a href='<c:url value="${path}/mypage/order?page=${pageMaker.endPage+1 }"/>'><span class="glyphicon glyphicon-chevron-right"></span></i></a>
			    </li>
			    </c:if>
			</ul>
			
		</div>-->
	</div>
</body>
<%@ include file="../include/footer.jsp" %>
<!-- 
<script src="../../../resources/js/jquery-3.6.0.min.js"></script>
<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
-->
<script type="text/javascript">
$(function() {
    //모든 datepicker에 대한 공통 옵션 설정
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd', 	//Input Display Format 변경
        showMonthAfterYear:true, 	//년도 먼저 나오고, 뒤에 월 표시
        showButtonPanel: true,
        changeYear: true, 			//콤보박스에서 년 선택 가능
        changeMonth: true, 			//콤보박스에서 월 선택 가능
        prevText: '이전 달',			//prev 버튼의 툴팁내용
        nextText: '다음 달',			//next 버튼의 툴팁내용
        //showOn: "both", 			//button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        //buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", 			//버튼 이미지 경로
        //buttonImageOnly: true,	//기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        yearSuffix: "년", 			//달력의 년도 부분 뒤에 붙는 텍스트
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //달력의 월 부분 텍스트
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 				//달력의 월 부분 Tooltip 텍스트
        dayNamesMin: ['일','월','화','수','목','금','토'], 													//달력의 요일 부분 텍스트
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],	 											//달력의 요일 부분 Tooltip 텍스트
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        maxDate: 0,																						//오늘 이후 날짜는 선택 못함.
    });
    
    /*
    $("#from_date" ).datepicker();  
    $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px'});  //아이콘(icon) 위치
    $('.ui-datepicker ').css({ "margin-left" : "141px", "margin-top": "-223px"});  //달력(calendar) 위치
    $('img.ui-datepicker-trigger').attr('align', 'absmiddle');
    */

    $("#from_date").datepicker({
		onClose: function( selectedDate ) {
			//시작일(startDate) datepicker가 닫힐때
			//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
			$("#to_date").datepicker( "option", "minDate", selectedDate );
		}
	});
	
	$("#to_date").datepicker({
		onClose: function( selectedDate ) {
			// 종료일(endDate) datepicker가 닫힐때
			// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
			$("#from_date").datepicker( "option", "maxDate", selectedDate );
		}
	});
	
	//버튼 이벤트
	$("#btn_view").click(function(){
		var from_date = $("#from_date").val();
		var to_date = $("#to_date").val();
		
		//from_date = $("#from_date").datepicker('getDate');
		//to_date = $("#to_date").datepicker('getDate');
		
		if(from_date == ""){
			alert("시작날짜를 입력하세요.");
			$("#from_date").focus();
			return false;
		}
		
		if(to_date == "") {
			alert("끝 날짜를 입력하세요.");
			$("#to_date").focus();
			return false;
		}
		
	});
	
});
   

</script>

</html>