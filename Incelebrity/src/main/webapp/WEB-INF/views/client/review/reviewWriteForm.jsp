<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/resources/image/icon.png" />
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
		$("#boardListBtn").click(function() {
			location.href = "/review/reviewList";
		});

		$("#boardInsertBtn").click(function() {
			if (!chkData("#review_title", "제목을"))
				return;
			else if (!chkData("#review_name", "이름을"))
				return;
			else if (!chkData("#review_content", "내용을"))
				return;
			else {
				$("#f_writeForm").attr({
					"method" : "post",
					"action" : "/review/reviewInsert"
				});
			}
			$("#f_writeForm").submit();
		});

		$("#boardCancelBtn").click(function() {
			$("#f_writeForm").each(function() {
				this.reset();

			});
		});
	});
</script>
<style type="text/css">
	#btns{
		padding-bottom: 100px;
	}
</style>
</head>
<body>
	<form enctype="multipart/form-data" class="form-horizontal" id="f_writeForm">
		<div class="form-group">
			<label for="inputTitle" class="col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="review_title" name="review_title" placeholder="제목" maxlength="20">
			</div>
		</div>
		<div class="form-group">
			<label for="inputName" class="col-sm-2 control-label">작성자</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="review_name" name="review_name" placeholder="작성자" maxlength="10" />
			</div>
		</div>
		<div class="form-group">
			<label for="inputName" class="col-sm-2 control-label">평점</label>
			<div class="col-sm-10">
				<select class="form-control" id="review_point" name="review_point">
					<option value="★☆☆☆☆"> ★☆☆☆☆</option>
					<option value="★★☆☆☆"> ★★☆☆☆</option>
					<option value="★★★☆☆"> ★★★☆☆</option>
					<option value="★★★★☆"> ★★★★☆</option>
					<option value="★★★★★"> ★★★★★</option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputContent" class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
				<textarea style="resize: none" class="form-control" cols="128" rows="10" id="review_content" name="review_content" maxlength="50"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="file">첨부파일</label>
			<input type="file" name="file"/>
		</div>
		<!-- <div class="form-group">
			<label for="inputPasswd" class="col-sm-2 control-label">이미지
				첨부</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="b_pwd" name="b_pwd"	placeholder="비밀번호" maxlength="20">
			</div>
		</div> -->
		<div class="form-group" id="btns">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="button" class="btn btn-default" id="boardInsertBtn" value="저장" /> 
				<input type="button" class="btn btn-default" id="boardCancelBtn" value="취소" /> 
				<input type="button" class="btn btn-default" id="boardListBtn" value="목록" />
			</div>
		</div>
	</form>
</body>
</html>