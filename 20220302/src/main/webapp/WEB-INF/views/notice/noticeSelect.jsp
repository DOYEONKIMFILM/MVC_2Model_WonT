<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice/noticeSelect.jsp</title>
</head>
<body>
   <div align="center">
      <div>
         <h1>게시글 상세내용</h1>
      </div>
      <c:choose>
         <c:when test="${empty notice.noticeId}">
            <h1>선택한 게시글이 존재하지 않습니다.</h1>
         </c:when>
         <c:otherwise>
            <div>
               <table border="1">
                  <tbody>
                     <tr>
                        <th>작성자</th>
                        <td>${notice.noticeWriter}</td>
                        <th>작성일자</th>
                        <td>${notice.noticeDate}</td>
                     </tr>
                     <tr>
                        <th>제목</th>
                        <td colspan="3">${notice.noticeTitle}</td>
                     </tr>
                     <tr>
                        <th>내용</th>
                        <td colspan="3">${notice.noticeSubject}</td>
                     </tr>
                     <tr>
                        <th>조회수</th>
                        <td colspan="3">${notice.noticeHit}</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </c:otherwise>
      </c:choose>
      <div>
         <button type="button" onclick="location.href='noticeList.do'">목록가기</button>
      </div>
   </div>
</body>
</html>