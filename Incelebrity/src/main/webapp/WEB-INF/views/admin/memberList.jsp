<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
  		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
  		<title>회원관리</title>
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.css"/>
		
		<script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
<script>
	$(function() {
		
		// 아이디 클릭시 회원정보 상세페이지
		$(".goDetail").click(function() {
			var member_no = $(this).parents("tr").attr("data-num");
			$("#member_no").val(member_no);
			console.log("회원번호" + member_no);
		
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/admin/memberDetail"
			});
			$("#detailForm").submit();
		}); 
		
		// 검색대상 변경시
		$("#search").change(function() {
			if($("#search").val()=="all"){
				$("#keyword").val("전체 리스트 조회합니다");
			}else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		// 검색버튼 클릭시 처리이벤트
		$("#searchData").click(function() {
			if($("#search").val()!="all" && $("#search").val()!="zero" && $("#search").val()!="one"){
				if(!chkData("#keyword","검색어를")) return;
			}
			goPage();
		});		
	});
	
	// 검색을 위한 실질적인 처리함수
	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}else if($("#search").val()=="zero"){
			$("#keyword").val(0);
		}else if($("#search").val()=="one"){
			$("#keyword").val(1);
		}
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/memberList"
		});
		$("#f_search").submit();
	}
	
	// 페이징 함수
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="admin/memberList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<meta charset="UTF-8">
<style>
div {
	width: 100%;
	display: inline-block;
	text-align: right;
}

form {
	width: 100%;
	display: inline-block;
}

td, th, tr {
	text-align: center;
}

body {
	text-align: center;
}
</style>
</head>
<body>
	<form id="detailForm" name="detailForm">
		<input type="hidden" id="member_no" name="member_no" />
		</form>
		<!-- 리스트에 조회된 회원 수 출력 -->
		<div class="text-right">등록된 회원 : <span>${paging.total}</span>명</div>
		<%-- 검색기능 시작 --%>
         <div id="boardSearch" class="text-right">
         <form name="f_search" id="f_search" class="form-inline">
            <div class="form-group">
            <label>검색 조건</label>
            <select id="search" name="search" class="form-control">
               <option value="all">전체보기</option>
               <option value="member_id">아이디</option>
               <option value="member_name">회원명</option>
               <option value="zero">정상</option>
               <option value="one">휴면</option>
            </select>
            <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control"/>
            <button type="button" id="searchData" class="btn btn-default">검색</button>
            </div>
         </form>
         </div>
		<form>
		<table class="table table-striped" id="memberList">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>회원명</th>
				<th>상태</th>
			</tr></thead>
			<tbody id="list" class="table-striped">
			<!-- 데이터 출력 -->
			<c:choose>
				<c:when test="${not empty memberList}">
					<c:forEach var="member" items="${memberList}">
						<tr class="active" data-num="${member.member_no}">
							<td>${member.member_no}</td>
							<td class="goDetail">${member.member_id}</td>
							<td>${member.member_name}</td>
							<td>
							<c:choose>
							<c:when test="${member.member_state eq 0}">
							정상
							</c:when>
							<c:otherwise>
							휴면</c:otherwise>
							</c:choose></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="tac text-center">등록된 회원이 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<div id="page" style="display: block; margin-bottom : 100px; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/admin/memberList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&search=${paging.search}&keyword=${paging.keyword}">&lt;</a>
		</c:if>
		<c:choose>
				<c:when test="${not empty memberList}">
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/admin/memberList?nowPage=${p }&cntPerPage=${paging.cntPerPage}&search=${paging.search}&keyword=${paging.keyword}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		</c:when>
		</c:choose>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/admin/memberList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&search=${paging.search}&keyword=${paging.keyword}">&gt;</a>
		</c:if>
	</div>
	</form>
</body>
</html>