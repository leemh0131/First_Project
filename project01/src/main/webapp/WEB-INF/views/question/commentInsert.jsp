<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/css/bootstrap.jsp" %>


<style type="text/css">

#star a{ text-decoration: none; color: gray; }
#star a.on{ color: red; }

</style>



<!-- Modal -->
<form onsubmit="return check()" name="f" method="post" action="commentInsert">
		
		    <div class="modal-header">
		    
			    <h6 class="modal-title" id="exampleModalCenterTitle">답변작성</h6>			    
			    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">&times;</span>
			    </button>
			    
		    </div>
		    
		    <!-- 인붓 -->
		    <div class="modal-body">
		   
		    	<!-- 숨겨서 문의코드 -->
		    	<input type="hidden" name="question_num" value="${question_num}"/>		    		 
		    	<div class="row">
		    		<div class="col-sm-12">
		    			<label>제목</label><input style="width: 100%" name="comment_title" placeholder="제목입력"/>
		    		</div>
		    		<div class="col-sm-12">
		    			<label>답변</label><input style="height: 350px; width: 100%" name="comment_content" placeholder="내용입력"/>
		    		</div>
				</div>
		    </div>
		    <!-- 닫기 작성 버튼 -->
		    <div class="modal-footer">
		    	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    <button type="submit" class="btn btn-primary">답변하기</button>			    
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

	if(f.comment_title.value == "" || f.comment_title.value == null) {
		   alert("제목을 입력해 주세요.");
		   f.comment_title.focus();
		   return false;
		}
		
		else if(f.comment_content.value == "" || f.comment_content.value == null) {
		   alert("내용를 선택해주세ㄴ요.");
		   f.comment_content.focus();
		   return false;
		}		

	  else return true;

}

</script>






