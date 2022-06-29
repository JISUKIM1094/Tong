<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="main.jsp">관리자 페이지</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <!-- <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
            </div> -->
        </form>
        
        <!-- Navbar-->
        
        
     	<ul class="navbar-nav  ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <!-- 
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                     -->
                    <li><a class="dropdown-item" href="../">Tong</a></li>
                    <li><hr class="dropdown-divider" /></li>
                    <li>
                    	<a class="dropdown-item" href="../logout.do" >Logout</a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Chapter1</div>
                        <a class="nav-link" href="main.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Tong 
                        </a>
                        <div class="sb-sidenav-menu-heading">Chapter2</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div> 
                            게시판
                             <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="./voteList.do">투표 관리</a>
                                <a class="nav-link" href="./noticeList.do">공지사항</a>
                                
                               	<!-- 
                               	<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                   게시물 관리
                                   <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                 <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        
                                        <a class="nav-link" href="ad_lotto.jsp">Lotto</a>
                                        
                                    </nav>
                                </div> 
                                --> 
                            </nav>
                        </div> 
                        
                        <div class="sb-sidenav-menu-heading">Chapter3</div>
                        <a class="nav-link" href="charts.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            방문차트
                        </a>
                        <a class="nav-link" href="./memberList.do">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            회원명단
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as: <%= session.getAttribute("inputId") %>
                    </div>
                </div>
            </nav>
        </div>
         
</body>
</html>