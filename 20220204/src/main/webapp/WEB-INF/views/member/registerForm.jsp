<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="user" onsubmit="return checkForm()" action="register.do" method="post">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="id" name="id"
                                            placeholder="Enter Id...">
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="button" class="btn btn-primary btn-user btn-block" id="idKey"
                                        		onclick="idCheck()" value="No">ID 중복체크</button>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="password" name="password" placeholder="Password">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="repeatPassword" placeholder="Repeat Password">
                                    </div>
                                    
                                </div>
                                 <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="name" name="name"
                                        placeholder="Your Name..." required="required">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="address" name="address"
                                        placeholder="Your Address...">
                                </div>
                                 <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="tel" name="tel"
                                        placeholder="Your Telephone Number...">
                                </div>
                                
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    Register Account
                                </button>
                                <hr>
                                <a href="#" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="#" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="#">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="loginForm.do">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <script type="text/javascript">
    	function idCheck() { //아이디 중복체크 함수 ajax 이용 비동기통신. ajax -> 호출한 페이지 결과를 받음
    		$.ajax({
    			url : "idCheck.do",
    			type : "post",
    			data : {id : $("#id").val()},
    			dataType : "text",
    			success : function(data) {
    				if(data == "0") {
    					alert($("#id").val() + "\n 이미 존재하는 아이디 입니다.");
    					$("#id").val("");
    					$("#id").focus();
    				} else {
    					alert($("#id").val() + "\n 사용가능한 아이디 입니다.");
    					$("#idKey").val("Yes");
    				}
    			}
    		});
    	}
    	
    	function checkForm() { //form validation 값 정확히 들어왔는지 체크
    		if($("#idKey").val() != "Yes") {
    			alert("아이디 중복체크를 해주세요.");
    			return false;
    		}
    		
    		if($("#password").val() != $("#repeatPassword").val())
    			alert("패스워드가 일치 하지 않습니다.");
    			$("#password").val("");
    			$("#repeatPassword").val("");
    			$("#password").focus();
    			return false;
    		}
    		
    		return true;
    	}
    </script>
</body>
</html>