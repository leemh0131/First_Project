<%@ page import="com.myproject.domain.productVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 ${board_title}</title>
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
	<h3>logotest 공지사항입니다.</h3>
	<hr><br>	
		<table class="table table-striped">			
            <tr>
            	<th style="font-size: 16px;" scope="row">Writer</th>
                <td style="font-size: 15px;">관리자</td>
                <th>  </th>
                <td>  </td>
				<th style="font-size: 16px;" scope="row">Title</th>
                <td style="font-size: 15px;">${boardView.board_title}</td>
                <th>  </th>
                <td>  </td>
                <th style="font-size: 16px;" scope="row">Date</th>
                <td style="font-size: 15px;" ><fmt:formatDate value="${boardView.board_date}" type="both"/></td>
                <th>  </th>
                <td>  </td>
                <th style="font-size: 16px;" scope="row">Views</th>
                <td style="font-size: 15px;" >${boardView.board_readcount}</td>
            </tr>            
        </table>
        <div class="container">
       		<h3>${boardView.board_content}</h3>            
        </div>
		
	<br><br><br><br><br><br>
	
	<!-- 관리자 버튼 수정/삭제 -->
		<div style="float: right;">
	        <a href="/board/boardUpdate?board_num=${boardView.board_num}"><button type="button" id="update" class="btn1 btn-outline-dark btn-lg">
			<i class="fa fa-address-card" aria-hidden="true"></i>&nbsp;수정 / 삭제
			</button>
			</a>
		</div>

</div>
</body>
<br><br><br><br><br><br><br><br>
<br><br><br><br>
<!-- footer -->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</html>