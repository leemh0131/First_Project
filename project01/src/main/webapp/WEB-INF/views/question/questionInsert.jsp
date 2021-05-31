<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/css/bootstrap.jsp" %>


<style type="text/css">

#star a{ text-decoration: none; color: gray; }
#star a.on{ color: red; }

</style>



<!-- Modal -->
<form onsubmit="return check()" name="f" method="post" action="questionInsert">
		
		    <div class="modal-header">
		    
			    <h6 class="modal-title" id="exampleModalCenterTitle">문의하기</h6>			    
			    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			    </button>
			    
		    </div>
		    
		    <!-- 인붓 -->
		    <div class="modal-body">		   
		    	<!-- 숨겨서 멤버코드 -->
		    	<input type="hidden" name="member_code" value="${member.member_code}"/>		    		 
		    	<div class="row">
		    		<div class="col-sm-12">
		    			<label>제목</label><input style="width: 100%" name="question_title" placeholder="제목입력"/>
		    		</div>
		    		<div class="col-sm-12">
		    			<label>문의</label><input style="height: 350px; width: 100%" name="question_content" placeholder="내용입력"/>
		    		</div>
				</div>
		    </div>
		    
		    <!-- 닫기 작성 버튼 -->
		    <div class="modal-footer">
		    	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    <button type="submit" class="btn btn-primary">문의하기</button>			    
		    </div>
		    
</form>

<script type="text/javascript">

//키보드사용
$(function() {
	$("#myModal").modal({
		keyboard:true
	});
});

//공백체크
function check() {	

	if(f.question_title.value == "" || f.question_title.value == null) {
		   alert("제목을 입력해 주세요.");
		   f.question_title.focus();
		   return false;
		}
		
		else if(f.question_content.value == "" || f.question_content.value == null) {
		   alert("내용를 선택해주세요.");
		   f.question_content.focus();
		   return false;
		}		

	  else return true;

}

</script>






