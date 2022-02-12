<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<script>
	// API 얻어오고
	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'cPxVAevbvzOS3Sb3NJOODLtLTflfaVUO1Aw922Wwz3HhvL8iwd1v6bRrkbBNyY1x1RQTINgW0dgsmOq1aHkaCA%3D%3D'; /*Service Key*/
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
		queryParams += '&' + encodeURIComponent('startCreateDt') + '=' + encodeURIComponent('20220212'); /**/
		queryParams += '&' + encodeURIComponent('endCreateDt') + '=' + encodeURIComponent('20220212'); /**/
		xhr.open('GET', url + queryParams);

	// XML 파싱해서 데이터 가져오기
	xhr.onreadystatechange = function() {
		if (this.readyState == 4) {
			let xmlFile = this.responseText;
			let gubun = [];
			let defCnt = [];
			$(xmlFile).find("item").each(function() {
				gubun.push($(this).find("gubun").text());
				defCnt.push($(this).find("defCnt").text());
			});
			//console.log(gubun, defCnt, gubun.lenght);

			// 파이 차트 소스
			new Chart(document.getElementById("bar-chart"), {
				type : 'bar',
				data : {
					labels : gubun,
					datasets : [ {
						label : "Population",
						backgroundColor : [ "	#4682B4", "#B0E0E6", "#AFEEEE",
								"#B0C4DE", "#87CEEB", "#87CEFA", "#00BFFF",
								"#1E90FF", "#6495ED", "#4169E1", "#0000FF",
								"#0000CD", "#000080", "#00008B", "#2E8B57",
								"#3CB371", "#90EE90", "#66CDAA", "#F08080", ],
						data : defCnt
					} ]
				},
				options : {
					title : {
						display : true,
						text : '2022년 2월 12일 00:00 기준'
					}
				}
			});
		}
	}

	xhr.send('');
</script>
</head>

<body>
	<div
		style="width: 100%; padding: 20px; background-color: White; align: center;">
		<div class="main-panel" style="width: 1800px;">
			<div align="center">
				<h4>코로나19 지역별 환진자</h4>
				<p>국내 지역별 확진자 수 입니다</p>
				<div id="chartdiv"></div>
			</div>
			<canvas id="bar-chart" width="600" height="200"></canvas>

		</div>
	</div>
</body>
</html>