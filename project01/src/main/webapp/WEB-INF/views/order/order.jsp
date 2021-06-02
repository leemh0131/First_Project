<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 페이지</title>
<style type="text/css">
h3{
	text-align: center;
	font-family: sans-serif !important ; 
	font-weight: bold !important ;
}

h6{
	font-family: sans-serif;
	font-weight: bold !important ;
}

#P_img{
	height: 100px;
	width: 100px;
}

input{	
	border-right: none;
	border-left: none;
	border-top: none;
	border-bottom: #888888 1px solid;

}

input:focus {outline:none;}


</style>

</head>
<!-- 헤더 -->
<header>
<%@ include file="../include/header.jsp" %>
</header>
<body>
<br><br><br><br><br><br><br><br><br>
<div class="container">
<div class="container-fluid">

	<h3 style="margin-bottom: 30px;">결제하기</h3>

<form action="/order/orderComplete" onsubmit="return check()" name="form" id="form" method="post">
<input type="hidden" id="product_code" name="product_code" value=""/>

<div class="row">
	<!-- 상품정보 -->
	<div style="background-color: white;"  class="col-sm-7 p-3 m-1">			
		<h6>주문 상품 정보</h6>
		<div class="row">
			<div class="col-sm-3">
				<img id="P_img" alt="img" src="${productView.img_view}"/>
			</div>
			<div class="col-sm-9">
				<p style="font-weight: bolder;">${productView.product_name}</p>
				<span id="Pproduct_cnt" ></span>
				<p style="font-weight: bolder;">${productView.product_price} KRW</p>
			</div>
		</div>			
	</div>	
	<!-- 결제금액 -->	
	<div style="background-color: white;" class="col-sm-4 p-3 m-1">	
		<h6>최종 결제금액</h6>	
		<span>${productView.product_name} X </span>
		<input style="border: none; width: 20px;" type="text" id="order_count" name="order_count" readonly="readonly" value="1"/>
		<hr>
		<span>총 결제금액</span>
		<input style="border: none; width: 60px;" name="total_price" id="total_price" value=""/><label> KRW</label>
	</div>
	
	<!-- 주문자정보 -->
	<div style="background-color: white;"  class="col-sm-7 p-3 m-1">			
			<h6>주문자 정보</h6>
			<!-- 회원 -->
			<c:if test="${!empty member.member_code}">
			<input type="hidden" name="member_code" value="${member.member_code}"/>
			</c:if>
			<!-- 비회원 -->
			<c:if test="${empty member.member_code}">
			<input type="hidden" name="member_code" value="0"/>
			</c:if>
			<div class="row">
				<div class="col-sm-6">
					<input type="text" id="member_name" style="width: 100%; margin-bottom: 30px;" placeholder="이름" value="${member.member_name}"/>
				</div>
				<div class="col-sm-6">
					<input type="text" id="member_tel" style="width: 100%; margin-bottom: 30px;" placeholder="연락처" value="${member.member_tel}"/>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<input type="text" id="member_email" style="width: 100%; margin-bottom: 30px;" placeholder="이메일" value="${member.member_email}"/>
				</div>				
			</div>			
	</div>	
	<!-- 무통장입금 -->	
	<div style="background-color: white;" class="col-sm-4 p-3 m-1">		
		<h6>계좌번호</h6>
		<p>국민은행 1111-1111-111111</p>
		<p>예금주 logotest</p>		
	</div>	
	
	<!-- 배송정보 -->
	<div style="background-color: white;"  class="col-sm-7 p-3 m-1">			
		<h6>배송 정보</h6>
		<div class="row">
			<div class="col-sm-6">
				<input type="text" id="delivery_name" name="delivery_name" style="width: 100%; margin-bottom: 30px;" placeholder="수령인" value="${member.member_name}"/>
			</div>
			<div class="col-sm-6">
				<input type="text" id="delivery_tel" name="delivery_tel" style="width: 100%; margin-bottom: 30px;" placeholder="연락처" value="${member.member_tel}"/>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12">										
				<div id="callBackDiv">							
					<input type="text" readonly="readonly" placeholder="주소검색을 눌러주세요." style="width:80%; margin-bottom: 30px;" id="roadFullAddr"  name="roadFullAddr" />	
					<input type="button" style="border: #888888 1px solid;" onClick="goPopup();" value="주소검색"/>					
				</div>						
			</div>
		</div>
			
				
	</div>	
	<!-- 결제 -->	
	<div style="background-color: white;" class="col-sm-4 p-3 m-1">		
		<h6>약관동의</h6>
		<label>							
			<input type="checkbox" class="_agree" checked>
			<span>개인정보 수집 및 이용 동의 <a onclick="fnModuleInfo()"><ins>약관보기</ins></a></span>						
		</label>
		<label>
			<input type="checkbox" class="_agree" checked>
			<span>구매조건 확인 및 결제진행에 동의</span>
		</label>		
	</div>
	
	<div class="col-sm-11 p-3 m-1">
		<button style="float: right;" class="btn-outline-dark m-1" type="submit">결제하기</button>
		<button style="float: right;" onclick="c()" class="btn-outline-dark m-1" type="button">구매취소</button>
	</div>
	
	
	<!-- Moa Modal-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">		    
	    	</div>
	  	</div>
	</div>
	
	
		
