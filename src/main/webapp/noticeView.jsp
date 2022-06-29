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
			            
		                <div class=" row mt-3 mx-1 product-item-description d-flex me-auto">
		                    <div class="bg-info p-5 rounded" style="--bs-bg-opacity: .0;">
								<div class="row mt-3 mx-1" class="product-item-img mx-auto d-flex rounded img-fluid mb-3 mb-lg-0">
		                            <!-- 내용 -->
					                
					                
					                
					                
						            <form>    
						                <table class="table table-bordered" style="border-color: green; background-color: white;">
						                <colgroup>
						                    <col width="20%"/>
						                    <col width="30%"/>
						                    <col width="20%"/>
						                    <col width="*"/>
						                </colgroup>
						                <tbody>
						                    <tr>
						                        <th class="text-center" 
						                            style="vertical-align:middle;">작성자</th>
						                        <td>${dto.inputId }</td> 
						                        <th class="text-center" 
						                            style="vertical-align:middle;">작성일</th>
						                        <td>${dto.postdate }</td>
						                    </tr>
						                    <tr>
						                        <th class="text-center" 
						                            style="vertical-align:middle;">조회수</th>
						                        <td>${dto.visitcount }</td>
						                    </tr>
						                    <tr>
						                        <th class="text-center" 
						                            style="vertical-align:middle;">제목</th>
						                        <td colspan="3">${dto.title }</td>
						                    </tr>
						                    <tr>
						                        <th class="text-center" 
						                            style="vertical-align:middle;">내용</th>
						                        <td colspan="3" height="100">${dto.content }

													<c:if test="${ext eq 'png' }">
														<img src="./Uploads/${fileName }" alt="안나오냐" style="width: 120px;"/>
													</c:if>
													
													<c:if test="${ext eq 'mp3' }">
														<audio autoplay loop controls>
														  <source src="./Uploads/${fileName }" type="audio/mpeg">
														</audio>
													</c:if>
													 
													<c:choose>
														<c:when test="${filetype eq 'img' }">
															<img src="./Uploads/${dto.sfile }" alt="" />
														</c:when>
														<c:when test="${filetype eq 'music' }" >
															<audio src="./Uploads/${dto.sfile }" controls></audio>
														</c:when>
													</c:choose>
													
						                        </td> 
						                    </tr>
						                    
						                </tbody>
						                </table>
						                
						                
						                
						                
						                
						                
						                <!-- 각종버튼 -->
						                <div class="row mb-3">
						                    <div class="col d-flex justify-content-end">
						                    	<button type="button" class="btn btn-info" onclick="history.back(-1); " >돌아가기</button>
						                    
						<!--                    <button type="button" class="btn btn-primary" onclick="location.href='../mvcboard/write.do';">글쓰기</button>
						                  		<button type="button" class="btn btn-secondary" onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${param.idx}';">수정하기</button>
						                        <button type="button" class="btn btn-success" onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${param.idx}';">삭제하기</button>
						                        <button type="button" class="btn btn-warning" onclick="location.href='../mvcboard/list.do';">목록보기</button>
						 -->                </div>
						                </div>
						            </form>
					                
				           		</div>
		                    </div>
		                    <div class="row mt-3">
				                <div class="col" align="center">
				                 ${map.pagingImg }  
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
