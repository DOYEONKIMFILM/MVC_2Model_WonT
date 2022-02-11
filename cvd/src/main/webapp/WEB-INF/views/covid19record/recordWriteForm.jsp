<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div
		style="margin: 0px auto; width: 100%; padding: 20px; background-color: White; align: center;">
		<div class="main-panel" style="width: 1800px; left: 50%;">
			<div class="content-wrapper">
				<div class="row">
					<div class="col-md-6 grid-margin stretch-card"
						style="margin: 0px auto;">
						<div class="card">
							<div class="col-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">증상기록</h4>
										<p class="card-description">열과 산소포화도를 제외한 증상은 증상 기록 항목에
											기록해주세요</p>
										<form id="frm" action="recordWrite.do" method="post">
											<div class="form-group">
												<label for="exampleInputName1">기록시각</label> <input
													type="text" class="form-control" id="recordTime"
													name="recordTime" readonly="readonly">
											</div>
											<div class="form-group">
												<label for="exampleInputEmail3">이름</label> <input
													type="text" class="form-control" id="name" name="name"
													value="${name }" readonly="readonly">
											</div>
											<div class="form-group">
												<label for="exampleInputPassword4">휴대번호</label> <input
													type="text" class="form-control" id="phoneNumber"
													name="phoneNumber" value="${phoneNumber }"
													readonly="readonly">
											</div>
											<div class="form-group">
												<label for="exampleInputPassword4">열</label> <input
													type="text" class="form-control" id="temperature"
													name="temperature">
											</div>
											<div class="form-group">
												<label for="exampleInputPassword4">산소포화도</label> <input
													type="text" class="form-control" id="oxygenSaturation"
													name="oxygenSaturation">
											</div>
											<div class="form-group">
												<label for="exampleSelectGender">증상기록</label><br>
												<textarea rows="10" cols="93%" id="symptom" name="symptom"></textarea>
											</div>

											<div style="text-align: center;">
												<input type="submit" class="btn btn-primary me-2" value="등록">&nbsp;&nbsp;
												<input type="reset" class="btn btn-light" value="지우기">&nbsp;&nbsp;
												<input type="button" class="btn btn-primary me-2" value="목록"
													onclick="location.href='recordList.do'">
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
	</div>

	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script type="text/javascript" src="js/record.js"></script>
</body>
</html>