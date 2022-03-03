<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<div><h1>LOGIN</h1></div>
	<div>
		<form id="lofrm" action="memberLogin.do" method="post">
			<div>
				<table border="1">
					<tr>
						<th width="120">아이디</th>
						<td width="200"><input type="text" id="id" name="id"></td>
					</tr>
					<tr>
						<th width="120">비밀번호</th>
						<td width="200"><input type="password" id="password" name="password"></td>
					</tr>
				</table>
			</div><br>
			<div>
				<input type="button" value="홈으로" onclick="location.href='home.do'">&nbsp;&nbsp;
				<input type="submit" value="로그인">&nbsp;&nbsp;&nbsp;
				<input type="reset" value="초기화">&nbsp;&nbsp;&nbsp;
				<input type="button" value="회원가입" onclick="location.href='memberJoin.do'">&nbsp;&nbsp;&nbsp;
			</div>
		</form>
	</div>
</div>
</body>
</html>