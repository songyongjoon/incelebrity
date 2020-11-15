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
			var butChk = 0;//수정버튼과 삭제버튼을 구별하기 위한 변수
			$(function(){
				$("#pwdChk").css("visibility", "hidden");
				
				//수정 버튼 클릭 시 처리 이벤트
				$("#updateFormBtn").click(function(){
					$("#pwdChk").css("visibility", "visible");
					$("#msg").text("작성 시 입력한 비밀번호를 입력해 주세요").css("color", "#000099");
					butChk=1;
				});
				
				/*삭제 버튼 클릭 시 처리 이벤트
				$("#boardDeleteBtn").click(function(){
					$("#pwdChk").css("visibility", "visible");
					$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "#000099");
					butChk=2;
				})*/
				
				//삭제버튼 클릭시 댓글 확인 후 처리 이벤트
				$("#boardDeleteBtn").click(function() {
					$.ajax({
						url : "/board/replyCnt",
						type : "post",
						data : "b_num="+$("#b_num").val(),
						dataType : "text",
						error : function() {
							alert('시스템 오류. 관리자에게 문의 하세요.');
						},
						success : function(resultData) {
							if(resultData==0){
								$("#pwdChk").css("visibility","visible");
								$("msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "#000099");
								butChk = 2;
							}else{
								alert("댓글 존재시 게시물 작성할 수가 없습니다. \n댓글 삭제 후 다시 확인해 주세요.");
								return;
							}
						}
					});
				});
				
				//비밀번호 입력 양식 enter 제거
				$("#b_pwd").bind("keydown", function(event){
					if(event.keyCode === 13){
						event.preventDefault();
					}
				});
				
				//비밀번호 확인 버튼 클릭 시 처리 이벤트
				$("#pwdBtn").click(function(){
					boardPwdConfirm();
				});
					
				//글쓰기 버튼 클릭 시 처리 이벤트
				$("#insertFormBtn").click(function(){
					location.href = "/board/writeForm";
				});
				
				//목록 버튼 클릭 시 처리 이벤트
				$("#boardListBtn").click(function(){
					location.href="/board/boardList";
				});
			});
			
			function boardPwdConfirm(){
				if(!chkData("#b_pwd", "비밀번호를")) return;
				else{
					$.ajax({
						url : "/board/pwdConfirm", 			//전송 url
						type : "post",						//전송 시 method 방식
						data : $("#f_pwd").serialize(),		//폼 전체 데이터 전송
						dataType : "text",		
						error : function(){					//실행 시 오류가 발생하였을 경우
							alert('시스템 오류입니다. 관리자에게 문의하세요.')
						},									//정상적으로 실행이 되었을 경우
						success : function(resultData){
							var goUrl = "";					//이동할 경로를 지정할 변수
							if(resultData=="실패"){			//일치하지 않는 경우
								$("#msg").text("작성 시 입력한 비밀번호가 일치하지 않습니다.").css("color", "red");
								$("#b_pwd").select();
							
							}
							else if(resultData=="성공"){		//일치할 경우
								$("#msg").text("");
								if(butChk==1){				//수정 버튼 클릭 시
									goUrl = "/board/updateForm";
								}
								else if(butChk==2){			//삭제 버튼 클릭 시
									goUrl = "/board/boardDelete";
								}
								$("#f_data").attr("action", goUrl);
								$("#f_data").submit();
							}
						}
					});	
				}
			}
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<colgroup>
						<col width="17%"/>
						<col width="33%"/>
						<col width="17%"/>
						<col width="33%"/>
					</colgroup>
					<tbody>
						<tr>
							<td>글번호</td>
							<td class="text-left">${detail.b_num}</td>
							<td>작성일</td>
							<td class="text-left">${detail.b_date}</td>
						</tr>
						<tr>
							<td>글제목</td>
							<td class="text-left" colspan="3">${detail.b_title}</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td class="text-left" colspan="3">${detail.b_name}</td>
						</tr>
						<tr class="table-height">
							<td>글내용</td>
							<td class="text-left" colspan="3">${detail.b_content}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="b_num" value="${detail.b_num}"/>
		</form>
		
		<!-- 비밀번호 확인 버튼 및 버튼 추가 시작 -->
		<div id="boardPwdBut" class="row text-center">
			<div id="pwdChk" class="authArea col-md-8 text-left">
				<form name="f_pwd" id="f_pwd" class="form-inline">
					<input type="hidden" name="b_num" id="b_num" value="${detail.b_num}"/>
					<label for="b_pwd" id="l_pwd">비밀번호: </label>
					<input type="password" name="b_pwd" id="b_pwd" class="form-control"/>
					
					<button type="button" id="pwdBtn" class="btn btn-default">확인</button>
					<span id="msg"></span>
				</form>
			</div>
		</div>
		<div class="text-right">
			<input type="button" value="글수정" id="updateFormBtn" class="btn btn-success"/>
			<input type="button" value="글삭제" id="boardDeleteBtn" class="btn btn-success"/>
			<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success"/>
			<input type="button" value="목록" id="boardListBtn" class="btn btn-success"/>
		</div>
		<jsp:include page="reply.jsp" />
	</body>
</html>