<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
</head>
<body>
<div align="center">
	<jsp:include page="../main/header.jsp" />
	<div><h1>LOGIN</h1></div>
	<div>
		<form id="frm" action="login.do" method="post">
			<div>
				<table border="1">
					<tr>
						<th width="100">휴대전화</th>
						<td width="150"><input type="text" id="phoneNumber" name="phoneNumber"></td>
					</tr>
					<tr>
						<th width="100">비밀번호</th>
						<td width="150"><input type="password" id="password" name="password"></td>
					</tr>
				</table>
				<div><br>
					<input type="submit" value="로그인">&nbsp;&nbsp;
					<input type="reset" value="초기화">
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>