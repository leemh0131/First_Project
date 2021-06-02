<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    #footer{
    	background-color: #242D23;
    	width: 100%; 
    	height: 250px;	
    }
    
    .Main {
    	font-size: 12px;
    }
    
    .Copyright{
    	font-size: 14px;
    }
    
    .logo {
	    font-size: 45px;
		font-weight: bolder;
		font-family: 'Tangerine', cursive;
    } 
    
</style>


<!-- footer -->
<div id="footer" class="py-3">
    <footer class="container">
        <div class="row">
        
        	<!-- 로고 -->
        	<div class="col-lg-4 col-6 my-0 mt-5">
           		 <h1 class="logo text-info">LogoTest</h1>
        	</div>
        	
        	<!-- 메인메뉴 -->
            <div class="col-lg-4 col-6 p-3">
          		<h3 class="text-info"><b>Main</b></h3>
          		<ul class="list-unstyled">
            		<li class="Main"> <a href="/" class="text-info">Home</a></li>
            		<li class="Main"> <a href="/board/boardList" class="text-info">FAQ</a></li>
		            <li class="Main"> <a href="/products/productListBest" class="text-info">Best</a></li>		            
          		</ul>
        	</div>
        	
        	<!-- 아이콘 -->
        	<div class="col-lg-3 col-md-4 p-3">
            	<h3 class="text-info"> <b>Follow us</b> </h3>
            	<div class="row">
            		<div class="d-flex align-items-center justify-content-between my-2 col-md-12">
	            		<a href="#" class="">
	                		<i class="d-block fa fa-facebook-official mr-2 fa-3x text-info"></i>
	              		</a> 
	             		<a href="#">
	                		<i class="d-block fa fa-instagram mx-2 fa-3x text-info"></i>
	                	</a>
	                	<a href="#">
	                		<i class="d-block fa fa-twitter ml-2 fa-3x text-info"></i>
	              		</a>
              		</div>
            	</div>          
        	</div>
        	
    	</div>
    
    	<!-- Copyright -->
      	<div class="row">
        	<div class="col-md-12 text-center">
          		<p class="Copyright mb-0 mt-2 text-info">© Copyright lee-minho 2021</p>
       		</div>
        </div>
        
    </footer>
</div>
<!-- footer 끝 -->





