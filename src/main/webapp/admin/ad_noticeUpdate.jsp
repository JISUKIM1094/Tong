<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function validateForm(form) {
		if(form.title.value ==""){
			alert("제목을 입력하세요");
			form.title.focus();
			return false;
		}
		if(form.content.value ==""){
			alert("내용을 입력하세요");
			form.content.focus();
			return false;
		}
	}

</script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Notice 작성 Admin</title>
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
                    
                	<form action="./noticeUpdate.do" name="updateFrm" method="post" 
						enctype="multipart/form-data" onsubmit="return validateForm(this);">
                	
                   		<div class="row p-2">
		                	<div class="col d-flex justify-content-end">
			                    <!-- <form action="./noticeWrite.do" method="post" onsubmit="return validateForm(this);"> -->    
				                   	<input type="hidden" name="num" value="${param.num }">
				                   	<input type="hidden" name="inputId" value="${dto.inputId }">
									<input type="hidden" name="prevOfile" value="${dto.ofile }">
									<input type="hidden" name="prevSfile" value="${dto.sfile }">
			                  		<button type="submit" class="btn" >수정하기</button>
			                </div>
		            	</div>
            
		                <div class="card-body">
	                		<table class="table table-bordered ">
				                <colgroup>
				                    <col width="20%"/>
				                    <col width="20%"/>
				                    <col width="20%"/>
				                    <col width="20%"/>
				                    <col width="*"/>
				                </colgroup>
				                <tbody>
				                    <tr>
				                        <th class="text-center" 
				                            style="vertical-align:middle;">작성자</th>
				                        <td>
				                        	<%-- <%=session.getAttribute("inputId") %> 일치하는 지 검증!! --%>
				                        	${dto.inputId}
				                        </td> 
				                        <th class="text-center" 
				                            style="vertical-align:middle;">작성일</th>
				                        <td>${dto.postdate }</td>
				                        <th class="text-center" 
				                            style="vertical-align:middle;">조회수</th>
				                        <td>${dto.visitcount }</td>
				                    </tr>
				                    
				                    <tr>
				                        <th class="text-center" 
				                            style="vertical-align:middle;">제목</th>
				                        <td colspan="5">
					                    	<input type="text" class="form-control" name="title" value="${dto.title }"/>
					                    </td>
				                    </tr>
				                    <tr>
				                        <th class="text-center" style="vertical-align:middle;">내용</th>
				                        <td colspan="5"> <textarea rows="5" class="form-control" name="content" >${dto.content }</textarea>
	
								
										<c:if test="${ext eq 'png' }">
											<img src="../Uploads/${fileName }" alt="안나오냐" style="width: 120px;"/>
										</c:if>
										
										<c:if test="${ext eq 'mp3' }">
											<audio autoplay loop controls>
											  <source src="../Uploads/${fileName }" type="audio/mpeg">
											</audio>
										</c:if>
								 
		
										<c:choose>
											<c:when test="${filetype eq 'img' }">
												<img src="../Uploads/${dto.sfile }" alt="" />
											</c:when>
											<c:when test="${filetype eq 'music' }" >
												<audio src="../Uploads/${dto.sfile }" controls></audio>
											</c:when>
										</c:choose>
											
				                        </td> 
				                        
				                         
				                    </tr>
				                    <tr>
				                    	<td>파일첨부</td>
				                    	<td colspan="5" >
					                    	<c:if test="${not empty dto.ofile }">
					                            등록된 파일:${dto.ofile } <input type="checkbox" name="fileDel" value="delete"/> 삭제하기
					                        </c:if>
				                    		<input type="file" class="form-control" name="ofile"/>
										</td>
				                    
				                    </tr>
				                    
				                    <%-- 
				                    <tr>
				                        <th class="text-center" 
				                            style="vertical-align:middle;">첨부파일</th>
				                        <td>
				                        	<c:if test="${not empty dto.ofile }">${dto.ofile } <a href="../mvcboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile}&idx=${dto.idx}">[다운로드]</a></c:if>
				                        	<c:if test="${ empty dto.ofile }"> 없음 </c:if>
				                        </td> 
				                        <th class="text-center" 
				                            style="vertical-align:middle;"> 다운로드 수</th>
				                        <td>${dto.downcount }</td>
				                    </tr> 
				                    --%>
		                    
		              			</tbody>
							</table>
						</div>
					</form>
	                
	                
	                
	                <div class="row mb-3">
	                    <div class="col d-flex justify-content-end">
		                	<button type="button" class="btn btn-info" onclick="history.back(-1); " >돌아가기</button>
		                    <button type="button" class="btn btn-warning" onclick="location.href='./noticeList.do';">목록보기</button>
		                </div>
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
