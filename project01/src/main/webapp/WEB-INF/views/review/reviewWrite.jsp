<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/css/bootstrap.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
	<title>리뷰작성</title>
	
	<style type="text/css">
	
	#star a{ text-decoration: none; color: gray; }
	#star a.on{ color: red; }
	
	</style>
	
</head>
<body>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" id="myBtn">
  Launch demo modal
</button>







<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
    	<form onsubmit="return check()" name="f" method="post">
		<div class="modal-content">
		
		    <div class="modal-header">
		    
			    <h6 class="modal-title" id="exampleModalCenterTitle">리뷰작성</h6>			    
			    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			    </button>
			    
		    </div>
		    
		    <!-- 인붓 -->
		    <div class="modal-body">
		   
		    	<!-- 숨겨서 상품코드, 멤버코드 보낸다 -->
		    	<input type="hidden" name="product_code" value="${reviewWrite.product_code}"/>
		    	<!-- 나중에 헤드에서 멤버코드 값 가져오기 -->
		    	<input type="hidden" name="member_code" value="1"/>		    		    	
		    	<p>이민호 님</p>
		    	
		    	<!-- 리뷰 별 -->
		    	<div>
					<!-- 부모 --> 
					<P id="star"> 
					<!-- 자식들-->
						<a href="#" value="1">★</a> 
						<a href="#" value="2">★</a> 
						<a href="#" value="3">★</a>
						<a href="#" value="4">★</a>
						<a href="#" value="5">★</a>
						<input style="border:none; width:15px;" name="review_star" id="review_star" value="" readonly="readonly"/>
					<p>
				</div>				
      			<input maxlength='20' placeholder="20자이하 제목" name="review_title"/>
      			<input maxlength='100' placeholder="100자 이하 한줄평" name="review_content"/>
      			<input type="file" name="files" multiple="multiple" value="사진없음"/>  
      			    	
      					
		    		    
		    </div>
		    <!-- 닫기 작성 버튼 -->
		    <div class="modal-footer">
		    	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    <button type="submit" class="btn btn-primary">리뷰작성</button>			    
		    </div>
		    
		    
		    
		</div>
		</form>
    </div>
</div>





</body>
<script type="text/javascript">


//별
$('#star a').click(function(){ 
	$(this).parent().children("a").removeClass("on"); 
	$(this).addClass("on").prevAll("a").addClass("on"); 
	
	var star = ($(this).attr("value"));
	
	document.getElementById("review_star").value = star;	
	
	
});





$(document).ready(function() {	
	$("#myBtn").click(function() {
		$("#myModal").modal();
	});
});


$(function() {
	$("#myModal").modal({
		keyboard:	true
	});
});

</script>


</html>



