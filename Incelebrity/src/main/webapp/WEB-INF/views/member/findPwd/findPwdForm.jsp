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

		$("#IdChk_btn").click(function() {
			if ($("#member_id").val().replace(/\s/g, "") == "") {
				alert("���̵� �Է����ּ���");
			} else if ($("#member_passhint").val().replace(/\s/g, "") == "") {
				alert("��Ʈ�� �������ּ���");
			} else if ($("#member_passanswer").val().replace(/\s/g, "") == "") {
				alert("���� �Է����ּ���");

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
				<td>���̵�</td>
				<td><input type="text" id="member_id" name="member_id" /></td>
			</tr>
			<tr>
				<td>��й�ȣ ��Ʈ</td>
				<td><select id="member_passhint" name="member_passhint">
						<option selected="selected" value="">������ �ּ���</option>
						<option value="���� ���� �����ϴ� ������?">���� ���� �����ϴ� ������?</option>
						<option value="���� ���� ���� �ڵ�����?">���� ���� ���� �ڵ�����?</option>
						<option value="���� �����ϴ� �����?">���� �����ϴ� �����?</option>
						<option value="���� ���� ���ϴ� ����?">���� ���� ���ϴ� ����?</option>
				</select></td>
			</tr>
			<tr>
				<td>��й�ȣ ��Ʈ ��</td>
				<td><input type="text" id="member_passanswer"
					name="member_passanswer"></td>
			</tr>
		</table>
		<div>
			<button type="submit" id="IdChk_btn" name="IdChk_btn"
				class="btn btn-default">Ȯ��</button>
			<input type="reset" id="resetbtn" name="resetbtn"
				class="btn btn-default" value="�ʱ�ȭ">
		</div>
	</form>
</body>
</html>