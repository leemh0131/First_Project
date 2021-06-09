<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../resources/css/bootstrap.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<style type="text/css">
	
	#footer{
	 margin-top : auto:
	}
	
	</style>
</head>
<body>
<div id="wrap">
	<div id="header">		
		<!-- 헤더 -->
		<header>
		<%@ include file="../include/header.jsp" %>
		</header>
		<br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<div id="container" align="center">
		<form action="/member/login" method="post" onsubmit="return false;">		
			<div class="mlogin">
				<h2>회원 로그인</h2><br>
				<label class="id"> 
					<span class="col-sm-4"> 아 이 디</span> 
					<input class="col-sm-8" id="member_id" name="member_id" maxlength="16" type="text">
				</label> 
				<br>
				<label class="password"> 
					<span class="col-sm-4">패스워드</span> 
					<input class="col-sm-8" id="member_pw" name="member_pw" maxlength="16" type="password">
				</label>
				<p class="security">
					<input id="member_check_save_id" name="member_check_save_id" type="checkbox"> 
					<label for="member_check_save_id">아이디 저장</label>
				</p>
				<button class="btn btn-primary" type="button" id="submit">로그인</button>
				<button class="cancle btn btn-danger" type="button" >취소</button>
				<br><br>		
				<ul>
					<li class="join">"아직 회원이 아니십니까?" 
						<a href="${path}/member/join">회원가입하기</a>
					</li>
					<!-- <li>"아이디를 잊으셨나요?" 
						<a href="#">아이디 찾기</a>
					</li>
					<li>"비밀번호를 잊으셨나요?" 
						<a href="#">비밀번호 찾기 찾기</a>
					</li> -->
				</ul>
			</div>
		</form>
		<br><br>
	</div>

	<div id="footer">
		<!-- footer -->
		<footer>
		<%@ include file="../include/footer.jsp" %>
		</footer>
	</div>
	
	
</div>

<script type="text/javascript">
$(document).ready(function(){
	//취소
	$(".cancle").on("click", function(){
		location.href="/";
	})
	
	//로그인 버튼을 눌렀을 때
	$("#submit").on("click",function(){
		if($("#member_id").val()==""){
			alert("아이디를 입력해주세요.");
			$("#member_id").focus();
			return false;
		}
		if($("#member_pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#member_pw").focus();
			return false;
		}
		// 로그인 아이디 저장버튼을 위해
		$.ajax({
			url : "/member/login",
			type : "post",
			dataType : "text",
			////data : {"userid" : $("#userid").val()},
			data : {"member_id" : $("#member_id").val(), "member_pw" : $("#member_pw").val()},
			success : function(data){
				//alert("Return Value : " + data);
				if(data == "N") {
					alert("로그인 정보를 확인해주세요.");
				}
				else if(data == "Y") {
					
					var set_id = $("#member_id").val();
					
					if($("#member_check_save_id").is(":checked")){
						setPopCookie("auto_id", set_id , 365);
					}else{
						setPopCookie("auto_id", set_id , -1);
					}
					
					location.href = "../";
				}
			}
			, error : function(data){
				console.log(data);	
			}
		})	
	});	
	
	var cookies = getPopCookie("auto_id");
	if (cookies != '' ){
		$("#member_id").val(cookies);
		$("#member_check_save_id").prop("checked", true);
	}
	
});

//쿠키 설정
function setPopCookie( name, value, expiredays ) { 
    var todayDate = new Date(); 
    todayDate.setDate( todayDate.getDate() + expiredays ); 
    document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString();
}

function getPopCookie(name){
    var nameOfCookie = name + "=";
    var x = 0;

    while ( x <= document.cookie.length )
    {
        var y = (x+nameOfCookie.length);
        if ( document.cookie.substring( x, y ) == nameOfCookie ) 
        {
            if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
            {
                endOfCookie = document.cookie.length;
            }
            return unescape( document.cookie.substring( y, endOfCookie ) );
        }
        x = document.cookie.indexOf( " ", x ) + 1;
        if ( x == 0 ){break;}
    }
    return "";
}


</script>

</body>
</html>