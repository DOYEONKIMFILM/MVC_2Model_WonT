<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<div class="container mt-3">
		<div>
			<h3>게시글 목록</h3><br>
		</div>
		<div class="col-3">
		<div class="input-group mb-2">
			<select name="key" id="key" class="btn btn-outline-secondary">
				<option value="전체">전체</option>
				<option value="작성자">작성자</option>
				<option value="제목">제목</option>
			</select> &nbsp;
			<input type="text" size="5" name="val" id="val" class="form-control" aria-label="Text input with dropdown button">
			&nbsp;
			<button type="button" onclick="SearchList()"
				class="btn btn-outline-secondary">검색</button>
			</div>
			<!-- 			<form>
				<table>
					<tr>
						<td width="640">
						<select name="key" id="key" >
								<option value="전체" selected="selected">전체</option>
								<option value="작성자">작성자</option>
								<option value="제목">제목</option>
						</select>&nbsp;
							<input type="text" id="val" name="val" size="10">&nbsp;
							<button type="button" onclick="searchList()">검색</button></td>
					</tr>
				</table>
			</form> -->
			<!-- contenteditable="true" 바로 테이블안에서 수정이가능하다 -->
		</div>
		<div>
			<table class="table table-hover" id="contents">
				<thead>
					<tr>
						<th width="70"><span style="color:blue" onclick="listSort('No',1)">A </span>순번
							<span style="color:red" onclick="listSort('No',2)">D</span>
						</th>
						<th width="100">작성자</th>
						<th width="300" id="title" data-sort="Asc" onclick="togleSort('Title')">제목</th>
						<th width="100">작성일자</th>
						<th width="70">조회수</th>
					</tr>
				</thead>
				<tbody id="body">
					<%-- 밑부분 아작스로 호출
					 <c:forEach items="${notices}" var="notice">
						<tr onclick="searchNotice('${notice.noticeId}')">
							<td align="center">${notice.noticeId}</td>
							<td align="center">${notice.noticeWriter}</td>
							<td>${notice.noticeTitle}</td>
							<td align="center">${notice.noticeDate}</td>
							<td align="center">${notice.noticeHit}</td>
						</tr>
					</c:forEach> --%>
				</tbody>
			</table>
			<div>
				<form id="frm" action="noticeSelect.do" method="post">
					<input type="hidden" id="noticeId" name="noticeId">
				</form>
			</div>
		</div>
	</div>

	<script>
		function searchNotice(id) {
			document.forms.frm.noticeId.value = id;
			document.forms.frm.submit();
		}

		function searchList() {
			$.ajax({
				url : "ajaxNoticeSearch.do",
				type : "post",
				data : {
					"key" : $("#key").val(),
					"val" : $("#val").val()
				},
				dataType : "json",
				success : function(result) {
					if (result.length > 0) {
						console.log(result);
						/* $("#body").remove(); */
						jsonHtmlConvert(result);
					}
				},
				error : function(err) {
					console.log(err);
				}
			});
		}

		function jsonHtmlConvert(result) {
			var tb = $("#body");
			$("#body").empty();
			
			
			$.each(result, function(index, item) {
				var tr = $("<tr />").attr({
					'onclick' : 'searchNotice(' + item.noticeId + ')'
				}).append($("<td />").text(item.noticeId),
						$("<td />").text(item.noticeWriter),
						$("<td />").text(item.noticeTitle),
						$("<td />").text(item.noticeDate),
						$("<td />").text(item.noticeHit));
				tb.append(tr);
			});
			$("#contents").append(tb);
		}
		
		
		function listSort(key, val) {	//리스트 소트(정렬)
			$.ajax({
				url : "ajaxNoticeSort.do",
				type : "post",
				data : {"key" : key, "val" : val},
				dataType : "json",
				success : function(result) {
					if (result.length > 0) {
						jsonHtmlConvert(result);
					}
				}
			});
		}
		
		function togleSort(str) {
			var val = 0;
			if($('#title').data('sort') == 'Asc') {	//현재 토글 값 검색
				val = 1;
			} else {
				val = 2;
			}
			listSort(str, val);	//처리 메소드 호출
			
	/* 처리메소드 호출 	
			$.ajax({
				url : "ajaxNoticeSort.do",
				type : "post",
				data : {"key" : str, "val" : val},
				dataType : "json",
				success : function(result) {
					if (result.length > 0) {
						jsonHtmlConvert(result);
					}
				}
			});  */
			
			if(val == 1) {	//처리 후 토글 값 변경
				$('#title').data('sort', 'Desc');
			} else {
				('#title').data('sort', 'Asc');
			}
			
		}
		
		/* 매개변수를 담을떄
		function searchNotice(id){
			$.ajax ({
				url : "ajaxtest.do",
				data : {"noticeId" : id },
				dataType : "json",
				type : ,
				success : function(result) {
					console.log(result);
				}
		} */
		
		/* 전체조회 */
		$.ajax ({
			url : "ajaxtest.do",
			dataType : "json",
			type : "post",
			success : function(aa) {
				console.log(aa);
				
				ajaxList(aa);
			}
		});
		
		function ajaxList(aa) {
			$.each(aa, function(idx, item){
				let tr = $("<tr>");
				
				tr.attr({
					"onmouseover" : "this.style.background = 'yellow'",
					"onmouseleave" : "this.style.background = ''",
					"onclick" : "searchNotice('" + item.noticeId + "')"
				}).append(
						$("<td align='center'>").text(item.noticeId),
						$("<td align='center'>").text(item.noticeWriter),
						$("<td align='center'>").text(item.noticeTitle),
						$("<td align='center'>").text(item.noticeDate),
						$("<td align='center'>").text(item.noticeHit)
				);
				
				$("#body").append(tr);
				
				
			});
			
	
			
		}
		
	</script>
</body>
</html>