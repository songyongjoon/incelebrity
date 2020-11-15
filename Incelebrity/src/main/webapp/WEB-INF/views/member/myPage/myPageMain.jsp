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
		alert("ȸ���� �̿� �����մϴ�. �α��� ���ּ���");
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
				<button type="button" id="myInfoBtn" class="btn btn-default" style="width: 150px; height: 150px">�� ����</button>
				<span><button type="button" id="" style="width: 150px; height: 150px" class="btn btn-default">��򰡿� ����</br>�� �Խ���</button></span>
				<span><button type="button" id="" style="width: 150px; height: 150px" class="btn btn-default">��򰡿� ����</br>��ٱ���</button></span>
			</p>
			<p>
				<button type="button" id=""	style="width: 150px; height: 150px" class="btn btn-default">��򰡿� ����</br>���ø���Ʈ</button>
				<span><button type="button" id="" style="width: 150px; height: 150px" class="btn btn-default">��򰡿� ����</br>�ֹ�����</button></span>
			</p>
		</div>
</body>
</html>