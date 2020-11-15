<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
  		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
  		<title>ê²ìí ê¸ ì°ê¸°</title>
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
				$("#noticeUpdateBtn").click(function(){
					if(!chkData("#notice_title", "제목을")) return;
					else if(!chkData("#notice_content", "작성할 내용을")) return;
					else{
						$("#f_updateForm").attr({
							"method" : "post",
							"action" : "/adminnotice/adminNoticeUpdate"
						});
						$("#f_updateForm").submit();	
					}
				});
				
				$("#noticeCancelBtn").click(function(){
					$("#f_updateForm").each(function(){
						this.reset();
					});
				});
			
				$("#noticeListBtn").click(function(){
					location.href="/adminnotice/adminNoticeList";
				});
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTB text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="notice_no" name="notice_no" value="${updateData.notice_no}"/>
					
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
								<td class="text-left">${updateData.notice_no}</td>
								<td>작성일</td>
								<td class="text-left">${updateData.notice_writeday}</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td colspan="3" class="text-left">
									<input type="text" name="notice_title" id="notice_title" value="${updateData.notice_title}" class="form-control"/>
								</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="3" class="text-left">${updateData.notice_name}</td>
							</tr>
							<tr class="table-height">
								<td>내용</td>
								<td colspan="3" class="text-left">
									<textarea name="notice_content" id="notice_content" class="form-control" rows="8">${updateData.notice_content}</textarea>
								</td>
							</tr>

						</tbody>
					</table>
				</form>
			</div>
			
			<div class="contentBtn text-right">
				<input type="button" value="수정" id="noticeUpdateBtn" class="btn btn-success"/>
				<input type="button" value="취소" id="noticeCancelBtn" class="btn btn-success"/>
				<input type="button" value="등록" id="noticeListBtn" class="btn btn-success"/>
			</div>
		</div>
	</body>
</html>