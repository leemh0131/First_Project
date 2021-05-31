<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">	
	<title>쇼핑몰 메인 페이지</title>	
</head>

<!-- 헤더 -->
<header>
<%@ include file="include/header.jsp" %>
</header>

<!-- body -->
<body>
<br><br><br><br><br><br><br><br><br><br>
<div class="container">

<c:if test="${member.mlevel == 1 || empty member.mlevel}">
<H2>메인페이지입니다</H2>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</c:if>

<c:if test="${member.mlevel == 0}">
<H2 style="color: red;">관리자모드입니다</H2>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</c:if>


</div>
</body>

<!-- footer -->
<footer>
<%@ include file="include/footer.jsp" %>
</footer>

</html>