</div>				

</form>

</div>
</div>


<script type="text/javascript">
//모달사용
function fnModuleInfo(){
   $('#myModal .modal-content').load("../order/buyCheck");
   $('#myModal').modal();
}

//쿠키가져오기
var getCookie = function(name) {
	var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	return value? value[2] : null;
	}
	
// getCookie
var product_code = getCookie('product_code');
var order_count = getCookie('order_count');

document.getElementById('product_code').value = product_code;
document.getElementById('order_count').value = order_count;
document.getElementById('Pproduct_cnt').innerHTML = order_count + " 개";
document.getElementById('total_price').value = order_count * ${productView.product_price};

console.log("쿠키저장값ㅁㅁㅁㅁㅁㅁㅁㅁㅁ코드" + product_code);
console.log("쿠키저장값ㅁㅁㅁㅁㅁㅁㅁㅁㅁ갯수" + order_count);

//삭제
var deleteCookie = function(name) {
	document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
	}
//쿠키삭제
function c() {			
	
	product_code = deleteCookie('product_code');
	order_count = deleteCookie('order_count');
	
	location.href = document.referrer;
	console.log("쿠키저장값ㅁㅁㅁㅁㅁㅁㅁㅁㅁ코드" + product_code);
	console.log("쿠키저장값ㅁㅁㅁㅁㅁㅁㅁㅁㅁ갯수" + order_count);	

}

//체크
function check() {

	if(form.roadFullAddr.value == "" || form.roadFullAddr.value == null) {
	   alert("배송주소을 입력해주세요.");
	   form.roadFullAddr.focus();
	   return false;
	}
	
	else if(form.member_name.value == "" || form.member_name.value == null) {
	   alert("주문자이름을 입력해주세요.");
	   form.member_name.focus();
	   return false;
	}
	 
	else if(form.member_tel.value == "" || form.member_tel.value == null) {
		   alert("주문자전화번호을 입력해주세요.");
		   form.member_tel.focus();
		   return false;
	}
	
	else if(form.member_email.value == "" || form.member_email.value == null) {
		   alert("주문자이메일을 입력해주세요.");
		   form.member_email.focus();
		   return false;
	}
	
	else if(form.delivery_name.value == "" || form.delivery_name.value == null) {
		   alert("배송받는 사람의 이름을 입력해주세요.");
		   form.delivery_name.focus();
		   return false;
	}
	
	else if(form.delivery_tel.value == "" || form.delivery_tel.value == null) {
		   alert("배송지 전화번호을 입력해주세요.");
		   form.delivery_tel.focus();
		   return false;
	}	

  else return true;

}




function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/order/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.engAddr.value = engAddr;
		document.form.jibunAddr.value = jibunAddr;
		document.form.zipNo.value = zipNo;
		document.form.admCd.value = admCd;
		document.form.rnMgtSn.value = rnMgtSn;
		document.form.bdMgtSn.value = bdMgtSn;
		document.form.detBdNmList.value = detBdNmList;
		/** 2017년 2월 추가제공 **/
		document.form.bdNm.value = bdNm;
		document.form.bdKdcd.value = bdKdcd;
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		document.form.emdNm.value = emdNm;
		document.form.liNm.value = liNm;
		document.form.rn.value = rn;
		document.form.udrtYn.value = udrtYn;
		document.form.buldMnnm.value = buldMnnm;
		document.form.buldSlno.value = buldSlno;
		document.form.mtYn.value = mtYn;
		document.form.lnbrMnnm.value = lnbrMnnm;
		document.form.lnbrSlno.value = lnbrSlno;
		/** 2017년 3월 추가제공 **/
		document.form.emdNo.value = emdNo;
		
}	

</script>
</body>



<!-- footer -->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
</html>