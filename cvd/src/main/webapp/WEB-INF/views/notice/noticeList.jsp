<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>notice</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

</head>
<body class="sub_page">
	<div class="container-fluid pt-4 px-4">
		<div class="row g-4">
			<div class="col-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">공지사항</h6>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">제목</th>
                                            <th scope="col">작성일자</th>
                                            <th scope="col">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${notice }" var="notice">
										<tr onmouseover='this.style.background="#CCFFCC";'
											onmouseleave='this.style.background="white";'
											onclick="noticeSelect(${notice.noticeId})">
											<td align="center">${notice.noticeId }</td>
											<td align="center">${notice.noticeTitle }</td>
											<td align="center">${notice.noticeDate }</td>
											<td align="center">${notice.noticeHit }</td>
										</tr>
									</c:forEach>
                                    </tbody>
                                </table>
                            </div><br>
                            <div>
								<c:if test="${authority == 'ADMIN' }">
								<button type="button" onclick="location.href='noticeWriteForm.do'">글쓰기</button>
								</c:if>
							</div>
							<div>
								<form id="frm" action="noticeSelect.do" method="post">
									<input type="hidden" id="noticeId" name="noticeId">	<!-- id=자바스크립트변수, name=자바에서쓰기위한변수 -->
								</form>
							</div>
								<script type="text/javascript">
									function noticeSelect(id) {	//선택된 행의 세부내역을 보기 위한 함수
										frm.noticeId.value = id;
										frm.submit();	//noticeSelect.do 로 이동
									}
								</script>
							</div> 
                        </div>
                    </div>
                </div>
            </div>
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