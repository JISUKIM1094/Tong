<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원테이블 Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
   		<%@ include file="./common/ad_nav.jsp" %>
     
	    <div id="layoutSidenav_content">
	        <main>
	            <div class="container-fluid px-4">
	                <h1 class="mt-4">회원명단</h1>
	                <ol class="breadcrumb mb-4">
	                    <li class="breadcrumb-item"><a href="./">Dashboard</a></li>
	                    <li class="breadcrumb-item active">Tables</li>
	                </ol>
	                
	            <!--<div class="card mb-4">
	                    <div class="card-body">
	                        DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
	                        <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
	                        .
	                    </div>
	                </div>-->
	                
	                <div class="card mb-4">
	                    <div class="card-header">
	                        <i class="fas fa-table me-1"></i> tong 회원
	                    </div>
	                    <div class="card-body">
	                        <table id="datatablesSimple">
	                            <thead>
	                                <tr>
	                                    <th>회원 ID</th>
	                                    <th>Email</th>
	                                    <th>가입일</th>
	                                    <th>FirstName</th>
	                                    <th>LastName</th>
	                                    <th>Gender</th>
	                                    <th>Age</th>
	                                    <th>관리자</th>
	                                    
	                                </tr>
	                            </thead>
	                            <!-- 
	                            <tfoot>
	                                <tr>
	                                    <th>Name</th>
	                                    <th>Position</th>
	                                    <th>Office</th>
	                                    <th>Age</th>
	                                    <th>Start date</th>
	                                    <th>Salary</th>
	                                </tr>
	                            </tfoot>  -->
	                            
	                            
	                             <!-- 회원명단, DB연결 -->
	                            <tbody> 
	                           			
	                             <c:forEach items="${boardLists }" var="row" varStatus="loop">
						    		<tr>
						    			<td>${row.inputId }</td>
						    			<td>${row.email }</td>
						    			<td>${row.postdate }</td>
						    			<td>${row.firstName }</td>
						    			<td>${row.lastName }</td>
						    			<td>${row.gender }</td>
						    			<td>${row.age }</td>
						    			<td>${row.adminId }</td>
						    		</tr>
						    	</c:forEach> 
	                                
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	            </div>
	        </main>
	        
	       <%@ include file="./common/footer.jsp" %>        
	        
	    </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
