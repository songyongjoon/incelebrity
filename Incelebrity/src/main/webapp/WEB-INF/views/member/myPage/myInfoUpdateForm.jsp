<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		$("#member_email_c").hide();

		$("#member_email_r").change(function(){
			if($("#member_email_r").val()=="command"){
				$("#member_email_c").show();
				$("#member_email_c").blur(function(){
					var email_chk = /^((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

					if(!email_chk.test($("#member_email_c").val())){
						$("#email_chkmsg").html("형식에 맞게 입력해 주세요").css("color", "red");
					}
					else{
						$("#email_chkmsg").html("");
					}
				});
			}
			else{
				$("#member_email_c").hide();
			}
		});

		$("#member_passwd").blur(function(){
			var passwd_chk = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,24}/;

			if(!passwd_chk.test($("#member_passwd").val())){
				$("#passwd_chkmsg").html("8자리에서 24자리의 숫자, 영어 대소문자, 특수문자를 혼합해 주세요").css("color", "red");
			}
			else{
				$("#passwd_chkmsg").html("");
			}
		});

		$("#member_address").blur(function() {
			var address_chk = /^[가-힣\s]+$/;

			if (!address_chk.test($("#member_address").val())) {
				$("#address_chkmsg").html("한글을 입력해 주세요").css("color", "red");
			} else {
				$("#address_chkmsg").html("");
			}
		});

		$("#member_phone2").blur(
				function() {
					var phone_chk = /^[0-9]{3,4}$/;

					if (!phone_chk.test($("#member_phone2").val())) {
						$("#phone_chkmsg").html("3자리에서 4자리 사이의 숫자를 입력해 주세요")
								.css("color", "red");
					} else {
						$("#phone_chkmsg").html("");
					}
				});

		$("#member_phone3").blur(
				function() {
					var phone_chk = /^[0-9]{4}$/;

					if (!phone_chk.test($("#member_phone3").val())) {
						$("#phone_chkmsg").html("4자리의 숫자를 입력해 주세요").css(
								"color", "red");
					} else {
						$("#phone_chkmsg").html("");
					}
				});

		$("#member_email_f").blur(function() {
			var email_chk = /^([\w-]+(?:\.[\w-]+)*)$/;

			if (!email_chk.test($("#member_email_f").val())) {
				$("#email_chkmsg").html("영어와 숫자로 입력해 주세요").css("color", "red");
			} else {
				$("#email_chkmsg").html("");
			}
		});

		$("#UpdateBtn").click(function(){
			$("#member_phone").val($("#member_phone1").val() + "-" + $("#member_phone2").val() + "-" + $("#member_phone3").val());

			if($("#member_email_r").val()=="command"){
				$("#member_email").val($("#member_email_f").val() + "@" + $("#member_email_c").val());

				if(!chkData("#member_passwd", "비밀번호를")) return;
				else if($("#member_passwd").val() != $("#passwdChk").val()) {alert("비밀번호 확인이 일치하지 않습니다."); return;}
				else if(!chkData("#member_address", "주소를")) return;
				else if(!chkData("#member_phone2", "연락처를")) return;
				else if(!chkData("#member_phone3", "연락처를")) return;
				else if(!chkData("#member_email_f", "이메일을")) return;
				else if(!chkData("#member_email_c", "이메일을")) return;
				else if(!chkData("#member_birth", "생일을")) return;
				else{
					$.ajax({
						url : "/member/myPage/myInfoUpdate",
						method : "post",
						data : $("#myInfoUpdateForm").serialize(),
						dataType : "text",
						error : function(){
							alert("로그인 시스템 오류입니다. 관리자에게 문의하세요");
						},
						success : function(result){
							if(result!="") {
								alert("수정 성공");
								location.href = "/member/myPage/myPageMain"
							}
							else {
								alert("수정 실패");
							}
						}
					
					})
				}
			}
			else if($("#member_email_r").val()!="command"){
				$("#member_email").val($("#member_email_f").val() + "@" + $("#member_email_r").val());

				if(!chkData("#member_passwd", "비밀번호를")) return;
				else if($("#member_passwd").val() != $("#passwdChk").val()) {alert("비밀번호 확인이 일치하지 않습니다."); return;}
				else if(!chkData("#member_address", "주소를")) return;
				else if(!chkData("#member_phone2", "연락처를")) return;
				else if(!chkData("#member_phone3", "연락처를")) return;
				else if(!chkData("#member_email_f", "이메일을")) return;
				else if(!chkData("#member_email_r", "이메일을")) return;
				else if(!chkData("#member_birth", "생일을")) return;
				else{
					$.ajax({
						url : "/member/myPage/myInfoUpdate",
						method : "post",
						data : $("#myInfoUpdateForm").serialize(),
						dataType : "text",
						error : function(){
							alert("로그인 시스템 오류입니다. 관리자에게 문의하세요");
						},
						success : function(result){
							if(result!="") {
								alert("수정 성공");
								location.href = "/member/myPage/myPageMain"
							}
							else {
								alert("수정 실패");
							}
						}
					
					})
				}
			}
		});

		$("#QuiteBtn").click(function() {
			if (confirm("정말 탈퇴하시겠습니까?") == true) {
			$("#member_id_form").attr({
				"method" : "post",
				"action" : "/member/myPage/quitUpdate"
			});
			$("#member_id_form").submit();
			} else alert("취소되었습니다.");
		})
		
	});
</script>
</head>
<body><form id="member_id_form" name="member_id_form" method="post">
		<input type="hidden" id="member_id" name="member_id" value="${detail.member_id}" />
		</form>
	<form id="myInfoUpdateForm" name="myInfoUpdateForm" method="post">
	<input type="hidden" id="member_id" name="member_id" value="${detail.member_id}" />
		<div id="myInfoUpdateDiv" style="margin-bottom: 100px;">
			<table class="table table-striped">
				<thead>
					<th colspan="2"><h2>내 정보</h2></th>
				</thead>
				<tbody id="list" class="table-striped">
					<tr>
						<th>아이디</th>
						<td>${detail.member_id}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="member_passwd"
							name="member_passwd" /> <span id="passwd_chkmsg"></span></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" id="passwdChk"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${detail.member_name}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" id="member_address" name="member_address" />
						<span id="address_chkmsg"></span></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" id="member_email_f"
							name="member_email_f" /> <span>@</span> <input type="text"
							id="member_email_c" name="member_email_c" /> <select
							id="member_email_r" name="member_email_r">
								<option value="naver.com" selected="selected">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="command">직접입력</option>
						</select> <input type="hidden" id="member_email" name="member_email" /> <span
							id="email_chkmsg"></span></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
						<select id="member_phone1" name="member_phone1">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="019">019</option>
						</select>
						<span>-</span>
						<input type="text" id="member_phone2" name="member_phone2" />
						<span>-</span>
						<input type="text" id="member_phone3" name="member_phone3" />
						<input type="hidden" id="member_phone" name="member_phone" />
						<span id="phone_chkmsg"></span></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="date" id="member_birth"></td>
					</tr>
				</tbody>
			</table>
		</div>
			<div>
				<button type="button" id="UpdateBtn" name="UpdateBtn"
					class="btn btn-default">저장</button>
				<button type="reset" class="btn btn-default">초기화</button>
				<button type="button" id="QuiteBtn" name="QuiteBtn"
					class="btn btn-default">회원탈퇴</button>
			</div>
	</form>
</body>
</html>