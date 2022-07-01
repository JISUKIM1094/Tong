<%@page import="utils.JSFunction"%>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
		
		
		<script language='javascript'>

		function noEvent() {    
			if (event.keyCode == 116) {        
				event.keyCode= 2;        
				return false;    
			}else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))    
				return false;    
		}
		document.onkeydown = noEvent;
		
		</script>
		
		
<script type="text/javascript">
	function validateForm(form) {
		if(form.name.value ==""){
			alert("작성자를 입력하세요");
			form.name.focus();
			return false;
		}
		if(form.comment.value ==""){
			alert("내용을 입력하세요");
			form.comment.focus();
			return false;
		}
	}
	
	function del() {
    	var t = confirm("삭제하시겠습니까?");
    	if(!t) return false; 
    	
	}

</script>		
		
		
   </head>
    <body>
        <%@ include file="./common/header.jsp" %>
        
        <section class="page-section">
            <div class="container">
	     		<div class="product-item">
					<!-- <div class="product-item-description d-flex me-auto"> -->
					    <div class="bg-faded p-5 rounded">
						<span style="color: red ">*  [새로고침 불가] 새로고침 시 투표수에 반영되므로 막습니다.</span>
					    
				         	<h2 class="row section-heading mb-0">
				            	<span class="section-heading-lower"> ${dto.title} </span> <!-- &num=${param.num} -->
 		                    </h2> 
	                           
	                           
  		                    <div class="col-lg-6">
                            	<div class="card mb-4">
                                	<div class="card-header">
                                	
                                    	<i class="fas fa-chart-pie me-1"></i>
                                    
                                    	<!-- 차트사용 부트스트랩-->
										<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
										                                    
										<canvas id="myChart" width="400" height="400"></canvas>
										<script>
											var ctx = document.getElementById('myChart').getContext('2d');
											var myChart = new Chart(ctx, {
											    type: 'pie',
											    data: {
											        labels: [ "${dto.content1}", "${dto.content2}" ],
											        datasets: [{
											            label: '# of Votes',
											            data: [${dto.content1_cnt},${dto.content2_cnt}],
											            backgroundColor: [
											                'rgba(255, 99, 132, 0.2)',
											                'rgba(54, 162, 235, 0.2)',
											                'rgba(255, 206, 86, 0.2)',
											                'rgba(75, 192, 192, 0.2)',
											                'rgba(153, 102, 255, 0.2)',
											                'rgba(255, 159, 64, 0.2)'
											            ],
											            borderColor: [
											                'rgba(255, 99, 132, 1)',
											                'rgba(54, 162, 235, 1)',
											                'rgba(255, 206, 86, 1)',
											                'rgba(75, 192, 192, 1)',
											                'rgba(153, 102, 255, 1)',
											                'rgba(255, 159, 64, 1)'
											            ],
											            borderWidth: 1
											        }]
											    },
											    options: {
											        scales: {
											            yAxes: [{
											                ticks: {
											                    beginAtZero: true
											                }
											            }]
											        }
											    }
											});
										</script>
                                    </div>
                                </div>
                        	</div>
                        	
                        	
                      		
                      
                      
                      	</div>
					</div>
           		</div>
<!-- 
                    <div class="product-item-description d-flex ms-auto">
                        <div class="bg-faded p-5 rounded"><p class="mb-0">Our seasonal menu features delicious snacks, baked goods, and even full meals perfect for breakfast or lunchtime. We source our ingredients from local, oragnic farms whenever possible, alongside premium vendors for specialty goods.</p></div>
		                </div>
                    </div> -->
        </section>
        
         <section class="page-section">
            <div class="container">
                <div class="product-item">
                    <div class="product-item-title d-flex">
                        
                        
                        <div class="bg-faded p-5 d-flex ms-auto rounded">
                        
                        <form action="./comment.do" method="post" onsubmit="return validateForm(this);"> 
	            				<input type="hidden" name="inputId" value="<%= session.getAttribute("inputId") %>"/>
	                            <input type="hidden" name="mode" value="add">
	                            
	                            <div class="row mb-3 col d-flex justify-content-end ">
                                    <div class="col-md-3 row form-floating mb-3 mb-md-0">
                                    
                                    
                                    
                                    <%
                                    String name="";
                                    if (session.getAttribute("inputId")!=null){ 
                                    	name= session.getAttribute("inputId").toString();
                                    }
                                    else {
                                    	name= "비회원";
                                    }
                                     
                                    %>
                                    
                                        <input class=" col-md-4 form-control" name="name" type="text" 
                                        	value="<%= name %>" placeholder="" />
                                    <%    	
                                    %>    	
                                        	
                                        	
                                  		<label for="name">작성자</label>
                                  	</div>
                                  	<div class="col-md-6 row form-floating mb-3 mb-md-0">	
                                  		<input class="col-md-4 form-control" name="comment" type="text" placeholder="" />
                                  		<label for="comment">내용</label>
	                            	</div>
		                            <div class="col-md-3 form-floating mb-3 mb-md-0">
		                             	<button type="submit" class="btn btn-primary btn-block" >댓글추가</button>
		                            </div>
	                            </div>
	                       	</form>
                        
                        
                            <%-- <h2 class="section-heading mb-0">
                                <span class="section-heading-lower">대화명  </span>
                                <span class="section-heading-upper">웹소켓 채팅 - 대화명 적용해서 채팅창 띄워주기</span>
	                        </h2> 
	                          	<div>  
		                            <jsp:include page="./webSocket/MultiChatMain.jsp" />
		                        </div>  --%> 
                        </div> 
                    
<% 
					if(request.getAttribute("chat")=="ing") {
%>					
                    <div class="product-item-description mx-auto d-flex rounded img-fluid mb-3 mb-lg-0 m-3">
                        <div class="bg-faded p-5 rounded">
                        	<span>ㅎㅎ</span>
                        </div>
                    </div> 
<%
						request.removeAttribute("chat"); }
%>
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