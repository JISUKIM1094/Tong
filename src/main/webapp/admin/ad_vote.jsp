<%@page import="utils.JSFunction"%>
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
        <title>투표 테이블 Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    
<script type="text/javascript">
	function validateForm(form) {
		if(form.name.value ==""){
			alert("작성자를 입력하세요");
			form.name.focus();
			return false;
		}
		if(form.title.value ==""){
			alert("투표명을 입력하세요");
			form.title.focus();
			return false;
		}
		if(form.content1.value ==""){
			alert("항목1 입력하세요");
			form.content1.focus();
			return false;
		}
		if(form.content2.value ==""){
			alert("항목2 입력하세요");
			form.content2.focus();
			return false;
		}
	}
	
	function del() {
    	var t = confirm("삭제하시겠습니까?");
    	if(!t) return false; 
    	
	}

</script>
    
    
    </head>
    <body class="sb-nav-fixed">
    <%@ include file="./common/ad_nav.jsp" %>
     
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">VOTE </h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item active">Board</li>
                    </ol>

                    <div class="card mb-4">
                        <div class="card-header">
                        	<div class="col-md-2">
              		           	<i class="fas fa-table me-1"></i> tong vote
                            </div>
							
							
                    	</div>
                        
                        <div class="card-body">
                       		<form action="./voteList.do" method="post" onsubmit="return validateForm(this);"> 
	            				<input type="hidden" name="inputId" value="<%= session.getAttribute("inputId") %>"/>
	                            <input type="hidden" name="mode" value="add">

	                            
	                            <div class="row mb-3 col d-flex justify-content-end ">
                                    <div class="col-md-3 row form-floating mb-3 mb-md-0">
                                        <input class=" col-md-4 form-control" name="title" type="text" placeholder="투표명" />
                                  		<label for="title">투표명</label>
                                  	</div>
                                  	<div class="col-md-3 row form-floating mb-3 mb-md-0">	
                                  		<input class="col-md-4 form-control" name="content1" type="text" placeholder="투표항목2" />
                                  		<label for="content1">투표항목1</label>
	                            	</div>
                                  	<div class="col-md-3 row form-floating ">	
                                  		<input class="col-md-4 form-control" name="content2" type="text" placeholder="투표항목2" />
                                  		<label for="content2">투표항목2</label>
	                            	</div>
		                            <div class="col-md-3 form-floating mb-3 mb-md-0">
		                             	<button type="submit" class="btn btn-primary btn-block" >투표추가</button>
		                            </div>
	                            </div>
	                       	</form>
                            <span style="color: yellow; background-color: red ">투표조작 방지를 위해 수정은 불가능합니다.</span>
                    	
                    	
                        
                        
                        
	                        <form action="./voteList.do" method="post" onsubmit="return del();">
					            <div class="row">
					                <div class="col d-flex justify-content-end">
					                    <button type="submit" class="btn " >삭제하기</button>
					                	<input type="hidden" name="mode" value="del">
					                </div>
					            </div>
					            
		                        <table id="datatablesSimple">
		                            <thead>
		                                <tr>
		                                    <th>선택</th>
					                        <th>투표제목</th>
					                        <th>투표내용1</th>
					                        <th>투표1결과 </th>
					                        <th>투표내용2</th>
					                        <th>투표2결과 </th>
					                        <th>시작일</th>
					                        <th>조회수</th>
		                                </tr>
		                            </thead> <!-- 
		                            <tfoot>
		                                <tr>
		                                    <th>Name</th>
		                                    <th>Position</th>
		                                    <th>Office</th>
		                                    <th>Age</th>
		                                    <th>Start date</th>
		                                    <th>Salary</th>
		                                </tr>
		                            </tfoot> --> 
		                             <!-- 회원명단, DB연결 -->
		                            <tbody> 
		                             <c:forEach items="${boardLists }" var="row" varStatus="loop">
							    		<tr>
							    			<td> 
							    				<input type="radio" name="num" value="${row.num }" >
							    			</td> 
							    			<td>${row.title }</td>
							    			<td>${row.content1 }</td>
							    			<td>${row.content1_cnt }</td>
							    			<td>${row.content2 }</td>
							    			<td>${row.content2_cnt }</td>
							    			<td>${row.postdate }</td>
							    			<td>조회수</td>
							    		</tr>
							    	</c:forEach> 
		                            </tbody>
		                        </table>
		                    </form>
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
