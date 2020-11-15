<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>마이페이즈 orders</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="resources/js/html5shiv.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
    	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css" />

    	<script type="text/javascript" src="/resources/include/js/jQuery/jquery-1.12.4.min.js"></script>
    	<script type="text/javascript" src="/resources/include/js/common.js"></script>
    	<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
    	<script type="text/javascript">
		$(function(){
		});
	</script>
		
	<style type="text/css">
	</style>
	
</head>

<body>
	
	<form name="f_data" id="f_data" method="post">
		<input type="hidden" name="b_num" value="${detail.orders_no}"/>
	</form>
	<div class="container">	
		<div class ="row text-right" id="btns">
			<div class="btnArea col-md-4 text-right">
				<input type="button" value="글수정" id="updateFormBtn" class="btn btn-success"/>
				<input type="button" value="글삭제" id="boardDeleteBtn" class="btn btn-success"/>
				<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success"/>
				<input type="button" value="목록" id="boardListBtn" class="btn btn-success"/>
			</div>
		</div>
		
		<table class="table table-bordered">
			<colgroup>
				<col width="17%"/>
				<col width="33%"/>
				<col width="17%"/>
				<col width="33%"/>
			</colgroup>
			<tr>
				<td>작성자</td>
				<td class="text-left">${detail.orders_detail_name}님의 주문 정보</td>
				<td>작성일</td>
				<td class="text-left">${detail.orders_date}</td>
			</tr>
			
			<tr>
				<td>가격</td>
				<td colspan="3" class="text-left">${detail.b_title}</td>
			</tr>
			<tr class="table-height">
				<td>주문 갯수</td>
				<td colspan="3" class="text-left">${detail.orders_detail_count}</td>
			</tr>
			<tr class="table-height">
				<td>주문 컬러</td>
				<td colspan="3" class="text-left">${detail.orders_detail_color}</td>
			</tr>
			<tr class="table-height">
				<td>주문 크기</td>
				<td colspan="3" class="text-left">${detail.orders_detail_size}</td>
			</tr>
		</table>
	</div>
	
	<%--===============성새 정보 보여주기 종료 ====================== --%>
</body>
</html>