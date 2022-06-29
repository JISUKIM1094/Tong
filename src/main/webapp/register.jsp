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
        <title>회원가입 Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

	    <script type="text/javascript">
	    	/* 여기서 폼값체크 */
	    	function validateForm(form) {
				if(form.inputId.value ==""){
					alert("ID를 입력하세요");
					form.inputId.focus();
					return false;
				}
				
				 var Chk = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사       
				if (!Chk.test(form.inputId.value)) {
					alert("ID는 영문,숫자 4~12로 입력하세요.");
					form.inputId.focus();
					return false;
				}
				
				if(form.inputEmail.value ==""){
					alert("Email을 입력하세요");
					form.inputEmail.focus();
					return false;
				}
				if(form.inputPassword.value ==""){
					alert("비밀번호를 입력하세요");
					form.inputPassword.focus();
					return false;
				}
				if(form.inputPasswordConfirm.value != form.inputPassword.value ){
					alert("비밀번호가 일치하지 않습니다.");
					form.inputPasswordConfirm.focus();
					return false;
				}
			}

	    </script>
    
    
    
 
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
function idChk(){
	var inputId= $('#inputId').val(); // inputId 입력값
	console.log(inputId+"검사중...");
	
	$('#inputId').focusout(function() { 
        $.ajax({
            url : './memberJoin.do', //요청할 서버의 url
            type : 'get', 
            
            data : {inputId: inputId}, // 요청시 전송 할 값, 파라미터.
            dataType : "json", //콜백 데이터 형식 지정
            
            success : function(result) { //성공 했을 때 콜백함수. resData == 콜백데이터
            	if(result ==0){
            		$('#checkId').html('사용불가');
            		$('#checkId').attr('color','red');
            	}
            	else{
            		$('#checkId').html('사용가능');
            		$('#checkId').attr('color','green');
            	}
            },
            error: function() { 
            	alert('서버요청 실패');
            }
        });        
    });
}

</script>    

<script type="text/javascript">
	    $(function() {
	    	$('#passwd2').keyup(function() {
	    		var passVal = $('#passwd1').val();
				var inputVal = $(this).val(); 
				var eq = false;
				
				for(var i=0; i<inputVal.length; i++){ 
					if(passVal == inputVal) {
						console.log(inputVal,"일치");
						eq=true;
					}
				}
				if(eq) $('#passwdChk').css('color','red').css('fontSize','15px').css('fontWeight','normal');
				else $('#passwdChk').css('color','white').css('fontSize','15px').css('fontWeight','normal');
	    	});
	    	
	    	
	    	
			$('#passwd1').keyup(function() { //입력 할때마다 함수 실행
				var inputVal = $(this).val(); //패스워드 1에 입력 된 값 변수에 저장
				console.log(inputVal,"입력"); //콘솔에서 확인
				if(inputVal.length >=8) //8자 이상 체크
				{//alert("good");
					$('#confirm4').css({'color':'green', 'fontSize':'22px', 'fontWeight':'bold'});
				}else $('#confirm4').css('color','red').css('fontSize','15px').css('fontWeight','normal');
				
				//대소문자, 숫자 체크 변수 생성
				var upper = false, lower = false, number = false;
				
				for(var i=0; i<inputVal.length; i++){ //패스워드 길이만큼 반복하여 모든 문자 검사
					console.log("아스키코드: "+inputVal[i].charCodeAt(0)); //아스키 코드 값 확인
					//입력 문자열 중에 아래 조건에 맞는 문자가 하나라도 존재하면
						//true로 설정
					if ( 65 <= inputVal[i].charCodeAt(0) && inputVal[i].charCodeAt(0) <=90){ //대문자
					//alert("good"); 
						upper= true;
						console.log("upper: ",upper);
					}if ( 97 <= inputVal[i].charCodeAt(0) && inputVal[i].charCodeAt(0) <=122){ //소문자
						lower= true;
						console.log("lower: ",lower);
					//else $('#confirm2').css('color','red').css('fontSize','15px').css('fontWeight','normal');
					}if ( 48 <= inputVal[i].charCodeAt(0) && inputVal[i].charCodeAt(0) <=57){ //숫자
						number= true;
						console.log("num: ",number);
					}//else $('#confirm3').css('color','red').css('fontSize','15px').css('fontWeight','normal');
				}//for종료, 대문자 소문자 숫자 확인
				
				
				if(upper==true) $('#confirm1').css({'color':'green', 'fontSize':'22px', 'fontWeight':'bold'});
				else $('#confirm1').css('color','red').css('fontSize','15px').css('fontWeight','normal');
				if(lower==true) $('#confirm2').css({'color':'green', 'fontSize':'22px', 'fontWeight':'bold'});
				else $('#confirm2').css('color','red').css('fontSize','15px').css('fontWeight','normal');
				if(number==true) $('#confirm3').css({'color':'green', 'fontSize':'22px', 'fontWeight':'bold'});
				else $('#confirm3').css('color','red').css('fontSize','15px').css('fontWeight','normal');
			});
		});
	    
	    
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                                    
                                    <div class="card-body">
                                        <form action="./memberJoin.do" name="joinFrm" method="post" onsubmit="return validateForm(this);">
                                            <div class="row mb-3">
                                                <div class="col-md-8">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputId" name="inputId" type="text" onchange="idChk()" />
		                                                <label for="inputId">*ID 영문,숫자 4~12로 입력하세요. </label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-floating">
                                                    	<font id="checkId" size ="2"></font> 
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
	                                                <input class="form-control" name="inputEmail" type="email" />
	                                                <label for="inputEmail">*Email address</label>
                                            </div>
                                            
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id ="passwd1" name="inputPassword" type="password" />
                                                        <label for="inputPassword">*Password</label>
                                                    </div>
                                                </div>
                                                
                                               
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id ="passwd2" name="inputPasswordConfirm" type="password" />
                                                        <label id ="passwdChk" for="inputPasswordConfirm">*Confirm Password</label>
                                                    </div>
                                                </div>
                                            </div>   
                                                
                                            회원가입 선택사항
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="inputFirstName" type="text"  />
                                                        <label for="inputFirstName">First name</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name="inputLastName" type="text"  />
                                                        <label for="inputLastName">Last name</label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="inputGender" type="text"/>
                                                        <label for="inputGender">Gender</label>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" name="inputAge" type="text" />
                                                        <label for="inputAge">Age</label>
                                                    </div>
                                                </div>
                                            </div> 
                                                
	                                        <div class="mt-4 mb-0">
	                                            <div class="d-grid">
		                                        	<button type="submit" class="btn btn-primary btn-block" >회원가입</button>
	                                            </div>
	                                        </div>
	                                        
                                    	</form>
                                 	</div>
                                    
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="memberLogin.jsp">Have an account? Go to login</a></div>
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
