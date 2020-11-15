<%--
  Created by IntelliJ IDEA.
  User: khotaehyeong
  Date: 20. 10. 14.
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<link rel="shortcut icon" href="/resources/image/icon.png" />
	<link rel="apple-touch-icon" href="/resources/image/icon.png" />

	<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.css"/>

	<script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script type = "text/javascript">
		$(function(){
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

			$("#member_id").blur(function(){
				var id_chk = /^[a-z][a-z0-9]{4,12}$/;

				if(!id_chk.test($("#member_id").val())){
					$("#id_chkmsg").html("4자리에서 12자리의 영문자, 숫자로 입력해 주세요").css("color", "red");
				}
				else{
					$("#id_chkmsg").html("");

					$("#over_chk").click(function(){
						$.ajax({
							url : "/member/getUserOne",
							type : "post",
							data : "member_id=" + $("#member_id").val(),
							dataType : "text",
							error : function(){
								alert("회원가입 시스템 오류입니다. 관리자에게 문의하세요");
							},
							success : function(resultData){
								if(resultData == "fail"){
									$("#id_msg").html("중복된 아이디가 있습니다").css("color", "red");
									$("#member_id").focus();
								}
								else if(resultData == "success"){
									$("#id_msg").html("V").css("color", "blue");
									$("#member_passwd").focus();
								}
								else{
									alert("회원가입 오류입니다. 관리자에게 문의하세요");
								}
							}
						});
					});
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

			$("#member_name").blur(function(){
				var name_chk = /^[가-힣]+$/;

				if(!name_chk.test($("#member_name").val())){
					$("#name_chkmsg").html("한글을 입력해 주세요").css("color", "red");
				}
				else{
					$("#name_chkmsg").html("");
				}
			});

			$("#member_address").blur(function(){
				var address_chk = /^[가-힣\s]+$/;

				if(!address_chk.test($("#member_address").val())){
					$("#address_chkmsg").html("한글을 입력해 주세요").css("color", "red");
				}
				else{
					$("#address_chkmsg").html("");
				}
			});

			$("#member_phone2").blur(function(){
				var phone_chk = /^[0-9]{3,4}$/;

				if(!phone_chk.test($("#member_phone2").val())){
					$("#phone_chkmsg").html("3자리에서 4자리 사이의 숫자를 입력해 주세요").css("color", "red");
				}
				else{
					$("#phone_chkmsg").html("");
				}
			});

			$("#member_phone3").blur(function(){
				var phone_chk = /^[0-9]{4}$/;

				if(!phone_chk.test($("#member_phone3").val())){
					$("#phone_chkmsg").html("4자리의 숫자를 입력해 주세요").css("color", "red");
				}
				else{
					$("#phone_chkmsg").html("");
				}
			});

			$("#member_email_f").blur(function(){
				var email_chk = /^([\w-]+(?:\.[\w-]+)*)$/;

				if(!email_chk.test($("#member_email_f").val())){
					$("#email_chkmsg").html("영어와 숫자로 입력해 주세요").css("color", "red");
				}
				else{
					$("#email_chkmsg").html("");
				}
			});

			$("#reg_btn").click(function(){
				$("#member_phone").val($("#member_phone1").val() + "-" + $("#member_phone2").val() + "-" + $("#member_phone3").val());

				if($("#member_email_r").val()=="command"){
					$("#member_email").val($("#member_email_f").val() + "@" + $("#member_email_c").val());

					if(!chkData("#member_id", "아이디를")) return;
					else if(!chkData("#member_passwd", "비밀번호를")) return;
					else if(!chkData("#member_name", "이름을")) return;
					else if(!chkData("#member_address", "주소를")) return;
					else if(!chkData("#member_phone2", "연락처를")) return;
					else if(!chkData("#member_phone3", "연락처를")) return;
					else if(!chkData("#member_email_f", "이메일을")) return;
					else if(!chkData("#member_email_c", "이메일을")) return;
					else if(!chkData("#member_birth", "생일을")) return;
					else if(!chkData("#member_passhint", "질문을")) return;
					else if(!chkData("#member_passanswer", "답변을")) return;
					else{
						$("#reg_form").attr({
							"method" : "post",
							"action" : "/member/memberSignUp"
						});
						$("#reg_form").submit();
					}
				}
				else if($("#member_email_r").val()!="command"){
					$("#member_email").val($("#member_email_f").val() + "@" + $("#member_email_r").val());

					if(!chkData("#member_id", "아이디를")) return;
					else if(!chkData("#member_passwd", "비밀번호를")) return;
					else if(!chkData("#member_name", "이름을")) return;
					else if(!chkData("#member_address", "주소를")) return;
					else if(!chkData("#member_phone2", "연락처를")) return;
					else if(!chkData("#member_phone3", "연락처를")) return;
					else if(!chkData("#member_email_f", "이메일을")) return;
					else if(!chkData("#member_email_r", "이메일을")) return;
					else if(!chkData("#member_birth", "생일을")) return;
					else if(!chkData("#member_passhint", "질문을")) return;
					else if(!chkData("#member_passanswer", "답변을")) return;
					else{
						$("#reg_form").attr({
							"method" : "post",
							"action" : "/member/memberSignUp"
						});
						$("#reg_form").submit();
					}
				}
			});

			$("#list_btn").click(function(){
				location.href = "/member/loginForm"
			});
		});
	</script>
</head>
<body>
<form id="reg_form" name="reg_form">
	<table>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" id="member_id" name="member_id" />
				<input type="button" id="over_chk" name="over_chk" value="중복체크" />
				<span id="id_msg" name="id_msg"></span>
				<span id="id_chkmsg" name="id_chkmsg"></span>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" id="member_passwd" name="member_passwd" />
				<span id="passwd_chkmsg" name="passwd_chkmsg"></span>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" id="member_name" name="member_name" />
				<span id="name_chkmsg" name="name_chkmsg"></span>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" id="member_address" name="member_address" />
				<span id="address_chkmsg" name="address_chkmsg"></span>
			</td>
		</tr>
		<tr>
			<td>연락처</td>
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
				<span id="phone_chkmsg" name="phone_chkmsg"></span>
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" id="member_email_f" name="member_email_f" />
				<span>@</span>
				<input type="text" id="member_email_c" name="member_email_c" />
				<select id="member_email_r" name="member_email_r">
					<option value="naver.com" selected="selected">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="command">직접입력</option>
				</select>
				<input type="hidden" id="member_email" name="member_email" />
				<span id="email_chkmsg" name="email_chkmsg"></span>
			</td>
		</tr>
		<tr>
			<td>생일</td>
			<td><input type="text" id="member_birth" name="member_birth" /></td>
		</tr>
		<tr>
			<td>비밀번호 힌트</td>
			<td>
				<select id="member_passhint" name="member_passhint">
					<option selected="selected" value="">선택해 주세요</option>
					<option value="내가 가장 좋아하는 색깔은?">내가 가장 좋아하는 색깔은?</option>
					<option value="내가 갖고 싶은 자동차는?">내가 갖고 싶은 자동차는?</option>
					<option value="내가 좋아하는 사람은?">내가 좋아하는 사람은?</option>
					<option value="내가 가장 잘하는 것은?">내가 가장 잘하는 것은?</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>힌트 정답</td>
			<td><input type="text" id="member_passanswer" name="member_passanswer" /></td>
		</tr>
	</table>
	<div>
		<input type="button" id="reg_btn" name="reg_btn" value="가입하기" />
		<input type="reset" id="reset_btn" name="reset_btn" value="취소" />
		<input type="button" id="list_btn" name="list_btn" value="메인화면" />
	</div>
</form>
</body>
</html>