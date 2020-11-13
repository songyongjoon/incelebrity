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
<!--viewport : ȭ�鿡 ���̴� ������ �����ϴ� ���. width�� device-width�� ����(������ �ʺ� ��ġ �ʺ� ���߾� ǥ��). initial-scale�� �ʱ����(���̴� ������ �� �������� ����). user-scalable�� ����ڰ� ȭ����Ҹ� ���� ���ϵ��� ����.-->
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>��й�ȣ ã��</title>
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
				<th>��й�ȣ</th>
			</tr>
			<tr>
				<td><p>${detail.member_passwd}</p></td>
			</tr>
		</table>
		<div>
			<button type="button" id="loginFormBtn" name="loginFormBtn"
				class="btn btn-default">���ư���</button>
		</div>
	</form>
</body>
</html>