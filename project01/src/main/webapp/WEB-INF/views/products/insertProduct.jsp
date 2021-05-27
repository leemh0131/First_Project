<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 상품등록 페이지</title>
	<style type="text/css">
	
	td{
	font-size: 16px;
	font-family: sans-serif;
	}	
	
	#img_v{
	object-fit: cover;
	/* background-color:red !important; */
	width: 150px;
	height: 190px;
	}
	
	.card{
	background-color:#F7F7F7 !important;
	}

	
	</style>
		
<script>


</script>
	
	
	
</head>
<!-- 헤더 -->
<header>
<%@ include file="../include/header.jsp" %>
</header>

<!-- body -->
<body>
<br><br><br><br><br><br><br><br>
<div class="container">
<form onsubmit="return check()" name="f" method="post">
 
        <div class="col-sm-12 pt-3">
            <div class="card">
                <div class="card-header card-header-primary">
                    <h1 class="card-title" style="font-weight: bold;" ><i class="fas fa-square"></i> 관리자 상품등록</h1>
                    <p class="card-catagory"></p>
                </div>
                
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>                          
	                            <tr style="line-height:32px;">                            
	                                <td>상품이름</td>
	                                <td>
	                                    <input type="text" name="product_name" style="font-size: 14px;" class="form-control" value="">
	                                </td>
	                                <td>카테고리</td>	                                                                                           
	                                <td>	                                    
										<select name="productType" id="productType" onchange="clicking()">
											<option value="">선택하세요</option>
											<option value="1">Outer</option>
											<option value="2">Top</option>
											<option value="3">Pants</option>
											<option value="4">Accessory</option>
											<option value="5">Shoes</option>
										</select>
										<input type="hidden" name="product_type" class="form-control" id="product_type" onchange="valFx()" value="">									                        
	                                    <input style="text-transform: capitalize;" type="hidden" name="product_type_name" class="form-control" id="product_type_name" onchange="textFx()" value="">	                                
	                            </tr>
	                            
	                            <tr>
	                                <td>상품가격</td>
	                                <td>
	                                    <input type="text" name="product_price" style="font-size: 14px;" class="form-control" value="">                                    
	                                </td>
	                                <td>상품수량</td>
	                                <td>
	                                    <input type="text" name="product_count" style="font-size: 14px;" class="form-control" value="">                                    
	                                </td>
	                            </tr>  
	                            
	                            <tr>
	                                <td>상품이미지주소</td>
	                                <td>
	                                    <input type="text" id="img_view" name="img_view" style="font-size: 14px;" class="form-control" value="">
	                                </td>
	                                <td><button class="btn btn-success" onclick="img()" type="button">이미지미리보기</button></td>
	                                <td>
	                                    <div id="img_v">
	                                    	<img id="imgView" alt="링크입력 후 클릭" src="">
	                                    </div>
	                                </td>
	                            </tr>     
	                                                   
	                            <tr>
	                                <td>상품내용</td>
	                                <td colspan="3">
	                                    <input type="text" style="height:500px; font-size: 14px;" name="product_content" class="form-control mb-3" value="">                                 
	                                </td>
                            	</tr>                            
                            </tbody>                            
                        </table>
                    </div>
                </div>
            </div> 
        </div> 
    <div class="text-center mt-3">
        <button type="submit" class="btn btn-default btn-lg">등록하기</button>
        <button type="reset"  class="btn btn-default btn-lg">다시쓰기</button>
    </div>
    
</form>


</div>
</body>
<!-- footer -->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>

<script type="text/javascript">

//공백체크
function check() {	
	
	if(f.product_name.value == "" || f.product_name.value == null) {
	   alert("상품이름을 입력해 주세요.");
	   f.product_name.focus();
	   return false;
	}
	
	else if(f.productType.value == "" || f.product_name.value == null) {
	   alert("카테고리를 선택해주세요.");
	   f.productType.focus();
	   return false;
	}
	 
	 else if(f.product_price.value == "" || f.product_price.value == null) {
	    alert("상품가격을 입력해 주세요.");
	    f.product_price.focus();
	    return false;
	}
	 
	 else if(f.product_count.value == "" || f.product_count.value == null) {
	    alert("상품수량을 입력해 주세요.");
	    f.productType.focus();
	    return false;
	}
	
	 else if(f.img_view.value == "" || f.img_view.value == null) {
		    alert("상품이미지를 입력해 주세요.");
		    f.img_view.focus();
		    return false;
	}
	
	else if(f.product_content.value == "" || f.product_content.value == null) {
		    alert("상품내용을 입력해 주세요.");
		    f.product_content.focus();
		    return false;
	}

  else return true;

}




//이미지 미리보기 버튼
function img() {
	var img = document.getElementById("img_view").value;
	var imgVal = document.getElementById("imgView").src = img;
}

//product_type, product_type_name 저장
function clicking() {
	var opt = document.getElementById("productType");
	var optVal = opt.options[opt.selectedIndex].value;
	var optText = opt.options[opt.selectedIndex].text;

	var valt = document.getElementById("product_type");
	var texx = document.getElementById("product_type_name");

	valt.value = optVal;
	texx.value = optText.toLowerCase();

	checkFx();
}
function textFx() {
	var texx = document.getElementById("product_type_name");
	texx.value = texx.value.toLowerCase();

	var opt = document.getElementById("productType");
	opt.selectedIndex = texx.value.substring(4, 5) - 1;

	var valt = document.getElementById("product_type");
	valt.value = opt.value;			

	checkFx();
}


</script>


</html>