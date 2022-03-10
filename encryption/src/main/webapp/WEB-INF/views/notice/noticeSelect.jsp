<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="resources/js/jquery.min.js"></script>
</head>
<body>
   <div class="container mt-3">
      <div>
         <h2>게시글 상세</h2><br>
         <hr>
      </div>
      <div>
         <table class="table table-hover">
            <tr>
               <th width="100">작성자</th>
               <td width="150" align="center">${notice.noticeWriter }</td>
               <th width="100">작성일자</th>
               <td width="150" align="center">${notice.noticeDate }</td>
               <th width="70">조회수</th>
               <td width="50" align="center">${notice.noticeHit }</td>
            </tr>
            <tr>
               <th>제목</th>
               <td colspan="5">${notice.noticeTitle }</td>
            </tr>
            <tr>
               <th>내용</th>
               <td colspan="5">
                  <textarea rows="7" cols="155">${notice.noticeSubject }</textarea>
               </td>
            </tr>
         </table>
      </div>
      <br>
      <div id="wrap">
         <table border="1" id="rtable" class="table table-hover">
            <c:if test="${not empty replys}">
               <c:forEach items="${replys}" var="reply" varStatus="status">
                  <tr id="delId">
                     <td width="320">${reply.replyContents }</td>
                     <td width="50" align="center">
                        <button type="button" class="btn btn-dark" onclick="deleteReply(${reply.replyNo})">삭제</button>
                     </td>
                  </tr>
               </c:forEach>
            </c:if>
         </table>
      </div>
      <div align="center">
         <form id="frm">
            <input type="text" id="replyContents" size="50">&nbsp;&nbsp;
            <button type="button" class="btn btn-dark" onclick="aJaxCall(${notice.noticeId})">등록</button>
         </form>
      </div>
   </div>
   
   <!-- <script src="resources/js/noticeSelect.js"></script> -->
   <script type="text/javascript">
   function aJaxCall(n) {
       $.ajax({
          url : "ajaxReplyInsert.do",
          type : "post",
          data : {'notice_id' : n, 'replyId' : '홍기리기리', 'replyContents' : $('#replyContents').val() },
          dataType : "text",
          success : function(data){
             if(data.length > 0) {
                if($('#wrap').children().length == 0){
                         $('#wrap').append($('<table id="rtable" border="1">'));
                      }
                htmlConvert(data);
                
          }
       }
    });
    }
    function htmlConvert(data) {
       var button = "<button id='delete' class='btn btn-dark' onclick='deleteReply("+data+")'>삭제</button>";

       var row = $("<tr>").append(
             $("<td width='400'>").text($("#replyContents").val()),
             $("<td align='center'>").append(button)   //삭제버튼 추가
             );
       $("#rtable").append(row);               
       $("#replyContents").val(""); //input box 초기화
    }
    
    function deleteReply(n){
       //var del = false;
       var replyNo = n;
       var btn = $(event.target).parent().parent();
       $.ajax({
          url : "ajaxReplyDelete.do",
          type : "post",
          data : {"replyNo" : replyNo},
          //async : false,
          dataType : "text",
          success : function(data) {
             if(data.length > 0){
                btn.remove();
                //del = true;
             }
          }
       });
       /* if(del){
          
       }else {
          alert(del+"삭제실패")
       } */
       
       
         //event.target.parentElement.parenElement.remove();
    } 
   </script>
</body>
</html>