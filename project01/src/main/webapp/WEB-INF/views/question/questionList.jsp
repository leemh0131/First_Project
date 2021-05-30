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

     <h1 style="font-family: sans-serif; font-weight: bold; font-size: 35px">1:1문의</h1>
   		
        <hr><br>                    
        	
            <c:choose>
            	<c:when test="${!empty questionList}">				
				<table class="table table-hover">
		            <thead>
		                <tr style="font-family: sans-serif; font-weight: bold; font-size: 17px">
		                    <th>No</th>
		                    <th>Title</th>
		                    <th>Member_ID</th>
		                    <th>Writer</th>                    
		                    <th>Date</th>
		                    <th>답변</th>                      
		                </tr>
		            </thead>
		            
           			<tbody>	
           			<c:forEach items="${questionList}" var="vo" varStatus="status">			
						<tr onclick="location.href='/question/questionView?question_num=${vo.question_num}'" style="font-family: sans-serif; font-size: 16px">                	           	
							<td>${fn:length(questionList)-status.index}</td>
							<td>${vo.question_title}</td>
							<td>${vo.member_id}</td>
							<td>${vo.member_name}</td>
							<td><c:set var="date" value="${vo.question_date}"/><fmt:formatDate value="${date}"/></td>
							<c:choose>
								<c:when test = "${!empty vo.comment_content}">
								<td style="color: blue;">답변완료</td>
								</c:when>
								<c:otherwise>
								<td style="color: red;">답변대기</td>
								</c:otherwise>	
							</c:choose>                                                                         
						</tr>					
					</c:forEach> 
					</tbody>
        		</table> 				
				</c:when> 
				<c:otherwise>
					<div style="text-align: center; width: 100%; height: 300px; margin: auto;" >			
						<br><br><br><br><br><h1 style="height: 300px; color: #979491;">1:1문의가 없습니다.</h1>
					</div>		
				</c:otherwise>
            </c:choose>
            
            <!-- 문의하기 -->
            <div style="float: right;" class="col-md-2">
				<a onclick='fnModuleInfo(${member_code})'><button class="btn btn-dark" type="button">문의하기			
				</button></a>				
			</div>			
			
			<!-- Moa Modal-->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	    		<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content"></div>
			  	</div>
			</div>     
            
			
        <br><br><br>
        
        
        
        

</div>


<script type="text/javascript">
var ttt = true;
//모달사용
function fnModuleInfo(ee){   
   $('#myModal .modal-content').load("questionInsert?member_code=" + ee);
   $('#myModal').modal();
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
