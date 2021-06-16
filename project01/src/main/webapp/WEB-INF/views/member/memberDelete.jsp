<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../resources/css/bootstrap.jsp" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<div id="wrap">
	<div id="container" align="center">
		<div class="titleArea" align="center">
			<h2>회원 탈퇴</h2>		
		</div>
		<form class="form-horizontal" id="memberDeleteForm" name="memberDeleteForm" action="" method="post" onsubmit="return false;">
			<table class="table" >
				<tbody>
					<tr hidden="hidden">
						<td>
							<input type="hidden" id="member_id" name="member_id" value="${member.member_id}">
						</td>
					</tr>
					<tr>
						<td align="center">
							<label class="del_rule" style="font : 0.75em 'Apple SD Gothic Neo', '돋움', Dotum, AppleGothic, sans-serif;">
								한글로 <b>"회원탈퇴"</b>를 입력해 주시고 비밀번호를 다시한번 입력해주세요.
							</label>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="text" id="del_Check_word" name="del_Check_word" placeholder="Enter 회원탈퇴">
						</td>
					</tr>
					<tr>						
						<td align="center">
							<input type="password" id="member_pw" name="member_pw" maxlength="16" placeholder="Enter Password">															
						</td>
					</tr>					
				</tbody>
			</table>			
			<div class="btnArea center">					
				<button class="btn btn-primary" type="button" id="memberDel_btn">회원 탈퇴</button>
				<button class="cancle btn btn-danger" type="button">취소</button>				
			</div>				
		</form>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function(){
	
	
	// 취소
	$(".cancle").on("click", function(){		
		self.close();
	})	
	
	$("#memberDel_btn").on("click", function(){		
		
		if($("#del_Check_word").val() == ""){
			alert("회원탈퇴란을 입력해주세요");
			$("#del_Check_word").focus();
			return false;
		}		
		
		var del_word = "회원탈퇴";		
		
		if( $("#del_Check_word").val() != del_word){
			alert("회원탈퇴 를 정확히 입력해주세요");
			$("#del_Check_word").focus();
			return false;
		}	
		
		if($("#member_pw").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("#member_pw").focus();
			return false;
		}		
		var pw = "${member.member_pw}";
				
		if($("#member_pw").val() != pw){
			alert("비밀번호가 틀렸습니다.");
			$("#member_pw").focus();
			return false;
		}
		/* 
		opener.document.location.href="/";
		
		self.close();
		 */
		
		
		$.ajax({
			url : "/member/memberDelForm",
			type : "post",
			datatype : "json",
			data : {"member_id" : $("#member_id").val(), "member_pw" : $("#member_pw").val()},
			success : function(data){
				if(data == "Y"){
					alert("회원 탈퇴가 완료되었습니다..");
					location.href = "/member/logout";
					opener.document.location.href="/";
					self.close();
				}
				else if(data == "N"){
					alert("회원 탈퇴처리가 되지 않았습니다.");
					$("#member_pw").focus();
					return false;
				}
			},
			error : function(){
				alert("회원 탈퇴 오류");
			}			
		}) 
		
	});	
})


</script>

</body>
</html>