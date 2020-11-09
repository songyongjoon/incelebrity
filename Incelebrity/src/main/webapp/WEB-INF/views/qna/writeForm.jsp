<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			$(function(){
				
				//저장 버튼 클릭 시 처리 이벤트
				$("#qnaInsertBtn").click(function(){
					//공백 여부 체크
					if(!chkData("#b_name", "작성자를")) return;
					else if(!chkData("#qna_title", "글제목을")) return;
					else if(!chkData("#qna_content", "글내용을")) return;
					else if(!chkData("#qna_pwd", "비밀번호를")) return;
					else{
						$("#f_writeForm").attr({
							"method" : "post",//get 방식은 길이에 제한이 있으므로 post 방식을 쓴다.
							"action" : "/qna/qnaInsert"
						});
						$("#f_writeForm").submit();
					}
				});
				
				//취소 버튼 클릭 시 처리 이벤트
				$("#qnaCancelBtn").click(function(){
					$("#f_writeForm").each(function(){
						this.reset();
					});
				});
				
				//목록 버튼 클릭 시 처리 이벤트
				$("#qnaListBtn").click(function(){
					location.href="/qna/qnaList";
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
			<div class="text-center">
				<form id="f_writeForm" name="f_writeForm" class="form-horizontal">
					<table class="table table-bordered">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<td>작성자</td>
								<td class="text-left"><input type="text" name="qna_name" id="qna_name" class="form-control"></td>
							</tr>
							<tr>
								<td>글제목</td>
								<td class="text-left"><input type="text" name="qna_title" id="qna_title" class="form-control"></td>
							</tr>
							<tr>
								<td>글내용</td>
								<td class="text-left"><textarea name="qna_content" id="qna_content" class="form-control" rows="8"></textarea></td>
							</tr>
						</tbody>
					</table>
					
					<div class="text-right">
						<input type="button" value="저장" id="qnaInsertBtn" class="btn btn-success"/>
						<input type="button" value="취소" id="qnaCancelBtn" class="btn btn-success"/>
						<input type="button" value="목록" id="qnaListBtn" class="btn btn-success"/>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>