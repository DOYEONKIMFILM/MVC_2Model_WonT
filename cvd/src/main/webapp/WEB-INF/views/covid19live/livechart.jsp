<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>



<script>
let data = '';
const titles = ['지역명', '확진자수', '사망자수'];
const fields = ['gubun', 'defCnt', 'deathCnt'];

//<thead>
function makeHead() {
	let thd = document.createElement('thead');
	let tr = document.createElement('tr')
	
	// 배열 갯수만큼 만들어주는 필드영역
	titles.forEach(function(field) {
		let th = document.createElement('th')
		let text = document.createTextNode(field);
		th.appendChild(text);
		tr.appendChild(th);
	});
	thd.appendChild(tr);
	return thd;
}

function makeBody() {
	let tbd = document.createElement('tbody');
	data.forEach(function(obj) {
		tbd.appendChild(makeTr(obj));
	});
	return tbd;
}

//tr 생성
function makeTr(item) {
	let tr = document.createElement('tr');
	
	// 데이터 영역
	for (let field of fields) {
		let td = document.createElement('td');
		let text = document.createTextNode(item[field]);
		td.appendChild(text);
		tr.appendChild(td);
	}
	return tr;
}
(function() {
	// Ajax 호출
	var xhr = new XMLHttpRequest();
		var url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'cPxVAevbvzOS3Sb3NJOODLtLTflfaVUO1Aw922Wwz3HhvL8iwd1v6bRrkbBNyY1x1RQTINgW0dgsmOq1aHkaCA%3D%3D'; /*Service Key*/
			queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
			queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
			queryParams += '&' + encodeURIComponent('startCreateDt') + '=' + encodeURIComponent('20220205'); /**/
			queryParams += '&' + encodeURIComponent('endCreateDt') + '=' + encodeURIComponent('20220210'); /**/
			xhr.open('GET', url + queryParams);
			
			xhr.onreadystatechange = function() {
				
			}
		if (this.readyState == 4) {
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
						},	

			let tbl = document.createElement('table');
			tbl.setAttribute('border', '1');
			tbl.appendChild(makeHead());
			tbl.appendChild(makeBody());
			document.getElementById('list').appendChild(tbl);

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