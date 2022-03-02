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
	<div><h1>게시글 목록</h1></div>
	<div>
		<table border="1">
			<tr>
				<th width="70">글번호</th>
				<th width="100">작성자</th>
				<th width="300">제 목</th>
				<th width="100">작성일자</th>
				<th width="70">조회수</th>
			</tr>
			<c:forEach items="${notices }" var="notice">
				<tr onmouseover='this.style.background="#fcecae";'
					onmouseleave='this.style.background="#FFFFFF";'
					onclick="noticeSearch('${notice.noticeId }')">
					<td align="center">${notice.noticeId }</td>
					<td align="center">${notice.noticeWriter }</td>
					<td>&nbsp; ${notice.noticeTitle }</td>
					<td align="center">${notice.noticeDate }</td>
					<td align="center">${notice.noticeHit }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form id="frm" action="noticeSelect.do" method="post">
			<input type="hidden" id="noticeId" name="noticeId">
		</form>
	</div>
	<div>
		<a href="noticeWriteForm.do">게시글 작성</a>
	</div>
</div>
<script type="text/javascript">
	function noticeSearch(n) {
		frm.noticeId.value = n;
		frm.submit();
	}
</script>
</body>
</html>