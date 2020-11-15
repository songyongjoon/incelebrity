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
$(function(){
	$("#boardListBtn").click(function(){
		location.href="/profit/profitList";
	});


});
</script>
</head>
<body>
<form name="f_data" id="f_data" method="post">
		<input type="hidden" name="review_no" value="${detail.profit_no}"/>
	
		<div class="btnArea col=md-4 text-right">
			<input type="button" value="목록" id="boardListBtn" class="btn btn-success"/>
		</div>
	<div>
		<h3>임수현 바보</h3>
		<table class="table table-hover">
			<tbody>

				<tr data-num="${detail.profit_no}">
					<th class="text-center" >글번호</th>
					<td>${detail.profit_no}</td>
				</tr>
				<tr>
					<th class="text-center">매출금액</th>
					<td class="goDetail">${detail.profit_sum}</td>
				</tr>
				<tr>
					<th class="text-center">주문번호</th>
					<td>${detail.orders_no}</td>
				</tr>
				<tr>
					<th class="text-center">상품번호</th>
					<td>${detail.product_no}</td>
				</tr>
				<tr>
					<th class="text-center">매출일자</th>
					<td>${detail.profit_date}</td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
</body>
</html>