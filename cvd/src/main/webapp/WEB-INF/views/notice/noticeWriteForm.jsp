<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeWriteForm.jsp</title>
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
									<form id="frm" action="noticeWrite.do" method="post">
										<div class="card-body">
											<h4 class="card-title">공지사항 등록하기</h4>
											<p class="card-description">공지에 필요한 자료를 꼼꼼하게 검토 한 후 입력
												해주시기바랍니다</p>

											<div class="form-group">
												<label for="exampleInputName1">작성일자</label> <input
													class="form-control" type="date" id="noticeDate"
													name="noticeDate">
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
													name="noticeTitle">
											</div>
											<div class="form-group">
												<label for="exampleSelectGender">내용</label><br>
												<textarea rows="10" cols="93%" id="noticeContent"
													name="noticeContent"></textarea>
											</div>

											<div style="text-align: center;">
												<input type="submit" class="btn btn-light" value="등록">&nbsp;&nbsp;
												<input type="reset" class="btn btn-primary me-2" value="취소">&nbsp;&nbsp;
												<input type="button" class="btn btn-light" value="목록"
													onclick="location.href='noticeList.do'">
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
</body>
</html>