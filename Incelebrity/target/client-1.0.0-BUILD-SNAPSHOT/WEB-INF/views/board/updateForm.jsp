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
			$(function(){
				//수정 버튼 클릭 시 처리 이벤트
				$("#boardUpdateBtn").click(function(){
					//입력값 체크
					if(!chkData("#b_title", "제목을")) return;
					else if(!chkData("#b_content", "작성할 내용을")) return;
					else{
						$("#f_updateForm").attr({
							"method" : "post",
							"action" : "/board/boardUpdate"
						});
						$("#f_updateForm").submit();	
					}
				});
				
				//취소 버튼 클릭 시 처리 이벤트
				$("#boardCancelBtn").click(function(){
					$("#f_updateForm").each(function(){
						this.reset();
					});
				});
				
				//목록 버튼 클릭 시 처리 이벤트
				$("#boardListBtn").click(function(){
					location.href="/board/boardList";
				});
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTB text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="b_num" name="b_num" value="${updateData.b_num}"/>
					
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
								<td class="text-left">${updateData.b_num}</td>
								<td>작성일</td>
								<td class="text-left">${updateData.b_date}</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td colspan="3" class="text-left">
									<input type="text" name="b_title" id="b_title" value="${updateData.b_title}" class="form-control"/>
								</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="3" class="text-left">${updateData.b_name}</td>
							</tr>
							<tr class="table-height">
								<td>내용</td>
								<td colspan="3" class="text-left">
									<textarea name="b_content" id="b_content" class="form-control" rows="8">${updateData.b_content}</textarea>
								</td>
							</tr>
							<tr class="form-inline">
								<td>비밀번호</td>
								<td colspan="3" class="text-left">
									<input type="password" name="b_pwd" id="b_pwd" class="form-control" maxlength="20"/>
									<label>수정할 비밀번호를 입력해 주세요.</label>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			
			<div class="contentBtn text-right">
				<input type="button" value="수정" id="boardUpdateBtn" class="btn btn-success"/>
				<input type="button" value="취소" id="boardCancelBtn" class="btn btn-success"/>
				<input type="button" value="등록" id="boardListBtn" class="btn btn-success"/>
			</div>
		</div>
	</body>
</html>