<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원 정보 수정</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	    
	    <script type="text/javascript">
	    	function validateForm(form) {
				if(form.inputEmail.value ==""){
					alert("Email을 입력하세요");
					form.inputEmail.focus();
					return false;
				}
				if(form.inputPasswordConfirm.value != form.inputPassword.value ){
					alert("비밀번호가 일치하지 않습니다.");
					form.inputPasswordConfirm.focus();
					return false;
				}
			}
	    	
	    	function unJoin() {
		    	var t = confirm("탈퇴하시겠습니까?");
		    	if(t) 
		    		location.href="./memberUnjoin.do?inputId=${dto.inputId}";
		    	
	    	}
	    </script>
    
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원정보수정</h3></div>
	                                    <div class="card-body">
                                        <form action="./memberUpdate.do" name="updateFrm" method="post" onsubmit="return validateForm(this);">
                                            <div class="row ">
                                                <div class="col-md-4">
													<input type="hidden" name="inputId" value="${dto.inputId }">
                                                       <input class="form-control" name="inputId" type="text" 
                                                        value="ID:  ${dto.inputId }" disabled/>
   	                                                <label for="inputId"> </label>
                                                </div>
                                                <div style="color: red" class="col-md-8">
                                                        <span >정보 수정 완료 후 로그아웃됩니다. 
                                                        </span><br>
                                                        <a href="javascript:history.back()"><span>돌아가기</span></a>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
	                                                <input class="form-control" name="inputEmail" type="email" value="${dto.email }" />
   	                                                <label for="inputEmail">*Email address</label>
                                            </div>
                                                     	
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input type="hidden" name="origin_pass" value="${dto.pass }">
		                                                <input class="form-control" name="inputPassword" type="password" 
		                                                	placeholder="비밀번호를 변경하려면 입력하세요" />
		                                                <label for="inputPassword">*비밀번호 변경</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="inputPasswordConfirm" type="password" placeholder="Confirm password" />
                                                        <label for="inputPasswordConfirm">*Confirm Password</label>
                                                    </div>
                                                </div>
                                            </div>  
                                                
                                                
                                                
                                                
                                           <%--  선택사항
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="inputFirstName" type="text" value="${dto.firstName }"  />
                                                        <label for="inputFirstName">First name</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name="inputLastName" type="text" value="${dto.lastName }" placeholder="Enter your last name" />
                                                        <label for="inputLastName">Last name</label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="inputGender" type="text" value="${dto.gender }" placeholder="Enter your gender" />
                                                        <label for="inputGender">Gender</label>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name="inputAge" type="text" value="${dto.age }" placeholder="Enter your Age" />
                                                        <label for="inputAge">Age</label>
                                                    </div>
                                                </div>
                                            </div>
                                                --%>
                                                
                                                
                                                
	                                        <div class="mt-4 mb-0">
	                                            <div class="d-grid">
		                                        	<button type="submit" class="btn btn-primary btn-block" >정보수정</button>
	                                            </div>
	                                        </div>
	                                        
	                                        <div class="mt-4 mb-0">
	                                            <div class="d-grid">
		                                        	<button type="button" style="color: gray" class="btn btn-block" onclick="unJoin();">회원탈퇴</button>
		                                        		<!--진짜 탈퇴하는지 한번 더 물어보기!! prompt  -->
	                                            </div>
	                                        </div>
                                    	</form>
                                 	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </main>
            </div>
            <br><br><br><br><br><br><br>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; JISU's Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
    
    
</html>
