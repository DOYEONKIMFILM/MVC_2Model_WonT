<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h1>MEMBER LIST</h1>
		<div>
			<table border="1">
				<tr>
					<th width="120">아이디</th>
					<th width="120">이름</th>
					<th width="120">전화번호</th>
					<th width="120">주소</th>
				</tr>
				<c:forEach items="${members }" var="member">
					<tr onmouseover='this.style.background="#fcecae";'
						onmouseleave='this.style.background="#FFFFFF";'
						onclick="location.href='memberSelect.do?id=${member.id}'">
					<td align="center">${member.id }</td>
					<td align="center">${member.name }</td>
					<td align="center">${member.tel }</td>
					<td align="center">${member.address }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>