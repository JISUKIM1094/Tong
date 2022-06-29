<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html lang="en">
    <head>
    
    
    
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>개인프로젝트- 웹사이트 제작 김지수</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%@ include file="./common/header.jsp" %>
    	<section class="page-section">
            <div class="container">    
		    <c:forEach items="${boardLists }" var="row" varStatus="loop">
	     		<div class="row product-item">
	            	<h2 class=" row">
		            	<div class=" section-heading d-flex me-auto">
						    <div class="bg-faded p-5 rounded">
					            <span class="section-heading-lower"> ${row.title } </span>
						    </div>
						</div>
						
			            <div>
	                        <button type="button" class="row btn btn-success m-2" 
	                        	onclick="location.href='./vote.do?select=1&num=${row.num }';">${row.content1 }</button>
                        </div>
                        <div>
	                        <button type="button" class="btn btn-success m-2" 
	                        	onclick="location.href='./vote.do?select=2&num=${row.num }';">${row.content2 }</button>
			        	</div>
			        </h2>
		        </div>
		    </c:forEach>    
    
    
    <!-- 
	            <div class="product-item-title d-flex">
	                <div class="bg-faded p-5 d-flex ms-auto rounded">
	                    <h2 class="section-heading mb-0">
 	                       <span class="section-heading-upper">짬짜면</span>
 	                       <span class="section-heading-lower">
				               <input class='btn' type="button" value="짬뽕"
				                onclick="location.href='./vote.do?select=1&num=2';">                    
				               <input class='btn' type="button" value="짜장"
				                onclick="location.href='./vote.do?select=2&num=2';">
				           </span>                    
	                    </h2>
	                </div>
	                
	                -->
           	</div>            
            
        </section>
        
        
<!--        <section class="page-section">
            <div class="container">
                <div class="product-item">
                    <div class="product-item-title d-flex">
                        <div class="bg-faded p-5 d-flex me-auto rounded">
                            <h2 class="section-heading mb-0">
                                
                                <span class="section-heading-upper">Delicious Treats, Good Eats</span>
                                <span class="section-heading-lower"> 
                                <a href="./vote.do?select=1&num=3">빵</a>or
                                <a href="./vote.do?select=2&num=3">떡</a>
                                </span>
                            </h2>
                        </div>
                    </div>

                    <img class="product-item-img mx-auto d-flex rounded img-fluid mb-3 mb-lg-0" src="assets/img/products-02.jpg" alt="..." 
                    width="1000px"/>
                    <img class="product-item-img mx-auto d-flex rounded img-fluid mb-3 mb-lg-0" src="assets/img/products-06.png" alt="..." 
                    width="1000px"/>




<!-- 
                    <div class="product-item-description d-flex ms-auto">
                        <div class="bg-faded p-5 rounded"><p class="mb-0">Our seasonal menu features delicious snacks, baked goods, and even full meals perfect for breakfast or lunchtime. We source our ingredients from local, oragnic farms whenever possible, alongside premium vendors for specialty goods.</p></div>
                    </div> --><!--
                </div>
            </div>
        </section>
        
        
        
        <!-- <section class="page-section">
            <div class="container">
                <div class="product-item">
                    <div class="product-item-title d-flex">
                        <div class="bg-faded p-5 d-flex ms-auto rounded">
                            <h2 class="section-heading mb-0">
                                <span class="section-heading-upper">From Around the World</span>
                                <span class="section-heading-lower">Bulk Speciality Blends</span>
                            </h2>
                        </div>
                    </div>
                    <img class="product-item-img mx-auto d-flex rounded img-fluid mb-3 mb-lg-0" src="assets/img/products-03.jpg" alt="..." />
                    <div class="product-item-description d-flex me-auto">
                        <div class="bg-faded p-5 rounded"><p class="mb-0">Travelling the world for the very best quality coffee is something take pride in. When you visit us, you'll always find new blends from around the world, mainly from regions in Central and South America. We sell our blends in smaller to large bulk quantities. Please visit us in person for more details.</p></div>
                    </div>
                </div>
            </div>
        </section>
         -->
        
       <%@ include file="./common/footer.jsp" %>        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>