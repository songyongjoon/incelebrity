<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/image/icon.png"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="stylesheet"
	href="/resources/include/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/include/dist/css/bootstrap-theme.min.css">
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script
	src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
<script
   src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script>
$(function() {
	/* 기본 덧글 목록 불러오기 */
	var review_no = ${detail.review_no};
	listAll(review_no);

	/* data-button 속성으로 모달창에서 등록, 수정 버튼 구분 */
	if (!$("#replyInsertBtn").attr("data-button")) {
		$("#replyInsertBtn").attr("data-button", "insertBtn");
	}

	/* 댓글 등록 버튼 클릭 시 보달창 설정 작업*/
	$("#replyInsertFormBtn").click(function() {
		setModal("댓글 등록", "insertBtn", "등록");
		dataReset();
		$('#replyModal').modal();
	});

	/* 글입력을 위한 Ajax 연동 처리 */
	$(document).on("click", "button[data-button='insertBtn']", function() {
		var insertUrl = "/reviewReply/replyInsert";
		/* JSON.stringify(): JavaScript 값이나 객체를 JSON 문자열로 변환*/
		var value = JSON.stringify({
			review_no : review_no,
			review_reply_name : $("#review_reply_name").val(),
			review_reply_content : $("#review_reply_content").val()
		});

		$.ajax({
			url : insertUrl, // 전송 url
			type : "post", //전송 시 method 방식
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : value,
			error : function() {
				alert("관리자 문의");
			},
			/*beforeSend : function() {
				if (!chkForm("#r_name", "작성자를")) return false;
				else if (!chkForm("#r_content", "댓글내용을")) return false;
				else if (!chkForm("#r_pwd", "비밀번호를")) return false;
			},*/
			success : function(result) {
				if (result == "SUCCESS") {
					alert("등록 완료");
					dataReset();
					$('#replyModal').modal('hide');
					listAll(review_no);
				}
			}

		});
	});
	$('button[data-dismiss="modal"]').click(function(){
		dataReset();
	});
	
	
	
	/* 수정 폼 화면 구현 함수*/
	function updateForm(review_reply_no){
		$.ajax({
			url:"/reviewReply/"+review_reply_no+".json",
			type:"get",
			dataType:"json",
			error:function(){
				alert('시스템 오류, 관리자 문의');
			},
			success:function(data){
				$("#review_reply_name").val(data.review_reply_name);
				$("#review_reply_content").val(data.review_reply_content);
				
				var num_input = $("<input>");
				num_input.attr({"type":"hidden","name":"review_reply_no"});
				num_input.val(review_reply_no);
				$("#comment_form").append(num_input);
				
				setModal("댓글 수정", "updateBtn", "수정");
				$('#replyModal').modal();
			}
		});
	}
	
	/* 글 삭제를 위한 Ajax 연동 처리*/
	function deleteBtn(review_no, review_reply_no){
		if(confirm("선택하신 댓글을 삭제?")){
			$.ajax({
				url:'/reviewReply/'+review_reply_no,
				type:'delete',
				headers:{
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType:'text',
				error:function(){
					alert('시스템 오류, 관ㄹ리자 문의');
				},
				success:function(result){
					console.log("result:" + result);
					if(result == 'SUCCESS'){
						alert("댓삭왈료");
						listAll(review_no)
					}
				}
			});
		}
	}
	
	/* 수정 및 삭제 전 비밀번호 화면 출력 처리
	$(document).on("click","button[data-btn]", function(){
		$(".btn").parents("div.panel .panel-heading .pwdArea").remove();
		$(this).parents("div.panel .panel-heading").append(pwdView());
		btnKind = $(this).attr("data-btn");
		console.log("클릭 버튼 btnKind:" + btnKind);
	});*/
	
	/* 수정을 위한 Ajax 연동 처리*/
	$(document).on("click", "button[data-button='updateBtn']", function(){
		var review_reply_no = $("input[name='review_reply_no']").val();
		if(!chkForm("#review_reply_content","댓글내용을")) return;
		else{
			$.ajax({
				url:'/reviewReply/'+review_reply_no,
				type:'put',
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"PUT"
				},
				data:JSON.stringify({
					review_reply_content:$("#review_reply_content").val(),
				}),
				dataType:'text',
				error:function(){
					alert('오류,관ㄹ지마ㅜㄴ의');
				},
				success:function(result){
					console.log("result"+ result);
					if(result == "SUCCESS"){
						alert("댓글 수정이 완료");
						dataReset();
						$('#replyModal').modal('hide');
						listAll(review_no);
					}
				}
			});
		}
	});
});

