<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberJoin.jsp</title>
</head>
<body>
<div align="center">
  <div><h1>회원가입</h1></div>
	<form id="jofrm" action="memberInsert.do" method="post">
	<div>
		<table border="1">
			<tr>
				<th width="120">아이디</th>
				<td width="170"><input type="text" id="id" name="id"></td>
			</tr>
			<tr>
				<th width="150">비밀번호</th>
				<td width="170"><input type="password" id="password" name="password"></td>
			</tr>
			<tr>
				<th width="120">이름</th>
				<td width="170"><input type="text" id="name" name="name"></td>
			</tr>
			<tr>
				<th width="120">전화번호</th>
				<td width="170"><input type="text" id="tel" name="tel"></td>
			</tr>
			<tr>
				<th width="120">주소</th>
				<td width="170"><input type="text" id="address" name="address"></td>
			</tr>
			<tr>
				<th width="120">권한</th>
				<td width="170"><input type="text" id="author" name="author" value="user" readonly="readonly"></td>
			</tr>
		</table>
	</div><br>
	<div>
		<input type="submit" value="가입">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="초기화">&nbsp;&nbsp;&nbsp;
		<input type="button" value="홈으로" onclick="location.href='home.do'">&nbsp;&nbsp;&nbsp;
	</div>
	</form>
</div>
</body>
</html>