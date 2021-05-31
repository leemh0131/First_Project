<%@ page import="com.myproject.domain.productVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1:1문의</title>
	<style type="text/css">
	
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: black; text-decoration: none;}
	
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

     <h1 style="font-family: sans-serif; font-weight: bold; font-size: 35px">1:1문의관리</h1>     	
        <hr><br>
        
        <!-- 문의내용 -->      
        <table class="table table-striped">			
            <tr>
                <th style="font-size: 16px;" scope="row">Member_ID</th>
                <td style="font-size: 15px;">${questionView.member_id}</td>                          
            	<th style="font-size: 16px;" scope="row">Writer</th>
                <td style="font-size: 15px;">${questionView.member_name}</td>                
				<th style="font-size: 16px;" scope="row">Title</th>
                <td style="font-size: 15px;">${questionView.question_title}</td>                
                <th style="font-size: 16px;" scope="row">Date</th>
                <td style="font-size: 15px;" ><fmt:formatDate value="${questionView.question_date}" type="both"/></td>                
            </tr>            
        </table>
        <div class="container">
       		<h3>${questionView.question_content}</h3>            
        </div>
        
        <c:if test="${empty questionView.comment_content}">
        <!--답변이 없을 시 문의삭제-->
        <div style="float: right;" class="col-md-2">			
			<button onclick="Q_del(${questionView.question_num})" type="button" id="btnDelete" class="btn btn-dark">
			문의삭제
			</button>			
		</div>
        </c:if>        
        
		
        <br><br><br><hr>
        
        <!-- 답변이있으면 보여준다. -->
        <table class="table table-striped">			
            <tr>                                        
            	<th style="font-size: 16px;" scope="row">Writer</th>
                <td style="font-size: 15px;">관리자</td>                
				<th style="font-size: 16px;" scope="row">Title</th>
                <td style="font-size: 15px;">${questionView.comment_title}</td>                
                <th style="font-size: 16px;" scope="row">Date</th>
                <td style="font-size: 15px;" ><fmt:formatDate value="${questionView.comment_date}" type="both"/></td>                
            </tr>            
        </table>
        <div class="container">
       		<h3>${questionView.comment_content}</h3>            
        </div>
        
        <c:if test="${member.mlevel == 0 && empty questionView.comment_content}">
        <!--관리자일시 답변작성 버튼을 보여준다.-->
        <div style="float: right;" class="col-md-2">
			<a onclick="fnModuleInfo(${questionView.question_num})"><button class="btn btn-dark" type="button">답변작성			
			</button></a>
		</div> 
		</c:if>
        
        <c:if test="${member.mlevel == 0 && !empty questionView.comment_content}">
        <!--관리자이고 답변이 있으면 답변삭제 버튼을 보여준다.-->
        <div style="float: right;" class="col-md-2">			
			<button onclick="del(${questionView.comment_num})" type="button" id="btnDelete" class="btn btn-dark">
			답변삭제
			</button>			
		</div>
        </c:if>
              
        
        <!-- Moa Modal-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    		<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content"></div>
		  	</div>
		</div>

</div>

<script type="text/javascript">
//모달사용
function fnModuleInfo(str){
   $('#myModal .modal-content').load("commentInsert?question_num="+str);
   $('#myModal').modal();
}

//답변삭제
function del(comment_num) {
	var chk = confirm("정말 답변을 삭제하시겠습니까?");
	if (chk) {
		location.href='commentDelete?comment_num='+comment_num;		
	}	
}

//문의삭제
function Q_del(question_num) {
	var chk = confirm("정말 문의을 삭제하시겠습니까?");
	if (chk) {
		location.href='questionDelete?question_num='+question_num;		
	}	
}


</script>


</body>
<br><br><br><br><br><br><br><br>
<br><br><br><br>
<!-- footer -->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</html>