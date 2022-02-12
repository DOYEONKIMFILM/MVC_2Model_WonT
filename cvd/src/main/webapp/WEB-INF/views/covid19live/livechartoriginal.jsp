<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		// API 얻어오고
		var xhr = new XMLHttpRequest();
		var url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'cPxVAevbvzOS3Sb3NJOODLtLTflfaVUO1Aw922Wwz3HhvL8iwd1v6bRrkbBNyY1x1RQTINgW0dgsmOq1aHkaCA%3D%3D'; /*Service Key*/
			queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
			queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
			queryParams += '&' + encodeURIComponent('startCreateDt') + '=' + encodeURIComponent('20220205'); /**/
			queryParams += '&' + encodeURIComponent('endCreateDt') + '=' + encodeURIComponent('20220210'); /**/
			xhr.open('GET', url + queryParams);
	
			// XML 파싱해서 데이터 가져오기
			xhr.onreadystatechange = function() {
				
			if (this.readyState == 4) {
				// alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
				let xmlFile = this.responseText;
				$('document').ready(function() {
						$.ajax({
							url : "covidchart.do",
							type : 'GET',
							success : function(data) {
							
							$(xmlFile).find("item").each(function() {
							var covidInfo = "지역명 : " + $(this).find("gubun").text() + "</br>"
										+ "확진자 수 : "+ $(this).find("defCnt").text() + "</br>"
										+ "사망자 수 : " + $(this).find("deathCnt").text() + "</br>"
										+ "격리해제 수: " + $(this).find("isolClearCnt").text() + "</br>"
										+ "전일대비 증감 수: " + $(this).find("incDec").text() + "</br>"
										+ "기준일시: " + $(this).find("stdDay").text() + "</br>";
										$('#chartdiv').append(covidInfo)
							})
						}, error : function(error) { //불러오지 못했을때
								//console.log('실패');
								alert('Error loading XML document');
							}
						});
					});
				}
			}
				xhr.send('');
	</script>
</head>

<body>
	<div style="width: 100%; padding: 20px; background-color: White; align: center;">
		<div class="main-panel" style="width: 1800px;">
			<div id="chartdiv"></div>
		</div>
	</div>
</body>
</html>