<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
</head>
<body>
	<div align="center">
		<div><h1>멤버 리스트</h1></div>
		<div>
			<table border="1">
				<tr>
					<th width="100">아이디</th>
					<th width="100">이름</th>
					<th width="100">전화번호</th>
					<th width="100">주소</th>	
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
		</div><br>
		<input type="button" value="홈으로" onclick="location.href='home.do'">&nbsp;&nbsp;
		<div>
	</div>
	</div>
</body>
</html>