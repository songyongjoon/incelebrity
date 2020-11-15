<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
	$(function(){
		$("#listBtn").click(function(){
			location.href="/review/reviewList";
		});
		$("#updateBtn").click(function(){
			$("#f_data").attr({
				"method" : "post",
				"action" : "/review/reviewUpdate"
			});
			$("#f_data").submit();
		})
	})
</script>
</head>
<body>
	<form name="f_data" id="f_data" method="post">
		<input type="hidden" name="review_no" value="${reviewUpdateForm.review_no}"/>
		<div class="form-group">
			<label for="inputTitle" class="col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="review_title" name="review_title" value="${reviewUpdateForm.review_title }" maxlength="20">
			</div>
		</div>
		<div class="form-group">
			<label for="inputName" class="col-sm-2 control-label">작성자</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="review_name" name="review_name" value="${reviewUpdateForm.review_name }" maxlength="10" />
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
				<textarea style="resize: none" class="form-control" cols="128" rows="10" id="review_content" name="review_content" maxlength="50">${reviewUpdateForm.review_content }</textarea>
			</div>
		</div>
	<input type="button" class="btn btn-success" id="updateBtn" name="updateBtn" value="저장"/>
	<input type="button" class="btn btn-success" id="listBtn" name="listBtn" value="목록"/>
	</form>
</body>
</html>