<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeSelect.jsp</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>
<body>
	<div
		style="margin: 0px auto; width: 100%; padding: 20px; background-color: White; align: center;">
		<div class="main-panel" style="width: 1800px; left: 50%;">
			<div class="content-wrapper">
				<div class="row">
					<div class="col-md-6 grid-margin stretch-card" style="margin: 0px auto;">
						<div class="card">
							<div class="col-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">공지사항</h4>
										<p class="card-description">공지사항을 확인하세요</p>

										<div class="form-group">
											<label for="exampleInputName1">작성일자</label> <input
												type="text" class="form-control" id="exampleInputName1"
												value=${notice.noticeDate } readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail3">조회수</label> <input
												type="text" class="form-control" id="exampleInputEmail3"
												value=${notice.noticeHit } readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputPassword4">제목</label> <input
												type="text" class="form-control" id="exampleInputPassword4"
												value=${notice.noticeTitle } readonly>
										</div>
										<div class="form-group">
											<label for="exampleSelectGender">내용</label><br>
											<textarea rows="10" cols="93%">${notice.noticeContent }</textarea>
										</div>

										<div style="text-align: center;">
											<form action="noticeUpdateForm.do" method="post">
												<button class="btn btn-primary me-2" type="button"
													onclick="location.href='noticeList.do'">목록</button>

												<c:if test="${authority == 'ADMIN'}">
													<button class="btn btn-light" type="submit">수정</button>
												</c:if>

												<input type="hidden" name="id" value="${notice.noticeId }">

												<c:if test="${authority == 'ADMIN'}">
													<button class="btn btn-light" type="button"
														onclick="noticeDelete()">삭제</button>&nbsp;&nbsp;
										</c:if>
												<input type="hidden" id="pkid" name="pkid"
													value="${notice.noticeId }">
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script type="text/javascript" src="js/notice.js"></script>
</body>
</html>