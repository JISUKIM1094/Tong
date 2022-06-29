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
        <title>Notice 테이블 Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
    	<%@ include file="./common/ad_nav.jsp" %>
     
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Notice </h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="./">Dashboard</a></li>
                        <li class="breadcrumb-item active">Board</li>
                    </ol>
                	<div class="card mb-4">
                        <div class="card-body">
                            DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                            <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                            .
                        </div>
                    </div>    
                                        
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>tong Notice
                        </div>
                       	<div class="row p-2">
			                <div class="col d-flex justify-content-end">
			                    <button type="button" class="btn" onclick="location.href='./noticeWrite.do';">글쓰기</button>
			                </div>
			            </div>
				            
                        <div class="card-body">
                            <table id="datatablesSimple">
                            <colgroup>
			                    <col width="15%"/>
			                    <col width="*%"/>
			                    <col width="15%"/>
			                    <col width="20%"/>
			                    <col width="15%"/>
			                </colgroup>
                            
                                <thead>
                                    <tr>
                                        <th>번호</th>
				                        <th>제목</th>
				                        <th>작성자</th>
				                        <th>작성일</th>
				                        <th>첨부</th>
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
                                
                                <tbody>
										<c:choose>
										    <c:when test="${empty boardLists }">
											<tr>
												<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
											</tr>    
											</c:when>
											<c:otherwise>
												<c:forEach items="${boardLists }" var="row" varStatus="loop">
													<tr >
														<td>${row.num }</td>
														<%-- <td>${map.totalCnt - (((map.pageNum-1)*map.pageSize)+loop.index) }</td> --%> 
														
										    			<td> <a href="./notice.do?num=${row.num }"> ${row.title }</a></td>
										    			<td>${row.inputId }</td>
										    			<td>${row.postdate }</td>
														<td>
															<c:if test="${not empty row.ofile}"> O
											    			</c:if>
									    				</td> 
										    			
										    		</tr>
										    	</c:forEach>
										    </c:otherwise>    
										</c:choose> 
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
