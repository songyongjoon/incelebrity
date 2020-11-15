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

		$("#IdChk_btn").click(function() {
			if ($("#member_id").val().replace(/\s/g, "") == "") {
				alert("아이디를 입력해주세요");
			} else if ($("#member_passhint").val().replace(/\s/g, "") == "") {
				alert("힌트를 선택해주세요");
			} else if ($("#member_passanswer").val().replace(/\s/g, "") == "") {
				alert("답을 입력해주세요");

			} else {
				$("#findPwdForm").attr({
					"method" : "POST",
					"action" : "/member/findPwd/findPwd"
				});
				$("#findPwdForm").submit();
			}
		});
	});
</script>
<style>
</style>
</head>
<body>
	<form id="findPwdForm" name="findPwdForm">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="member_id" name="member_id" /></td>
			</tr>
			<tr>
				<td>비밀번호 힌트</td>
				<td><select id="member_passhint" name="member_passhint">
						<option selected="selected" value="">선택해 주세요</option>
						<option value="내가 가장 좋아하는 색깔은?">내가 가장 좋아하는 색깔은?</option>
						<option value="내가 갖고 싶은 자동차는?">내가 갖고 싶은 자동차는?</option>
						<option value="내가 좋아하는 사람은?">내가 좋아하는 사람은?</option>
						<option value="내가 가장 잘하는 것은?">내가 가장 잘하는 것은?</option>
				</select></td>
			</tr>
			<tr>
				<td>비밀번호 힌트 답</td>
				<td><input type="text" id="member_passanswer"
					name="member_passanswer"></td>
			</tr>
		</table>
		<div>
			<button type="submit" id="IdChk_btn" name="IdChk_btn"
				class="btn btn-default">확인</button>
			<input type="reset" id="resetbtn" name="resetbtn"
				class="btn btn-default" value="초기화">
		</div>
	</form>
</body>
</html>