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
				<h4>코로나19 지역별 확진자</h4>
				<p>Chart information is the number of COVID-19 confirmed cases by region in Korea</p>
				<hr>
				<div id="chartdiv"></div>
			</div>
			<canvas id="bar-chart" width="600" height="200"></canvas><br></div>
			<hr>
			 <section class="about_section layout_padding">
    <div class="container  ">
      <div class="row">
        <div class="col-md-6 ">
          <div class="img-box">
            <img src="images/about-img.PNG" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
                코로나19 백신 3차접종 <span>안내문</span>
              </h2>
            </div>
            <p>
              2차 접종 후 시간이 경과함에 따라 백신효과는 감소하고 돌파 감염이 증가하고 있으며,
              3차접종의 예방효과는 과학적으로 증명되고 있습니다.<br>
              
              18세이상 전 국민은 2차접종 3개월 후 부터 3차접종이 가능합니다.<br>
              <br>
              질병관리청 예방접종사전예약시스템으로 예약하시거나 보건소(053-979-8282~8285), 시청, 읍사무에서도 예약이 가능합니다.
              또한 잔여백신(네이버, 카카오톡)을 검색하여 당일 예약 및 접종도 가능합니다.
            </p>
            <a href="noticeList.do">
              더보기
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>

		</div>
	</div>
</body>
</html>