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
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap"
	rel="stylesheet">
<script>
$(function(){
	$("#writeBtn").click(function(){
		location.href="/review/reviewWriteForm";
	});
	
	$(".goDetail").click(function(){
		var b_num = $(this).parents("tr").attr("data-num");
		$("#review_no").val(b_num);
		//console.log("글 번호: " +b_num);
		$("#detailForm").attr({
			"method" : "get",
			"action" : "/review/reviewDetail"
		});
		$("#detailForm").submit();
	});
});


	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="reviewList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<style>
body {
	font-family: 'Gugi', cursive;
}

#writeBtn {
	float: right;
}

table,th,tr,td {
	text-align: center;
}
.cnt{
	color: red;
}
</style>
</head>
<body>
	<form id="detailForm" name="detailForm">
			<input type="hidden" id="review_no" name="review_no" /> 
		</form>
	<div class="text-right">총 : ${paging.total}개의 리뷰</div>
	<table class="table table-hover">
		<tr>
			<th>No.</th>
			<th>주문번호</th>
			<th width="50%">제목</th>
			<th>별점</th>
			<th>등록일</th>
			<th>작성자</th>
		</tr>
		<c:choose>
		<c:when test="${not empty viewAll }">
		<c:forEach items="${viewAll }" var="list" varStatus="status">
			<tr class="text-center" data-num="${list.review_no }">
				<td>${list.review_no }</td>
				<td>${list.orders_no }</td>
				<td class="goDetail">
					${list.review_title }
				</td>
				<td>${list.review_point }</td>
				<td>${list.review_writeday }</td>
				<td class="name">${list.review_name }</td>
			</tr>
			</c:forEach>
		</c:when>
		</c:choose>
	</table>
	<input type="button" id="writeBtn" value="글쓰기" style="float: right;"><br>
	
	<div style="display: block; margin-bottom: 100px; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/review/reviewList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/review/reviewList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/review/reviewList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</body>
</html>