<%@ page import="com.myproject.domain.productVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항</title>
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

     <h1 style="font-family: sans-serif; font-weight: bold; font-size: 35px">공지사항</h1>
        <hr><br>        
        <table class="table table-hover">
            <thead>
                <tr style="font-family: sans-serif; font-weight: bold; font-size: 17px">
                    <th>No</th>
                    <th>Title</th>
                    <th>Writer</th>
                    <th>Date</th>
                    <th>Views</th>                    
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${boardList}" var="vo" varStatus="status">
                <tr onclick="location.href='/board/boardView?board_num=${vo.board_num}'" style="font-family: sans-serif; font-size: 16px">                	           	
                    <td>${fn:length(boardList)-status.index}</td>
                    <td>${vo.board_title}</td>
                    <td>관리자</td>
                    <td><c:set var="date" value="${vo.board_date}"/><fmt:formatDate value="${date}"/></td>
                    <td>${vo.board_readcount}</td>                                                          
                </tr> 
            </c:forEach>             
            </tbody>
        </table>

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