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
        
        <div class="about-heading-content">
            <div class="row">
	            <div class="col-xl-9 col-lg-10 mx-auto">
	                <div class="bg-faded rounded p-5">
	                    <h2 class="section-heading mb-4">
	                        <span class="section-heading-upper">Strong Coffee, Strong Roots</span>
	                        <span class="section-heading-lower">About Our Tong</span>
	                    </h2>
	                     
			            <!-- 검색필드 -->
			            <form action="">
			            <div class="input-group ms-auto" style="width: 400px;">
			                <select name="searchField" class="form-control">
			                    <option value="title">제목</option>
			                    <option value="content">내용</option>
			                    <option value="name">작성자</option>
			                </select>
			                <input type="text" name="searchWord" class="form-control" placeholder="Search" style="width: 200px;">
			                <button class="btn btn-success" type="submit">
			                    <i class="bi-search" style="font-size: 1rem; color: white;"></i>
			                </button>
			            </div>
			        </form>
					<p>Founded in 1987 by the Hernandez brothers, our establishment has been serving up rich coffee sourced from artisan farmers in various regions of South and Central America. We are dedicated to travelling the world, finding the best coffee, and bringing back to you here in our cafe.</p>
                    <p class="mb-0">We guarantee that you will fall in
                    <em>lust</em>
                    with our decadent blends the moment you walk inside until you finish your last sip. Join us for your daily routine, an outing with friends, or simply just to enjoy some alone time.
                    </p>		                
	                            <!-- 게시판 리스트 -->
	                <div class=" row mt-3 mx-1 product-item-description d-flex me-auto">
	                    <div class="p-5 rounded" >
							<div class="row mt-3 mx-1 product-item-img mx-auto d-flex rounded img-fluid mb-3 mb-lg-0">
				                <table class="table table-bordered table-hover table-striped"
				                	style="border-color: green; background-color: white; ">
				                	<colgroup>
					                    <col width="15%"/>
					                    <col width="*"/>
					                    <col width="20%"/>
					                    <col width="20%"/>
					                    <col width="15%"/>
					                </colgroup>
				                
				                
					                <thead>
					                    <tr class="text-center">
					                        <th>번호</th>
					                        <th>제목</th>
					                        <th>작성일</th>
					                        <th>조회수</th>
					                        <th>첨부</th>
					                    </tr>
			               			</thead>
			               			
			                		<tbody>
										<c:choose>
										    <c:when test="${empty boardLists }">
											<tr>
												<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
											</tr>    
											</c:when>
											<c:otherwise>
												<c:forEach items="${boardLists }" var="row" varStatus="loop">
													<tr align="center">
														
														<td>${map.totalCnt - (((map.pageNum-1)*map.pageSize)+loop.index) }</td> 
										    			<td> <a href="./noticeView.do?num=${row.num }"> ${row.title }</a></td>
										    			<td>${row.postdate }</td>
										    			<td>${row.visitcount }</td>
														<td> <!-- row.ofile -->
															<c:if test="${not empty row.ofile }"> O
											    			</c:if>
									    				</td> 
										    		</tr>
										    	</c:forEach>
										    </c:otherwise>    
										</c:choose> 
					                </tbody>
				                </table>
			           		</div>
	                    
		                    <div class="row mt-3" style="color: black;">
				                <div class="col" align="center" >
				                 ${map.pagingImg }  
				                </div>
		                	</div> 
				                	
	                    </div>
	                </div>
                </div>
            </div>
        </div>
    </div>
        <%@ include file="./common/footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
