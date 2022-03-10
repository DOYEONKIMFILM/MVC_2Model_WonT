/**
 * 공지사항 리스트 가져오는 자바스크립트
 */

   		function aJaxCall(n) {
		
      		$.ajax({
		         url : "ajaxReplyInsert.do",
		         type : "post",
		         data : {'notice_id' : n,'replyId' : '홍길동', 'replyContents' : $('#replyContents').val() },
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
		   alert(data + '---------');
	       var button = "<button id='delete' onclick='deleteReply('" + data + "')'>삭제</button>";
	
	       var row = $("<tr>").append(
	                 $("<td width='400'>").text($("#replyContents").val()),
	                 $("<td align='center'>").append(button)   //삭제버튼을 추가
	                 );
	       $("#rtable").append(row);               
	       $("#replyContents").val(""); //input box 초기화
	   }
	   
	   function deleteReply(n){
		   let del = false;
		   
		   $.ajax({
			   url: "ajaxReplyDelete.do",
			   type: "post",
			   data: {"replyNo" : n},
			   async: false,	//동기화
			   dataType: "text",
			   success: function(result){
				   console.log(result);
				   if(result.length>0){
					   del=true;
				   }
			   },
			   error: function(err){
				   console.log(err);
			   }
		   });
		   if(del){
			   $(event.target).parent().parent().remove();
		   } else{
			   alert(del + "삭제 실패!");
		   }
	   }
 