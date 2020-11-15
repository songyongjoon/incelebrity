<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
	var member_id = ('${loginMember.member_id}');
	if(member_id == "") {
		alert("회원만 이용 가능합니다. 로그인 해주세요");
		location.href = "/member/loginForm";
	}
	
	$("#myInfoBtn").click(function(){
		$("#myPageForm").attr({
			"method" : "post",
			"action" : "/member/myPage/myInfo"
		})
		$("#myPageForm").submit();
	});

});
</script>

<style>

#myPageBtn {
	width: 100%;
	display: inline-block;
	text-align: center;
}
</style>
</head>
<body>
	<form id="myPageForm" name="myPageForm" method="post">
		<input type="hidden" id="member_id" name="member_id" value="${loginMember.member_id}">
	</form>
		<div id="myPageBtn">
			<p>
				<button type="button" id="myInfoBtn" class="btn btn-default" style="width: 150px; height: 150px">내 정보</button>
				<span><button type="button" id="" style="width: 150px; height: 150px" class="btn btn-default">어딘가에 있을</br>내 게시판</button></span>
				<span><button type="button" id="" style="width: 150px; height: 150px" class="btn btn-default">어딘가에 있을</br>장바구니</button></span>
			</p>
			<p>
				<button type="button" id=""	style="width: 150px; height: 150px" class="btn btn-default">어딘가에 있을</br>위시리스트</button>
				<span><button type="button" id="" style="width: 150px; height: 150px" class="btn btn-default">어딘가에 있을</br>주문내역</button></span>
			</p>
		</div>
</body>
</html>