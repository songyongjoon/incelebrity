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
<style>
	th{
		text-align: center;
	}
</style>
<script>
	$(function(){
		$("#searchData").click(function(){
			goPage();
		});
		$(".goDetail").click(function(){
			var b_num = $(this).parents("tr").attr("data-num");
			$("#profit_no").val(b_num);
			//console.log("글 번호: " +b_num);
			$("#profitListBoard").attr({
				"method" : "get",
				"action" : "/profit/profitDetail"
			});
			$("#profitListBoard").submit();
		});
	});
	
	function selChange() {
	      var sel = document.getElementById('cntPerPage').value;
	      location.href="profitList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	   }
	function goPage(){
		if($("#profitStart").val()==""){
			alert("시작 날짜를 선택해주세요.");
		}else if($("#profitEnd").val()==""){
			alert("마지막 날짜를 선택해주세요.");
		}else{
		$("#profitListBoard").attr({
			"method" : "get",
			"action" : "/profit/profitList"
		});
		$("#profitListBoard").submit();
		}
	}
	
	
</script>
</head>
<body>
	<form id="profitListBoard" name="profitListBoard">
			<input type="hidden" id="profit_no" name="profit_no" /> 
		
	<div class="text-right">총 : ${paging.total}개의 매출</div>
	<div class="text-right">
		<input type="date" id="profitStart" name="profitStart" />
		부터
		<input type="date" id="profitEnd" name="profitEnd" />
		까지의 매출 총액 : ${paging.profitTotal }
		<input type="button" id="searchData" value="검색"/>
	</div>
	<table class="table table-hover">
		<tr class="text-center">
			<th>No.</th>
			<th>주문번호</th>
			<th>금액</th>
			<th>매출일자</th>
		</tr>
		<c:choose>
		<c:when test="${not empty viewAll }">
		<c:forEach items="${viewAll }" var="list" varStatus="status">
			<tr class="text-center" data-num="${list.profit_no }">
				<td>${list.profit_no }</td>
				<td>${list.orders_no }</td>
				<td class="goDetail">
					${list.profit_sum}
				</td>
				<td>${list.profit_date }</td>
			</tr>
			</c:forEach>
		</c:when>
		</c:choose>
	</table>
	
	<div style="display: block; margin-bottom: 100px; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/profit/profitList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&profitStart=${paging.profitStart}&profitEnd=${paging.profitEnd}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
				<c:if test="${not empty paging.profitStart }">
					<a href="/profit/profitList?nowPage=${p }&cntPerPage=${paging.cntPerPage}&profitStart=${paging.profitStart}&profitEnd=${paging.profitEnd}">${p }</a>
				</c:if>
				<c:if test="${empty paging.profitStart  }">
					<a href="/profit/profitList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:if>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/profit/profitList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&profitStart=${paging.profitStart}&profitEnd=${paging.profitEnd}">&gt;</a>
		</c:if>
	</div>
	</form>
</body>
</html>