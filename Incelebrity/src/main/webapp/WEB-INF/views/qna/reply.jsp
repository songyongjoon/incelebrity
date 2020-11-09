<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
        <title>게시판 글 쓰기</title>
      <link rel="shortcut icon" href="/resources/image/icon.png" />
      <link rel="apple-touch-icon" href="/resources/image/icon.png" />
      
      <link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css"/>
      <link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.css"/>
      
      <script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <script type="text/javascript">
         var message = "작성시 입력한 비밀번호를 입력해 주세요.", btnKind="";
        
         
         $(function(){
        	
            /** 기본 덧글 목록 불러오기*/
            var qna_no = ${detail.qna_no};
            listAll(qna_no);
            
        
         
         //data-button 속성으로 모달창에서 등록버튼과 수정버튼 구분
         if(!$("#qnareplyInsertBtn").attr("data-button")){
            $("qnareplyInsertBtn").attr("data-button", "insertBtn");
         }
         
         //댓글 등록 버튼 클릭시 모달창 설정 작업
         $("#qnareplyInsertFormBtn").click(function() {
         setModal("댓글 등록", "insertBtn", "등록");
         dataReset();
         $('#replyModal').modal();
      });
         
         //글입력을 위한 Ajax 연동처리
         $(document).on("click", "button[data-button='insertBtn']", function(){
           var insertUrl = "/qnareplies/qnareplyInsert";
           //JSON.stringify(): JavaScript 값이나 객체를 JSON 문자열로 변환
           var value = JSON.stringify({
              qna_no:qna_no,
              qna_reply_name:$("#qna_reply_name").val(),
              qna_reply_content:$("#qna_reply_content").val()
           });
         
         
         $.ajax({
            url : insertUrl,    //전송 url
            type : "post",      //전송 시 method 방식
            headers : {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "POST"
            },
            dataType:"text",
            data : value,
            error : function() {      //실행시 오류가 발생하였을 경우
               alert('시스템 오류 입니다. 관리자에게 문의 하세요.');
         },
         beforeSend : function() {
            if(!checkForm("#qna_reply_name","작성자를"))   return false;
            else if (!checkForm("#qna_reply_content","댓글내용을"))   return false;         
            },
         success : function(result) {
            if(result=="SUCCESS"){
               alert("댓글 등록이 완료되었습니다.");
               dataReset();
               $('#replyModal').modal('hide');
               listAll(qna_no);
            }
         }
         });
         });
         
         $('button[data-dismiss="modal"]').click(function() {
          dataReset();
       });
        
         
         //수정 폼 화면 구현 함수
         function updateForm(qna_reply_no) {
         $.ajax({
            url : "/replies/"+qna_reply_no+".json",
            type : "get",
            dateType : "json",
            error : function() {
               alert('시스템 오류. 관리자에게 문의 하세요');
            },
            success : function (data) {
               $("#qna_reply_name").val(data.qna_reply_name);
               $("#qna_reply_content").val(data.qna_reply_content);
               
               var num_input = $("<input>");
               num_input.attr({"type":"hidden","name":"qna_reply_no"});
               num_input.val(qna_reply_no);
               $("#comment_form").append(num_input);
               
               setModal("댓글 수정", "updateBtn","수정");
               $('#replyModal').modal();
            }
         });
      }
         
          //글 삭제를 위한 Ajax 연동 처리
          function deleteBtn(b_num,r_num) {
         if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
            $.ajax({
               url : '/replies/'+qna_reply_no,
               type : 'delete',
               headers : {
                  "X-HTTP-Method-Override" : "DELETE"
               },
               dataType : 'text',
               error : function() {
                  alert('시스템 오류. 관리자에게 문의 하세요.');
               },
               success : function(result) {
                  console.log("result: " + result);
                  if(result == 'SUCCESS'){
                     alert("댓글 삭제가 완료되었습니다.");
                     listAll(qna_no);
                  }
               }
            });
         }
      }
         
         //수정을 위한 Ajax 연동 처리
         $(document).on("click","button[data-button='updateBtn']", function() {
            //console.log("수정버튼");
            var r_num = $("input[name='qna_reply_no']").val();
            if(!checkForm("#qna_reply_content","댓글내용을")) return;
            else{
               $.ajax({
                  url : '/replies/'+qna_reply_no,
                  type : 'put',
                  headers:{
                     "Content-Type" : "application/json",
                     "X-HTTP-Method-Override" : "PUT"},
                     data : JSON.stringify({
                        r_content:$("#qna_reply_content").val(),
                     }),
                     dataType:'text',
                     error : function() {
                        alert('시스템 오류. 관리자에게 문의 하세요');
                     },
                     success : function(result) {
                        console.log("result: " + result);
                        if(result == "SUCCESS"){
                           alert("댓글 수정이 완료되었습니다.")
                           dataReset();
                           $('#replyModal').modal('hide');
                           listAll(qna_no);
                        }
                     }
                  });   
               }
            });
            
         });      //최상위 $ 종료.

               
         /** 댓글 목록 보여주는 함수*/
         function listAll(qna_no){
            $("#reviewList").html("");
            var url = "/replies/all/"+qna_no+".json";
            
            $.getJSON(url, function(data){
               console.log("list count: "+data.length);
               
               replyCnt = data.length;
               $(data).each(function(){
                  var qna_no = this.qna_reply_no;
                  var qna_reply_name = this.qna_reply_name;
                  var qna_reply_content = this.qna_reply_content;
                  var qna_reply_writeday = this.qna_reply_writeday;
                  
                  addItem(qna_reply_no, qna_reply_name, qna_reply_content, qna_reply_writeday);
               });
            }).fail(function(){
               alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
            });
         }
      
      
         /** 새로운 글을 화면에 추가하기(보여주기) 위한 함수*/
         function addItem(qna_reply_no, qna_reply_name, qna_reply_content, qna_reply_writeday) {
            // 새로운 글이 추가될 div태그 객체
            var wrapper_div = $("<div>");
            wrapper_div.attr("data-num", qna_reply_no);
            wrapper_div.addClass("panel panel-default");
            
            var new_div = $("<div>");
            new_div.addClass("panel-heading");
   
            // 작성자 정보의 이름
            var name_span = $("<span>");
            name_span.addClass("name");
            name_span.html(qna_reply_name + "님");
   
            // 작성일시
            var date_span = $("<span>");
            date_span.html(" / " + r_date + " ");
   
            // 수정하기 버튼
            var upBtn = $("<button>");
            upBtn.attr({"type" : "button"});
            upBtn.attr("data-btn","upBtn");
            upBtn.addClass("btn btn-primary gap");
            upBtn.html("수정하기");
            
            
            // 삭제하기 버튼
            var delBtn = $("<button>");
            delBtn.attr({"type" : "button"});
            delBtn.attr("data-btn","delBtn");
            delBtn.addClass("btn btn-primary gap");
            delBtn.html("삭제하기");
            
            // 내용 
            var content_div = $("<div>");
            content_div.html(qna_reply_content);
            content_div.addClass("panel-body");
   
            // 조립하기
            new_div.append(name_span).append(date_span).append(upBtn).append(delBtn);
            wrapper_div.append(new_div).append(content_div);
            $("#reviewList").append(wrapper_div);
         }
         
         //입력 폼 초기화
         function dataReset() {
         $("#qna_reply_name").val("");
         $("#qna_reply_content").val("");
      }
         
         //모달창 초기화
         function setModal(title, value, text) {
         $("#replyModalLabel").html(title);
         $("#replyInsertBtn").attr("data-button", value);
         $("#replyInsertBtn").html(text);
      }
               </script>
   </head>
   <body>
      <div id="replyContainer">

   
         <%-- 등록 버튼 영역 --%>
         <p class="text-right">
            <button type="button" class="btn btn-primary" id="qnareplyInsertFormBtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">댓글 등록</button>
         </p>
         
         <%-- 리스트 영역 --%>
         <div id="reviewList"></div>
         
         <%-- 등록 화면 영역(modal) --%>
         <div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true">
           <div class="modal-dialog">
             <div class="modal-content">
               <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                 <h4 class="modal-title" id="replyModalLabel">댓글 등록</h4>
               </div>
               <div class="modal-body">
                 <form id="comment_form" name="comment_form">
                   <input type="hidden" name="qna_no" value="${detail.qna_no}"/>
                   <div class="form-group">
                     <label for="g_name" class="control-label">작성자</label>
                     <input type="text" class="form-control" name="qna_reply_name" id="qna_reply_name" maxlength="5"/>
                   </div>
                   <div class="form-group">
                     <label for="g_content" class="control-label">글내용</label>
                     <textarea class="form-control" name="qna_reply_content" id="qna_reply_content" rows="5"></textarea>
                   </div>
                 </form>
               </div>
               <div class="modal-footer">
                 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                 <button type="button" class="btn btn-primary" id="qnareplyInsertBtn">등록</button>
               </div>
             </div>
           </div>
         </div>
      </div>
   </body>
</html>