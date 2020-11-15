<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
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
		$("#pwdChk").css("visibility", "hidden");
		
		//���� ��ư Ŭ�� �� ó�� �̺�Ʈ
		$("#UpdateBtn").click(function(){
			$("#pwdChk").css("visibility", "visible");
			$("#msg").text("�ۼ� �� �Է��� ��й�ȣ�� �Է��� �ּ���").css("color", "#000099");
		});
		
		$("#pwdBtn").click(function() {
			memberPwdConfirm();
		});
	})
	
		function memberPwdConfirm(){
				if(!chkData("#member_passwd", "��й�ȣ��")) return;
				else{
					$.ajax({
						url : "/member/myPage/pwdConfirm", 			//���� url
						type : "post",						//���� �� method ���
						data : $("#f_pwd").serialize(),		//�� ��ü ������ ����
						dataType : "text",		
						error : function(){					//���� �� ������ �߻��Ͽ��� ���
							alert('�ý��� �����Դϴ�. �����ڿ��� �����ϼ���.')
						},									//���������� ������ �Ǿ��� ���
						success : function(resultData){
							if(resultData=="fail"){			//��ġ���� �ʴ� ���
								$("#msg").text("�ۼ� �� �Է��� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.").css("color", "red");
								$("#member_passwd").select();
							
							}
							else if(resultData=="success"){		//��ġ�� ���
								$("#memberDetailForm").attr({
									"method" : "post",
									"action" : "/member/myPage/myInfoUpdateForm"
								})
								$("#memberDetailForm").submit();
							}
						}
					});	
				}
			}
	</script>
	
</head>
<body>
<form id="memberDetailForm" name="memberDetailForm" method="post">
	<input type="hidden" id="member_id" name="member_id" value="${detail.member_id}" />
	</form>
		<div id="memberDetailDiv" style="margin-bottom: 100px;">
			<table class="table table-striped" id="memberDetail">
				<thead>
					<th colspan="2"><h2>�� ����</h2></th>
				</thead>
				<tbody id="list" class="table-striped">
					<tr>
						<th>���̵�</th>
						<td>${detail.member_id}</td>
					</tr>
					<tr>
						<th>�̸�</th>
						<td>${detail.member_name}</td>
					</tr>
					<tr>
						<th>�ּ�</th>
						<td>${detail.member_address}</td>
					</tr>
					<tr>
						<th>�̸���</th>
						<td>${detail.member_email}</td>
					</tr>
					<tr>
						<th>��ȭ��ȣ</th>
						<td>${detail.member_phone}</td>
					</tr>
					<tr>
						<th>�������</th>
						<td>${detail.member_birth}</td>
					</tr>
				</tbody>
			</table>
			<div>
				<button type="button" id="UpdateBtn" name="UpdateBtn" class="btn btn-default">����</button>
			</div>
		</div>
			<div id="pwdChk" class="authArea col-md-8 text-center">
				<form name="f_pwd" id="f_pwd" class="form-inline">
					<input type="hidden" name="member_id" id="member_id" value="${detail.member_id}"/>
					<label for="member_passwd" id="l_pwd">��й�ȣ: </label>
					<input type="password" name="member_passwd" id="member_passwd" class="form-control"/>
					<button type="button" id="pwdBtn" class="btn btn-default">Ȯ��</button>
					<span id="msg"></span>
				</form>
			</div>
		
</body>
</html>