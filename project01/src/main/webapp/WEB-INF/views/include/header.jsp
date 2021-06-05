<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/css/bootstrap.jsp" %>
<style>

/* 바디 배경색 */
body {
	background-color: #F9F9F9 !important;
	}
	
.nav-item:hover {	 
	box-shadow: 1px 1px 20px #ddd;
}

/* 어드민아이콘링크비활성화 */
.admin {
	pointer-events: none;
}

/* 로고 */
#logo:link { color: black; text-decoration: none;}
#logo:visited { color: black; text-decoration: none;}
#logo:hover { color: black; text-decoration: none;}
#logo {
	font-size: 60px;	
	font-weight: bolder;
	font-family: 'Tangerine', cursive;
}

/* 카테고리 로그인 장바구니 폰트크기*/
.nav-item, .dropdown-item{
font-size: 17px;
}

/* 카테고리 */
#id_nav-item{	
	font-style: oblique;
}
</style>

<div id="header" class="text-dark navbar navbar-default fixed-top" >
    
    <!--카테고리-->
    <div class="col-md-5 py-0 text-dark">
	    <ul id="id_nav-item" class="nav text-dark">
	        <li class="nav-item ml-auto">
	          <a href="../products/productList" class="nav-link active"><span style="font-weight: normal;" class="text-dark">Best10</span></a>
	        </li>
	        <li class="nav-item">
	          <a href="../products/productList?product_type=1" class="nav-link active"><span style="font-weight: normal;" class="text-dark">Outer</span></a>
	        </li>
	        <li class="nav-item">
	          <a href="../products/productList?product_type=2" class="nav-link active"><span style="font-weight: normal;" class="text-dark">Top</span></a>
	        </li>
	        <li class="nav-item">
	          <a href="../products/productList?product_type=3" class="nav-link active"><span style="font-weight: normal;" class="text-dark">Pants</span></a>
	        </li>
	        <li class="nav-item">
	          <a href="../products/productList?product_type=4" class="nav-link active"><span style="font-weight: normal;" class="text-dark">Accessory</span></a>
	        </li>
	        <li class="nav-item text-dark mr-2">
	          <a href="../products/productList?product_type=5" class="nav-link active"><span style="font-weight: normal;" class="text-dark">Shoes</span></a>
	        </li>
	    </ul>
    </div>
    <!--카테고리종료-->   	
    
    <!-- 로고 -->    
    <div class="col-md-2 text-dark">
    	<h1 class="text-center py-4 m-0"><a id="logo" href="/">LogoTest</a></h1>
    </div>
    <!-- 로고종료 -->
    
    <!-- 검색창 -->
    <div class="col-md-2">
        <form onsubmit="return check()" name="f" class="form-inline my-lg-1 py-2" action="productList" method="post">
        	<input class="form-control mr-sm form-control-sm w-50" type="text" value="${keyword}" name="keyword" placeholder="Search" id="keyword">
        	<button name="btnSearch" id="btnSearch" class="btn text-dark btn-lg" contenteditable="true"><i class="fa fa-search"></i></button>
        </form>
    </div>
    <!-- 검색창 종료-->
    
    <c:choose>
    <c:when test="${empty member}">
    <!-- 비 로그인 -->
    <div class="col-md-3 my-0 text-dark">
        <ul class="nav">
        
	        <!-- 비로그인 장바구니 -->
	        <li class="nav-item text-dark"><a onclick="not_loginCart()" class="nav-link" href="#"><i class="fa fa-shopping-cart fa-lg text-dark pt-1"></i><br></a></li>
	        
	        <!-- 로그인 -->
	        <li class="nav-item"><a class="nav-link text-dark" href="/member/login">Login</a></li>
	        <!-- 회원가입 -->	        
	        <li class="nav-item"><a class="nav-link text-dark" href="/member/join">Join</a></li>
	       	<!-- 비회원메뉴 -->        
	        <li class="nav-item dropdown text-dark mr-auto">
	            <a class="nav-link dropdown-toggle text-dark" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
	            	<span class="text-dark">Menu</span>
	            </a>
	            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 46px, 0px);">
		            <a class="dropdown-item" href="/board/boardList">공지사항</a>
		            <a class="dropdown-item" onclick="not_loginQnA()" href="#">문의하기</a>		            
		            <a class="dropdown-item" href="#">비회원조회</a>
	            </div>
	        </li>
        </ul>
    </div>
    <!-- 비 로그인 -->
    </c:when>
    <c:when test="${member.mlevel == 1}">
    <!-- 로그인 후 메뉴 -->
     <div class="col-md-3 my-0 text-dark">
        <ul class="nav">
         <!-- 장바구니 -->
	        <li class="nav-item text-dark"><a class="nav-link" href="/mypage/likey"><i class="fa fa-shopping-cart fa-lg text-dark pt-1"></i><br></a></li>
	         <!-- 로그인 메뉴 -->
	        <li class="nav-item dropdown text-dark mr-auto">
            <a class="nav-link dropdown-toggle text-dark" data-toggle="dropdown"
            href="#" role="button" aria-haspopup="true" aria-expanded="false">
             	<span class="text-dark">${member.member_name}&nbsp;님</span> 
            </a>
            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 46px, 0px);">
	            <a class="dropdown-item" href="mypage/mypage">마이페이지</a>
	            <a class="dropdown-item" href="/board/boardList">공지사항</a>
	            <a class="dropdown-item" href="/question/questionList">문의하기</a>	           
	            <a class="dropdown-item" href="#">주문조회</a>
	            <a class="dropdown-item" onclick="log_out()" href="${path}/member/logout">로그아웃</a>
            </div>
         </li>
        </ul>
     </div>
    <!--  로그인 후 메뉴 종료 --> 
    </c:when>
  	<c:when test="${member.mlevel == 0}">    
    <!-- 어드민로그인 후 메뉴 -->
    <div class="col-md-3 my-0 text-dark">
        <ul class="nav">
         <!-- 어드민 -->
	        <li class="nav-item text-dark"><a class="admin nav-link" href="#"><i class="fa fa-address-card fa-lg text-dark pt-1"></i><br></a></li>
	         <!-- 어드민 메뉴 -->
	        <li class="nav-item dropdown text-dark mr-auto">
	            <a class="nav-link dropdown-toggle text-dark" data-toggle="dropdown"
	            href="#" role="button" aria-haspopup="true" aria-expanded="false">
	             	<span class="text-dark">관리자모드</span> 
	            </a>
	            <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 46px, 0px);">	            
		            <a class="dropdown-item" href="/board/boardList">공지사항관리</a>
		            <a class="dropdown-item" href="/question/questionList">문의관리</a>
		            <a class="dropdown-item" href="#">주문관리</a>
		            <a class="dropdown-item" href="/products/insertProduct">상품등록</a>	            
		            <a class="dropdown-item" onclick="log_out()" href="${path}/member/logout">로그아웃</a>
	            </div>
         	</li>
        </ul>
    </div>
    <!-- 어드민로그인 후 메뉴 종료 -->    
    </c:when>    
	</c:choose>
</div>

<script>


function not_loginCart() {
	alert("로그인 후 장바구니를 이용해주세요.");
}

function not_loginQnA() {
	alert("로그인 후 1:1문의 가능합니다.");
}

//로그아웃
function log_out(){	
	alert("로그아웃했습니다.");  
}

//공백체크
function check() {
	
	if(f.keyword.value == "" || f.keyword.value == null) {
	   alert("상품이름을 작성 후 검색해 주세요.");
	   f.keyword.focus();
	   return false;
	}	

  else return true;

}

//url
$(document).on('click', '#btnSearch', function(e){
	
	if($('#keyword').val() == ""){
		return;	
	} else {
		
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/products/productList";	
		url = url + "?keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
		
	}
	
	

});	


</script>