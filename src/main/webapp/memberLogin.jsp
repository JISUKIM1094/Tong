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
        <title>로그인 Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        
        <script type="text/javascript">
	    	function validateForm(form) {
				if(form.inputId.value ==""){
					alert("ID를 입력하세요");
					form.inputId.focus();
					return false;
				}
				if(form.inputPass.value ==""){
					alert("비밀번호를 입력하세요");
					form.inputPass.focus();
					return false;
				}
			}
	    </script>
	    
    </head>
    <body class="bg-primary">
    
<!---------------------------------------->
    <%
    if (session.getAttribute("inputId") == null) { //session영역 id속성값이 저장되어있지 않다면
    //로그아웃 상태이므로 로그인 폼을 출력한다.
    %>
<!---------------------------------------->   
    
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    
                                    
                                    
                                    
                                    <div class="card-body">
				                        <form action="./login.do" name="mem_loginFrm" method="post" onsubmit="return validateForm(this);"> 
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="inputId" type="text" placeholder="Create a id" />
		                                        <label for="inputId">ID</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="inputPass" type="password" placeholder="Password" />
                                                <label for="inputPass">Password</label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                                            </div>
                                            
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="password.jsp">Forgot Password?</a>
                                                <button type="submit" class="btn btn-primary btn-block" >Login</button>
	                                           
                                            </div>
                                        </form>
                                    </div>
                                    
                                    
                                    
<!---------------------------------------->
    <%
    } else {  
    %>
		<script>
		alert("로그인 중 입니다.");
		location.href="main.jsp"
		</script>
    <%
    }
    %>
<!---------------------------------------->    

                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="register.jsp">Need an account? Sign up!</a></div>
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
