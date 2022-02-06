<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/menu.css">
</head>
<body>
	<div align="center">
		<div>
			<br>
		</div>
		<div>
			<!-- 메뉴 -->
			<ul>
				<li><a class="active" href="main.do">HOME</a></li>
				
					<!-- 아이디가 비어있으면 로그인 -->
				<c:if test="${empty phoneNumber }">
					<li><a href="loginForm.do">LOGIN</a></li>
				</c:if>
				
					<!-- 아이디가 비어있지 않다면 로그아웃 -->
				<c:if test="${not empty phoneNumber }">
					<li><a href="logout.do">LOGOUT</a></li>
				</c:if>
				
				<li><a href="#">Product</a></li>
				<li><a href="#">Service</a></li>
				<li><a href="#">Members</a></li>
			</ul>
		</div>
	</div>
</body>
</html>