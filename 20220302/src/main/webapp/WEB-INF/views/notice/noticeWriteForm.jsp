<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeWriteForm</title>
</head>
<body>
<div align="center">
	<div><h1>게시글 작성</h1></div>
	<div>
		<form id="frm" action="noticeWrite.do" method="post">
			<div>
				<table border="1">
					<tr>
						<th width="100">작성자</th>
						<td width="150"><input type="text" id="noticeWriter" name="noticeWriter" required="required"></td>
						
						<th width="100">날짜</th>
						<td width="150"><input type="date" id="noticeDate" name="noticeDate" required="required"></td>		
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" size="78" id="noticeTitle" name="noticeTitle" required="required"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea rows="10" cols="80" id="noticeSubject" name="noticeSubject" required="required"></textarea></td>
					</tr>
				</table>
			</div><br>
			<input type="button" value="목 록" onclick="location.href='noticeList.do'">&nbsp;&nbsp;
			<input type="submit" value="등 록">&nbsp;&nbsp;
			<input type="reset" value="초기화">&nbsp;&nbsp;	
			<input type="button" value="홈으로" onclick="location.href='home.do'">&nbsp;&nbsp;
		</form>
	</div>
</div>
</body>
</html>