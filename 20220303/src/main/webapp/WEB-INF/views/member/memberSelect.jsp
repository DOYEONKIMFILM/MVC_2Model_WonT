<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberSelect.jsp</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 상세내용</h1>
		</div>
		
		<form id="selfrm" action="memberUpdate.do" method="post">
		<div>
			<table border="1">
				<tbody>
					<tr>
						<th>아이디</th>
						<td width="170"><input type="text" id="id" name="id" value="${member.id}"></td>
					</tr>
					<tr>	
						<th>이름</th>
						<td width="170"><input type="text" id="name" name="name" value="${member.name }"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td width="170"><input type="text" id="tel" name="tel" value="${member.tel }">
					</tr>
					<tr>
						<th>주소</th>
						<td width="170"><input type="text" id="address" name="address" value="${member.address }"></td>
					</tr>
				</tbody>
			</table>
		</div><br>
		
		<div>
			<button type="button" onclick="location.href='memberList.do'">목록</button>
			<input type="submit" value="수정">
			<button type="button" onclick="location.href='memberDelete.do?id=${member.id}'">삭제</button>	
		</div>
		</form>
	</div>
</body>
</html>