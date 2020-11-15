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
<script>
var butChk = 0; //수정버튼과 삭제버튼을 구별하기 위한 변수
$(function(){
	$("#boardListBtn").click(function(){
		location.href="/review/reviewList"
	});
	$("#insertFormBtn").click(function(){
		location.href="/review/reviewWriteForm"
	});
	$("#boardUpdateBtn").click(function(){
		$("#f_data").attr({
			"method" : "post",
			"action" : "/review/reviewUpdateForm"
		});
		$("#f_data").submit();
	});
		

	});
	
	
	/* 삭제 버튼 클릭 시 댓글 확인 후 처리 이벤트 
	$("#boardDeleteBtn").click(function(){
		$.ajax({
			url:"/board/replyCnt",
			type:"post",
			data:"review_no="+$("#review_no").val(),
			dataType:"text",
			error:function(){
				alert('시스템 오류');
			},
			success:function(resultData){
				if(resultData==0){
					butChk = 2;
				}else{
					alert("댓글이 존재하는 게시판은 삭제할 수 없습니다.");
					return;
				}
			}
		});
	});*/
</script>
<style>
	textarea{
		width: 450px;
		height: 300px;
	}
	th{
		width: 100px;
	}
</style>
</head>
<body>
	<form name="f_data" id="f_data" method="post">
		<input type="hidden" name="review_no" value="${detail.review_no}"/>
	
	<!--  
	<div id="boardPwdBut" class="row text-center">
		<div id="pwdChk" class="authArea col-md-8 text-left">
			<form name="f_pwd" id="f_pwd" class="form-inline">
				<input type="hidden" name="review_no" id="review_no" value="${detail.review_no }"/>
				<label for="b_pwd" id="l_pwd">비밀번호 : </label>
				<input type="password" name="b_pwd" id="b_pwd" class="form-control"/>
				
				<button type="button" id="pwdBtn" class="btn btn-default">확인</button>
				<span id="msg"></span>
			</form>
		</div>-->
		<div class="btnArea col=md-4 text-right">
			<input type="button" value="글수정" id="boardUpdateBtn" class="btn btn-success"/>
			<input type="button" value="글삭제" id="boardDeleteBtn" class="btn btn-success"/>
			<input type="button" value="목록" id="boardListBtn" class="btn btn-success"/>
		</div>
	<div>
		<h3>임수현 바보</h3>
		<table class="table table-hover">
			<tbody>

				<tr data-num="${detail.review_no}">
					<th class="text-center" >글번호</th>
					<td>${detail.review_no}</td>
				</tr>
				<tr>
					<th class="text-center">주문번호</th>
					<td>${detail.orders_no}</td>
				</tr>
				<tr>
					<th class="text-center">제목</th>
					<td class="goDetail">${detail.review_title}</td>
				</tr>
				<tr>
					<th class="text-center">평점</th>
					<td>${detail.review_point}</td>
				</tr>
				<tr>
					<th class="text-center">내용</th>
					<td><textarea style="resize:none;" readonly="readonly">${detail.review_content }</textarea></td>
				</tr>
				<tr>
					<th class="text-center">작성일</th>
					<td>${detail.review_writeday}</td>
				</tr>
				<tr>
					<th class="text-center">작성자</th>
					<td>${detail.review_name}</td>
				</tr>
			</tbody>
		</table>
		<jsp:include page="reviewReply.jsp"/>
	</div>
	</form>
</body>
</html>