/* 덧글 목록 조회 함수 */
function listAll(review_no) {
	$("#reviewList").html("");
	var url = "/reviewReply/all/" + review_no + ".json";

	$.getJSON(url, function(data) {
		console.log("list count:" + data.length);

		//replyCnt = data.length;
		$(data).each(function() {
			var review_reply_no = this.review_reply_no;
			var review_reply_name = this.review_reply_name;
			var review_reply_content = this.review_reply_content;
			var review_reply_writeday = this.review_reply_writeday;

			addItem(review_reply_no, review_reply_name, review_reply_content, review_reply_writeday);
		});
	}).fail(function() {
		alert("덧글 목록 호출 실패");
	});
}

/** 새로운 글을 화면에 추가하기(보여주기) 위한 함수*/
function addItem(review_reply_no, review_reply_name, review_reply_content, review_reply_writeday) {
	// 새로운 글이 추가될 div태그 객체
	var wrapper_div = $("<div>");
	wrapper_div.attr("data-num", review_reply_no);
	wrapper_div.addClass("panel panel-default");

	var new_div = $("<div>");
	new_div.addClass("panel-heading");

	// 작성자 정보의 이름
	var name_span = $("<span>");
	name_span.addClass("name");
	name_span.html(review_reply_name + "님");

	// 작성일시
	var date_span = $("<span>");
	date_span.html(" / " + review_reply_writeday+ " ");

	// 수정하기 버튼
	var upBtn = $("<button>");
	upBtn.attr({
		"type" : "button"
	});
	upBtn.attr("data-btn", "upBtn");
	upBtn.addClass("btn btn-success gap");
	upBtn.html("수정하기");

	// 삭제하기 버튼
	var delBtn = $("<button>");
	delBtn.attr({
		"type" : "button"
	});
	delBtn.attr("data-btn", "delBtn");
	delBtn.addClass("btn btn-success gap");
	delBtn.html("삭제하기");

	// 내용 
	var content_div = $("<div>");
	content_div.html(review_reply_content);
	content_div.addClass("panel-body");

	// 조립하기
	new_div.append(name_span).append(date_span).append(upBtn).append(delBtn);
	wrapper_div.append(new_div).append(content_div);
	$("#reviewList").append(wrapper_div);
}

/* 입력 폼 초기화*/
function dataReset() {
	$("#review_reply_name").val("");
	$("#review_reply_content").val("");
}

/* 모달창 초기화 */
function setModal(title, value, text) {
	$("#replyModalLabel").html(title);
	$("#replyInsertBtn").attr("data-button", value);
	$("#replyInsertBtn").html(text);

}
/* 비밀번호 체크를 위한 동적 화면 구현
function pwdView(){
	var span=$("<span>");
	span.addClass("pwdArea");
	
	var pwd_form = $("<form>");
	pwd_form.attr("name","f_pwd");
	pwd_form.addClass("form-inline inline");
	
	var pwd_label = $("<label>");
	pwd_label.attr("for", "passwd");
	pwd_label.html("비밀번호 : ");
	
	var pwd_input = $("<input>");
	pwd_input.attr({"type" : "password","name" : "passwd"});
	pwd_input.addClass("form-control passwd gap");
	pwd_input.prop("autofocus", "autofocus");
	
	var pwd_check = $("<input>");
	pwd_check.attr({"type":"button","value":"확인"});
	pwd_check.addClass("btn btn-default pwdCheckBut gap");
	
	var pwd_reset = $("<input>");
	pwd_reset.attr({"type":"button","value":"취소"});
	pwd_reset.addClass("btn btn-default pwdResetBut gap");
	
	var pwd_span = $("<span>");
	pwd_span.addClass("msg");
	pwd_span.html(message);
	
	pwd_form.append(pwd_label).append(pwd_input).append(pwd_check).append(pwd_reset).append(pwd_span);
	return span.append(pwd_form);
}*/
</script>
<style>
	#reviewList{
		padding-bottom: 100px;
	}
</style>
</head>
<body>
<div id="replyContainer">
		<%--등록버튼 영역 --%>
		<p class="text-right">
			<button type="button" class="btn btn-success" id="replyInsertFormBtn">
				댓글 등록</button>
			<!--  data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" -->

		</p>
		<!-- 리스트 영역 -->
		<div id="reviewList"></div>

		<!-- 등록화면 영역 -->
		<div class="modal fade" id="replyModal" tabindex="-1" role="dialog"
			aria-labelledby="replyModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="replyModalLabel">댓글 등록</h4>
					</div>
					<div class="modal-body">
						<form id="comment_form" name="comment_form">
							<input type="hidden" name="review_no" maxlength="5" value="${detail.review_no }"/>
							<div class="form-group">
								<label for="review_name" class="control-label">작성자</label> 
								<input type="text" class="form-control" id="review_reply_name" name="review_reply_name"	maxlength="20" />
							</div>
							<div class="form-group">
								<label for="review_content" class="control-label">글내용</label>
								<textarea class="form-control" id="review_reply_content" name="review_reply_content" rows="30"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-success" id="replyInsertBtn">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>