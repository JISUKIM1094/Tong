<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- 방문자 카운트. 서버 꺼지면 초기화됨 -->
<% 
 Integer count = (Integer)application.getAttribute("count");
 Integer newCount = null;
 
 if(count == null) {
  application.setAttribute("count", 1);
  
 } else {
  
  if(session.isNew()) {
   newCount = count + 1;
   application.setAttribute("count", newCount);
  } 
 }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Business Casual - Start Bootstrap Theme</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
        <script> 
        
       		function setCookie() {
	        	var todayDate = new Date();
		    	todayDate.setDate (todayDate.getDate() + 1);
		    	document.cookie="pop=off;path=/;1=todayDate.toGMTString();"
	        }
	        
	        function getHide() {
	        	document.getElementById("like_popUp").style.display="none";
	        	
	        	if(document.getElementById("chkbox").checked) {
	        		alert("팝업 하루동안 닫힘");
		    		setCookie();
		    	} 
			}
        </script>
        <%
		String popupMode = "on"; 
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		    for (Cookie c : cookies) {
		        String cookieName = c.getName();
		        String cookieValue = c.getValue();
		        if (cookieName.equals("pop")) {
		            popupMode = cookieValue; 
		        }
		    }
		} 
		%>

    </head>
    <body>
        <%@ include file="./common/header.jsp" %>
        <%= application.getAttribute("count") %>
        <section class="page-section clearfix">
            <div class="container">
                <div class="intro">
                    <img class="intro-img img-fluid mb-3 mb-lg-0 rounded" src="assets/img/intro.jpg" alt="..." />
					<%
                    if (popupMode.equals("on")) {
					%>
                    <div id="like_popUp" class="intro-text left-0 text-center bg-faded p-5 rounded">
                        <h2 class="section-heading mb-4">
                            <span class="section-heading-upper">Fresh Coffee</span>
                            <span class="section-heading-lower">닫을 수 있는 블럭</span>
                  			<label><input type="checkbox" id="chkbox" name="chkbox" value="checkbox">
                         	   &nbsp&nbsp오늘하루 닫기</label>
                        </h2>
                        <p class="mb-3">Every cup of our quality artisan coffee starts with locally sourced, hand picked ingredients. Once you try it, our coffee will be a blissful addition to your everyday morning routine - we guarantee it!</p>
                        <div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="javascript:getHide();">누르면 닫힙니다.</a></div>
                    </div>
					<% } %>
                    
                </div>
            </div>
        </section>
        <section class="page-section cta">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded">
                            <h2 class="section-heading mb-4">
                                <span class="section-heading-upper">Our Promise</span>
                                <span class="section-heading-lower">To You</span>
                            </h2>
                            <p class="mb-0">When you walk into our shop to start your day, we are dedicated to providing you with friendly service, a welcoming atmosphere, and above all else, excellent subscribe made with the highest quality ingredients. If you are not satisfied, please let us know and we will do whatever we can to make things right!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@ include file="./common/footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
