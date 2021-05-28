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
        <table class="table table-striped">			
            <tr>
                <th style="font-size: 16px;" scope="row">Member_ID</th>
                <td style="font-size: 15px;" >${questionView.member_id}</td>                          
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

        <br><br><br><br><br><br>

</div>
</body>
<br><br><br><br><br><br><br><br>
<br><br><br><br>
<!-- footer -->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</html>