<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="resources/login-form-15/css/style.css">

	</head>
	<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">MEMBER LOGIN</h2>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap">
						<div class="img" style="background-image: url(resources/login-form-15/images/bg-1.jpg);"></div>
						<div class="login-wrap p-4 p-md-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4"></h3>
			      		</div>
								<div class="w-100">
									<p class="social-media d-flex justify-content-end">
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
									</p>
								</div>
			      	</div>
							<form id="frm" action="memberLogin.do" method="post" class="signin-form">
			      		<div class="form-group mt-3">
			      			<input type="text" id="id" name="id" class="form-control" required>
			      			<label class="form-control-placeholder" for="username">아이디</label>
			      		</div>
		            <div class="form-group">
		              <input type="password" id="password" name="password" class="form-control" required>
		              <label class="form-control-placeholder" for="password">비밀번호</label>
		              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
		            </div>
		            <div class="form-group">
		            	<button type="submit" class="form-control btn btn-primary rounded submit px-3">로그인</button>
		            </div>
		            <div class="form-group d-md-flex">
		            	<div class="w-50 text-left">
			            	<label class="checkbox-wrap checkbox-primary mb-0">정보 저장하기
									  <input type="checkbox" checked>
									  <span class="checkmark"></span>
										</label>
									</div>
									<div class="w-50 text-md-right">
										<a href="#">비밀번호 찾기</a>
									</div>
		            </div>
		          </form>
		          <p class="text-center">회원이 아니십니까? <a data-toggle="tab" href="#signup"> 회원가입</a></p>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="resources/login-form-15/js/jquery.min.js"></script>
  <script src="resources/login-form-15/js/popper.js"></script>
  <script src="resources/login-form-15/js/bootstrap.min.js"></script>
  <script src="resources/login-form-15/js/main.js"></script>

	</body>
</html>

