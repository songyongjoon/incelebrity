<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>회원상세</title>
<link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" />

<link rel="stylesheet"
	href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/include/dist/css/bootstrap-theme.css" />

<script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="/resources/include/dist/js/bootstrap.min.js"></script>
<script>
	$(function() {
		// 저장버튼 클릭시 이벤트
		$("#UpdateBtn").click(function() {
			if (confirm("저장하시겠습니까?") == true) {
				$("#memberDetailForm").attr({
					"method" : "POST",
					"action" : "/admin/memberUpdate"
				})
				$("#memberDetailForm").submit();
			} else {
				alert("취소되었습니다.");
				location.href = "/admin/memberDetail?member_no="+${detail.member_no};
			}
		});
		
		// 목록버튼 제어
		$("#ListBtn").click(function() {
			location.href="/admin/memberList"
		});
	});
</script>
<meta charset="UTF-8">
<style>
div {
	width: 100%;
	display: inline-block;
	text-align: right;
}

#memberDetailDiv {
	width: 100%;
	display: inline-block;
	text-align: center;
}

td, th, tr {
	vertical-align: middle;
	text-align: left;
	height: 40px;
}

body {
	text-align: center;
}
</style>
</head>
<body>
	<form id="memberDetailForm" name="memberDetailForm">
	<input type="hidden" id="member_no" name="member_no" value="${detail.member_no}" />
		<div id="memberDetailDiv" style="margin-bottom: 100px;">
			<table class="table table-striped" id="memberDetail">
				<thead>
					<th colspan="2"><h2>회원 상세정보</h2></th>
				</thead>
				<tbody id="list" class="table-striped">
					<tr>
						<th>회원번호</th>
						<td>${detail.member_no}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${detail.member_id}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${detail.member_name}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${detail.member_address}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${detail.member_email}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${detail.member_phone}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${detail.member_birth}</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${detail.member_detail_writeday}</td>
					</tr>
					<tr>
						<th>마지막 로그인</th>
						<td>${detail.member_detail_loginday}</td>
					</tr>
					<tr>
						<th>회원정보 수정일</th>
						<c:choose>
							<c:when test="${empty detail.member_detail_modday}">
								<td>등록된 수정일이 없습니다.</td>
							</c:when>
							<c:otherwise>
								<td>${detail.member_detail_modday}</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th>회원상태</th>
						<td>
							<c:choose>
								<c:when test="${detail.member_state eq 0}">
								정상
								</c:when>
								<c:otherwise>
									 <select  id="member_state" name="member_state" class="form-control" style="width:100px;">
						               <option value="1">휴면</option>
						               <option value="0">정상</option>
           							 </select>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
			<div>
				<button type="button" id="UpdateBtn" name="UpdateBtn" class="btn btn-default">저장</button>
				<button type="button" id="ListBtn" name="ListBtn" class="btn btn-default">목록</button>
			</div>
		</div>
	</form>
</body>
</html>