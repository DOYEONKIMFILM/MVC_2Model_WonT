<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeSelect.jsp</title>
</head>
<body>
	<div style="width: 100%; padding: 20px; background-color: White; align: center;">
		<div class="main-panel" style="width: 1800px;">
			<div class="content-wrapper">
				<div class="row">
					<div class="col-md-6 grid-margin stretch-card" style="margin: 0px auto;">
						<div class="card">
							<div class="col-12 grid-margin stretch-card">
								<div class="card">
									<form id="frm" action="noticeUpdate.do" method="post">
										<div class="card-body">
											<h4 class="card-title">공지사항 수정</h4>
											<p class="card-description">공지에 필요한 자료를 꼼꼼하게 검토 한 후 입력
												해주시기바랍니다</p>

											<div class="form-group">
												<label for="exampleInputName1">작성일자</label> <input
													class="form-control" type="date" id="noticeDate"
													name="noticeDate" value="${notice.noticeDate}">
											</div>
											<script>
												document
														.getElementById('noticeDate').value = new Date()
														.toISOString()
														.substring(0, 10);
											</script>
											<div class="form-group">
												<label for="exampleInputPassword4">제목</label> <input
													type="text" class="form-control" id="noticeTitle"
													name="noticeTitle" value="${notice.noticeTitle }">
											</div>
											<div class="form-group">
												<label for="exampleSelectGender">내용</label><br>
												<textarea rows="10" cols="93%" id="noticeContent"
													name="noticeContent">${notice.noticeContent }</textarea>
											</div>

											<div style="text-align: center;">
												<input type="hidden" name="id" value="${notice.noticeId }">
												<input type="reset" class="btn btn-light" value="취소">&nbsp;&nbsp;
												<input type="submit" class="btn btn-primary me-2" value="수정">&nbsp;&nbsp;
												<input type="button" class="btn btn-light" value="목록" onclick="location.href='noticeList.do'">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<%-- <div align="center">
		<div>
			<h1>공지사항 수정</h1>
		</div>
		<div>
			<form id="frm" action="noticeUpdate.do" method="post">
				<div>
					<table border="1">
						<tr>

							<th width="100">작성일자</th>
							<td width="150">
							<input type="date" size="59" id="noticeDate" name="noticeDate" value="${notice.noticeDate}"></td>

							<th width="100">조회수</th>
							<td width="100">${notice.noticeHit }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="5">
							<input type="text" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle }"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="5"><textarea rows="10" cols="100" name="noticeContent">${notice.noticeContent }</textarea></td>
						</tr>
					</table>
				</div><br>
				<div>
					<input type="hidden" name="id" value="${notice.noticeId }">
					<button type="submit">수정</button>&nbsp;&nbsp;
					<input type="reset" value="취소">&nbsp;&nbsp;
					<button type="button" onclick="location.href='noticeList.do'">목록</button>
				</div>
			</form>
		</div>
	</div> --%>
</body>
</html>