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
        
		<!-- 페이징 -->		
		<ul class="pagination justify-content-center">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Prev</a></li>
			</c:if>
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
			</c:if>
		</ul>	
		<!-- 페이징 -->
        
        
        <c:if test="${member.mlevel == 0}">
        <!-- 관리자 버튼 작성 -->
		<div style="float: right;">
	        <a href="/board/boardInsert"><button type="button" class="btn btn-outline-dark btn-lg">
			<i class="fa fa-address-card" aria-hidden="true"></i>&nbsp;작성
			</button>
			</a>
		</div>
		</c:if>
        <br><br><br><br><br><br>

</div>
<script type="text/javascript">
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	var url = "${pageContext.request.contextPath}/board/boardList";
	
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/board/boardList";
	url = url + "?page=" + page;
	url = url + "&range=" + range;

	location.href = url;	

}
//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	var url = "${pageContext.request.contextPath}/board/boardList";
	
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	location.href = url;
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