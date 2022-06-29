<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<header>
            <h1 class="site-heading text-center text-faded d-none d-lg-block">
                
            <%
            
            if(session.getAttribute("inputId")!=null){%> 
                <a href="memberUpdate.do?inputId=<%= session.getAttribute("inputId") %>">
                
                <span class="site-heading-upper text-primary mb-3">
                <%= session.getAttribute("inputId") %>'s</span>
				</a>
			<%
			} %>
                
                <span class="site-heading-lower">BRAIN IN TONG</span>
            </h1>
        </header>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
            <div class="container">
                <a class="navbar-brand text-uppercase fw-bold d-lg-none" href="main.jsp">BRAIN IN TONG</a>
                <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
		            <li class="nav-item dropdown"> 
		                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
		                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
		                    <li><a class="dropdown-item" href="memberLogin.jsp">Login</a></li>
		                    <li><hr class="dropdown-divider" /></li>
		                    <li><a class="dropdown-item" href="./logout.do" >Logout</a></li>
		                </ul>
		            </li>
		        </ul>
		        
		        
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="main.jsp">HOME</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="./voteBoard.do">VOTE</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="./noticeBoard.do" >NOTICE</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="subscribe.jsp" >SUBSCRIBE</a></li>
                        <li class="nav-item px-lg-4"><a class="nav-link text-uppercase" href="location.jsp">LOCATE</a></li>
                    </ul>
                </div>
            </div>
        </nav>
</body>
</html>