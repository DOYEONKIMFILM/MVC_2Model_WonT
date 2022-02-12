<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Table</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<div
		style="margin: 0px auto; width: 100%; padding: 20px; background-color: White; align: center;">

		<div class="table100 ver4 m-b-110">
			<div align="center"><h2>증상기록 목록</h2></div>
			<hr>
			<table style="width: 100%;">
				<thead>
					<tr class="row100 head" >
						<th class="cell100 column1" style="text-align: center"><input
							id="allCheck" type="checkbox" onclick="allChk(this);" /></th>
						<th class="cell100 column1">환자명</th>
						<th class="cell100 column1">전화번호</th>
						<th class="cell100 column2">증상기록</th>
						<th class="cell100 column3">체온</th>
						<th class="cell100 column4">산소포화도</th>
						<th class="cell100 column5">기록시간</th>
					</tr>
				</thead>

				<tbody class="table100-body js-pscroll">
					<c:forEach items="${record }" var="record">
						<tr onmouseover='this.style.background="#CCFFCC";'
							onmouseleave='this.style.background="white";'>
							<td class="cell100 column1"><input type="checkbox"
								name="rowcheck"
								value="${record.phoneNumber}&${record.recordTime}"></td>
							<td class="cell100 column1">${record.name}</td>
							<td class="cell100 column1">${record.phoneNumber }</td>
							<td class="cell100 column2">${record.symptom }</td>
							<td class="cell100 column3">${record.temperature }<label>℃</label></td>
							<td class="cell100 column4">${record.oxygenSaturation }<label>%</label></td>
							<td class="cell100 column5">${record.recordTime }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr>
		</div>

		<div style="text-align: center;">
			<c:if test="${authority == 'USER' }">
				<button type="button" class="btn btn-primary me-2"
					onclick="location.href='recordWriteForm.do'">증상기록</button>
			</c:if>
			<c:if test="${authority == 'ADMIN' }">
				<button type="button" class="btn btn-primary me-2" id="btnDelete"
					name="btnDelete" onclick="recordDelete()">삭제</button>&nbsp;&nbsp;
			</c:if>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<script type="text/javascript" src="js/record.js"></script>

	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!-- <script src="js/main2.js" /> -->
</body>
</html>