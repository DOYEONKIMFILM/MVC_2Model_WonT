<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>notice</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Custom styles for this template -->
<link href="css/stylelogin.css" rel="stylesheet" />
</head>
<body class="sub_page">
	<!-- 로그인폼 시작 -->
	<div class="wrap">
		<div class="form-wrap" style="width: 20%; min-height: 670px;">
			<div class="button-wrap" style="display: flex; width: 100%;">
				<div id="btn" class="togglebtn" style="width: 40%;"></div>
				<button type="button" style="color: white; flex: 1;"
					class="togglebtn" onclick="login()">로그인</button>
				<button type="button" style="color: white; flex: 1;"
					class="togglebtn" onclick="register()">회원가입</button>
			</div>

			<!--  
			<form id="frm" action="login.do" method="post" class="input-group">
				<input type="text" class="input-field" id="phoneNumber" name="phoneNumber" placeholder="휴대폰번호" required>
				<input type="password" class="input-field" id="password" name="password" placeholder="비밀번호" required><br> <br>
				<button class="submit" id="btnLogin" name="btnLogin" style="color: white;">Login</button>
			</form>
			-->

			<div id="divLogin" class="input-group">
				<input type="text" class="input-field" id="phoneNumber"
					name="phoneNumber" placeholder="휴대폰번호" required> <input
					type="password" class="input-field" id="password" name="password"
					placeholder="비밀번호" required><br> <br>
				<button class="submit" id="btnLogin" name="btnLogin" style="color: white;" onclick="login_Exce()">로그인</button>
			</div>

			<!-- 
			form을 사용하지 않는다 -> div로 수정
			form 안에 있는 submit 버튼에 onclick="함수명()" 을 준다.
			 -->
			<form id="frm" action="join.do" method="post">
				<div>
					<input type="text" class="input-field" id="name" name="name"
						placeholder="이름" required><input type="text"
						class="input-field" id="birthday" name="birthday"
						placeholder="생년월일(1990-01-01 형식으로 입력하시오)" required><input
						type="text" class="input-field" id="gender" name="gender"
						placeholder="성별(남/여)" required><input type="text"
						class="input-field" id="phoneNumber" name="phoneNumber"
						placeholder="휴대폰 번호(숫자로만 입력하시오)" required> <input
						type="password" class="input-field" id="password" name="password"
						placeholder="비밀번호" required> <input type="text"
						class="input-field" id="address" name="address" placeholder="주소"
						required> <input type="date" class="input-field"
						id="startDate" name="startDate" placeholder="격리 시작일" readonly="readonly">
					<input type="text" class="input-field" id="authority"
						name="authority" value="USER" placeholder="권한" readonly="readonly">
				</div>
				<script>
					document.getElementById('startDate').value = new Date()
							.toISOString().substring(0, 10);
				</script>
				<br>
				<div style="margin: 10px; display: flex;">
					<input class="submit" style="color: white; width: 30%; margin: 10px; flex: 1;" type="submit" value="회원가입">
					<input class="submit" style="color: white; width: 30%; margin: 10px; flex: 1;" type="reset" value="취소">
				</div>
			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script type="text/javascript" src="js/loginform.js"></script>
</body>
<!-- 로그인폼 끝 -->
</html>