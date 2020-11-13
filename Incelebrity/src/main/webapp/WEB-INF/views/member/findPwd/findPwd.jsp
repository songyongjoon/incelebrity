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
<title>비밀번호 찾기</title>
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

		$("#loginFormBtn").click(function() {
			location.href = "/member/loginForm"
		})
	})
</script>
<style>
</style>
</head>
<body>
	<form>
		<table>
			<tr>
				<th>비밀번호</th>
			</tr>
			<tr>
				<td><p>${detail.member_passwd}</p></td>
			</tr>
		</table>
		<div>
			<button type="button" id="loginFormBtn" name="loginFormBtn"
				class="btn btn-default">돌아가기</button>
		</div>
	</form>
</body>
</html>