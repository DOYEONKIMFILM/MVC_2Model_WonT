<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
$(document).ready(function () {
    $.ajax({
        url: "datatest.jsp",
        type: 'GET',
        dataType: 'xml',
        success: function (response) {
            xmlParsing(response);
        },
        error: function (xhr, status, msg) {
            console.log('상태값: ' + status + 'Http 에러메시지: ' + msg);
        },
    });

    function xmlParsing(data) {
        var infoList = ``;
        $(data).find('row').each(function (index, item) {
            infoList += `
                    <tr>
                        <td>${$(this).find('gubun').text()}</td>
                        <td>${$(this).find('defCnt').text()}</td>
                        <td>${$(this).find('deathCnt').text()}</td>
                        <td>${$(this).find('stdDay').text()}</td>
                    </tr>
            `;
            $('#info').empty().append(infoList);
            $('tr:first').css('background', 'darkgray').css('color', 'white')
        });

    }

});
</script>
</head>

<body>
	<h2>공공데이터 xml 테스트</h2>
	<table>
		<tr>
			<th>지역</th>
			<th>확진자수</th>
			<th>사망자수</th>
			<th>기준일</th>
		</tr>
		<tbody id="info"></tbody>
	</table>
</body>
</html>