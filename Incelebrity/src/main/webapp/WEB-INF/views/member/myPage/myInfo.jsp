<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
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
		$("#pwdChk").css("visibility", "hidden");
		
		//수정 버튼 클릭 시 처리 이벤트
		$("#UpdateBtn").click(function(){
			$("#pwdChk").css("visibility", "visible");
			$("#msg").text("작성 시 입력한 비밀번호를 입력해 주세요").css("color", "#000099");
		});
		
		$("#pwdBtn").click(function() {
			memberPwdConfirm();
		});
	})
	
		function memberPwdConfirm(){
				if(!chkData("#member_passwd", "비밀번호를")) return;
				else{
					$.ajax({
						url : "/member/myPage/pwdConfirm", 			//전송 url
						type : "post",						//전송 시 method 방식
						data : $("#f_pwd").serialize(),		//폼 전체 데이터 전송
						dataType : "text",		
						error : function(){					//실행 시 오류가 발생하였을 경우
							alert('시스템 오류입니다. 관리자에게 문의하세요.')
						},									//정상적으로 실행이 되었을 경우
						success : function(resultData){
							if(resultData=="fail"){			//일치하지 않는 경우
								$("#msg").text("작성 시 입력한 비밀번호가 일치하지 않습니다.").css("color", "red");
								$("#member_passwd").select();
							
							}
							else if(resultData=="success"){		//일치할 경우
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
					<th colspan="2"><h2>내 정보</h2></th>
				</thead>
				<tbody id="list" class="table-striped">
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
				</tbody>
			</table>
			<div>
				<button type="button" id="UpdateBtn" name="UpdateBtn" class="btn btn-default">수정</button>
			</div>
		</div>
			<div id="pwdChk" class="authArea col-md-8 text-center">
				<form name="f_pwd" id="f_pwd" class="form-inline">
					<input type="hidden" name="member_id" id="member_id" value="${detail.member_id}"/>
					<label for="member_passwd" id="l_pwd">비밀번호: </label>
					<input type="password" name="member_passwd" id="member_passwd" class="form-control"/>
					<button type="button" id="pwdBtn" class="btn btn-default">확인</button>
					<span id="msg"></span>
				</form>
			</div>
		
</body>
</html>