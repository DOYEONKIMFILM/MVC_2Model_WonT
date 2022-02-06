<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList.jsp</title>
</head>
<body>
<div align="center">
	
	<div><h1>공지사항 목록</h1></div>
	<div>
		<table border="1">
			<thead>
				<tr>
					<th width="70">글번호</th>
					<th width="250">제목</th>
					<th width="100">작성자</th>
					<th width="150">작성일자</th>
					<th width="70">조회수</th>
				</tr>
				<tbody>
					<c:forEach items="${notices }" var="notice">
						<tr onmouseover='this.style.background="yellow";'
							onmouseleave='this.style.background="white";'
							onclick="noticeSelect(${notice.noticeId})">
							<td align="center">${notice.noticeId }</td>
							<td align="center">${notice.noticeTitle }</td>
							<td align="center">${notice.noticeWriter }</td>
							<td align="center">${notice.noticeDate }</td>
							<td align="center">${notice.noticeHit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</thead>
		</table>
	</div><br>
	<div>
		<c:if test="${not empty id }">
		<button type="button" onclick="location.href='noticeWriteForm.do'">글쓰기</button>
		</c:if>
	</div>
	<div>
		<form id="frm" action="noticeSelect.do" method="post">
			<input type="hidden" id="noticeId" name="noticeId">	<!-- id=자바스크립트변수, name=자바에서쓰기위한변수 -->
		</form>
	</div>
		<script type="text/javascript">
			function noticeSelect(id) {	//선택된 행의 세부내역을 보기 위한 함수
				frm.noticeId.value = id;
				frm.submit();	//noticeSelect.do 로 이동
			}
		</script>
</div>
</body>
</html>