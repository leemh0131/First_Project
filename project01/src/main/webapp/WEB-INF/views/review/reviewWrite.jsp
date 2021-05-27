<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/css/bootstrap.jsp" %>


<style type="text/css">

#star a{ text-decoration: none; color: gray; }
#star a.on{ color: red; }

</style>



<!-- Modal -->
<form onsubmit="return check()" name="f" method="post">
		
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
		    	<div class="row">
		    		<div class="col-md-3">	    	
			    		<p>이민호 님</p>
			    	</div>			    	
			    	<!-- 리뷰 별 -->
			    	<div class="col-md-6">
						<!-- 부모 --> 
						<P id="star"> 별점
						<!-- 자식들-->
							<a href="#" value="1">★</a> 
							<a href="#" value="2">★</a> 
							<a href="#" value="3">★</a>
							<a href="#" value="4">★</a>
							<a href="#" value="5">★</a>
							<input style="border:none; width:15px;" name="review_star" id="review_star" value="" readonly="readonly"/>
						<p>
					</div>
					
					<div class="col-md-12">
      					<label>제목</label><input style="width: 100%;" maxlength='20' placeholder="20자이하 제목" name="review_title"/><br>
                    </div>

      				<div class="col-md-12">
      					<label>내용</label><input style="width: 100%; height: 100px;" maxlength='100' placeholder="100자이하 한줄평" name="review_content"/><br><br>
      				</div>

      				<div class="col-md-12">
      					<input type="file" name="files" multiple="multiple" value="사진없음"/>
      				</div>

				</div>	

		    </div>
		    <!-- 닫기 작성 버튼 -->
		    <div class="modal-footer">
		    	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    <button type="submit" class="btn btn-primary">리뷰작성</button>			    
		    </div>
		    
</form>

<script type="text/javascript">


//별
$('#star a').click(function(){ 
	$(this).parent().children("a").removeClass("on"); 
	$(this).addClass("on").prevAll("a").addClass("on"); 
	
	var star = ($(this).attr("value"));
	
	document.getElementById("review_star").value = star;	
	
	
});

//키보드사용
$(function() {
	$("#myModal").modal({
		keyboard:	true
	});
});

</script>






