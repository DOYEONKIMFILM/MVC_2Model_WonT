<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileUploadForm.jsp</title>
</head>
<body>
<div align="center">
	<div><h1>파일관리</h1></div>
	<div>
		<div>									<!-- 첨부파일시: enctype="multipart/form-data" -->
			<form id="frm" action="fileUpload.do" method="post" enctype="multipart/form-data">
				<table border="1">
					<tr>
						<th width="100">등록자</th>
						<td width="150"><input type="text" id="writer" name="writer"></td>
						<th width="100">등록일자</th>
						<td width="150"><input type="date" id="enterDate" name="enterDate"></td>
					</tr>
					<tr>
						<td colspan="4">
							<input type="file" id="file" name="file">
						</td>	
					</tr>
				</table><br>
				<input type="submit" value="등록">&nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소">&nbsp;&nbsp;&nbsp;
			</form>
		</div>
	</div>
</div>
</body>
</html>