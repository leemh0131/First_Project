<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../resources/css/bootstrap.jsp" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 변경</title>


</head>
<body>
<div id="wrap">
	<div id="container" align="center">
		<div class="titleArea" align="center">
			<h2>비밀번호 변경</h2>
		</div>
		<form class="form-horizontal" id="pwChangeForm" name="pwChangeForm" action="" method="post" onsubmit="return false;">
			<table class="table">
				<tbody>
					<tr hidden="hidden">
						<td>
							<input type="hidden" id="member_id" name="member_id" value="${member.member_id}">						
						</td>					
					</tr>
					<tr>
						<th scope="row">기존 비밀번호</th>
						<td>
							<input type="password" id="member_pw" name="member_pw" maxlength="16">															
						</td>
					</tr>
					<tr>
						<th scope="row">새 비밀번호</th>
						<td>
							<input type="password" id="new_member_pw" name="new_member_pw" maxlength="16"><br>
							<label class="pw_rule" style="font : 0.75em 'Apple SD Gothic Neo', '돋움', Dotum, AppleGothic, sans-serif;">
								(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)-비밀번호 설정시 특수문자 *은 제외하세요.&nbsp;&nbsp;
							</label>									
						</td>
					</tr>
					<tr>
						<th scope="row">새 비밀번호 확인</th>
						<td>
							<input type="password" id="new_member_pw_confirm" name="new_member_pw_confirm" autocomplete="off" maxlength="16">														
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btnArea center">					
				<button class="btn btn-primary" type="button" id="pwChange_btn">비밀번호 변경</button>
				<button class="cancle btn btn-danger" type="button">취소</button>				
			</div>		
		</form>
	</div>
</div>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	
	// 취소
	$(".cancle").on("click", function(){
		self.close();
	})
	
	$("#pwChange_btn").on("click", function(){
		
		if( $("#new_member_pw").val() == $("#member_pw").val()){
			alert("기존 비밀번호와 동일한 비밀번호는 사용하실 수 없습니다.");
			return false;
		}
		
		//패스워드 암호 생성식
		var reg = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&-]).{8,16}$/;		
		var password = $("#new_member_pw").val();
		if(!reg.test(password)){
			alert("(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)-비밀번호 설정시 특수문자 *은 제외하세요");
			$("#new_member_pw").focus();
			return false;
		}		
		
		if($("#new_member_pw").val()==""){
			alert("바꾸실 비밀번호를 입력해주세요.");
			$("#new_member_pw").focus();
			return false;
		}
		
		if($("#new_member_pw_confirm").val()!=$("#new_member_pw").val()){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			$("#new_member_pw_confirm").focus();
			return false;
		}
		if($("#new_member_pw_confirm").val()==""){
			alert("비밀번호 확인란을 입력해주세요.");
			$("#new_member_pw_confirm").focus();
			return false;
		}
		
		//필수값 들어간 상태에서 ...컨트롤러에서 로그인하고 비슷하게 해서 셀프 클로즈
		
		
		$.ajax({
			url : "/member/pwChangeForm",
			type : "post",
			datatype : "json",
			data : {"member_id" : $("#member_id").val(), "member_pw" : $("#member_pw").val(), "new_member_pw" : $("#new_member_pw").val()},
			success : function(data){
				if(data == "N"){
					alert("기존 비밀번호가 일치하지 않습니다.");
					$("#member_pw").focus();
					return false;
				}
				else if(data == "Y"){
					alert("비밀번호가 변경되었습니다.");
					self.close();
				}
			},
			error : function(){
				alert("비밀번호 변경 오류");
			}			
		}) 
	});
})


</script>

</body>
</html>