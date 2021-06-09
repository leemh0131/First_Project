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
		padding-top: 180px;
	}
	
	img{
		width: 100px;
		height: 100px;
		object-fit: fill;
	}
	
	</style>
	
</head>
<%@include file="../include/header.jsp" %>
<body>
	<div class="container">
		
		<h1>찜 목록</h1><hr/>
		<div class="form-group float-right">
			<button type="button" class="btn-dark btn-sm" id="btn_delete">선택삭제</button>
			
		</div>
		<table class="table table-hover table-responsive">
			<thead class="thead-dark">
				<tr>
					<th><input type="checkbox" id="select_all" name="select_all"/></th>
					<th colspan="2">상품명</th>
					<th>가격</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${likey_list}" var="LikeyVO">
					<tr>
						<td><input type="checkbox" class="select_item" name="select_item" data-bno="${LikeyVO.likey.bno}"  /></td>
						<td style="width: 10%"><img src="${LikeyVO.products.img_view}" alt="상품썸네일"/></td>
						<td><a href="#">${LikeyVO.products.product_name }</a></td>
						<td> ${LikeyVO.products.product_price}</td>
						<td><fmt:formatDate value="${LikeyVO.likey.register_date}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<%@ include file="../include/footer.jsp" %>

<script src="../../../resources/js/jquery-3.6.0.min.js"></script>
<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		
		//제일 위에 체크박스 클릭했을때의 동작을 처리
		$("#select_all").click(function(){ 
			if($("#select_all").prop("checked")){
				//console.log('전체선택 버튼 눌림');
				$("input[name='select_item']").prop("checked", true);
			}else{
				$("input[name=select_item]").prop("checked", false);
			}
		});
		
		//항목 체크박스를 누르면 제일 위에 체크박스는 클릭 해제가 되야함.
		$(".select_item").click(function() { 
			$("#select_all").prop("checked", false);
		});
		
		//체크한 항목을 삭제처리하는 ajax
		$("#btn_delete").click(function(){ //id = "btn_delete"
			var selected_cnt = $("input[name='select_item']:checked").length; //selected_cnt = 선택된 항목의 갯수
		
			if(selected_cnt == 0){ //선택된 항목이 없는경우
				alert("상품을 선택하세요.");
			}else{
				var confirm_val = confirm(selected_cnt + "개의 항목을 삭제하시겠습니까?"); 	//alert 창을 띄우고 yes/no 값을 받아와 confirm_val에 저장.
				
				if(confirm_val) {													//삭제 값이 yes일 경우
					var checkedItemArr = new Array(); //배열선언
			   
					$("input[name='select_item']:checked").each(function(){
						checkedItemArr.push($(this).attr("data-bno"));
					});
					
					$.ajax({
						type : "post",								//전송할 방식.
						url : "${path}/mypage/delete_likey", 	//전송할 컨트롤러 이름.
				    	data : {selected_item : checkedItemArr},	//컨트롤러로 전송하는 변수 checkedItemArr 값을 담아 "selected_item" 이라는 변수 이름으로 컨트롤러에게 넘겨줌		
				    	success : function(result){					//result값이 1 = 전송 / 0 = 전송실패.
				    		if(result == 1) {
				    			alert(selected_cnt + "개가 삭제되었습니다.");
				    			location.href = "${path}/mypage/likey";	// mypage/likey 를 새로고침 시킴
				    		}else{
				    			alert("삭제 실패!!!");
				    		}
				    	},
				    	error: function(request, status, error){
				    		alert("ajax 오류");
				    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				    	}
					});
				}
			}
		});
		
	});

</script>

</html>