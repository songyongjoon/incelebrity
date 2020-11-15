<%--
  Created by IntelliJ IDEA.
  User: khotaehyeong
  Date: 20. 10. 14.
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			$("#back_btn").click(function(){

				location.href = "../../.."
			});

			$("#login_btn").click(function(){
				$.ajax({
					url : "/member/memberLogin",
					method : "post",
					data : $("#login_frm").serialize(),
					dataType : "text",
					error : function(){
						alert("로그인 시스템 오류입니다. 관리자에게 문의하세요");
					},
					success : function(result){
						if(result == "success"){
							location.href = "../../..";
						}
						else if(result == "fail"){
							var chkTag = "<span></span>";
							$("#chk_space").append(chkTag).attr({"id" : "id_msg"});
							$("#id_msg").html("가입하지 않은 아이디거나 비밀번호가 틀렸습니다.").css("color", "red");
						}
						else{
							alert("로그인 오류입니다. 관리자에게 문의하세요");
						}
					}
				});
			});

			$("#logout_btn").click(function(){
				location.href = "/member/memberLogout";
			});

			$("#reg_btn").click(function(){
				location.href = "/member/signUpForm";
			});
			$("#find_pwd_btn").click(function(){
				location.href = "/member/findPwd/findPwdForm";
			});
		});
	</script>
</head>
<body>
<c:choose>
	<c:when test="${loginMember eq null}">
		<form id="login_frm" name="login_frm">
			<div>
				<span>로그인</span>
				<input type="text" id="member_id" name="member_id" />
			</div>
			<div>
				<span>비밀번호</span>
				<input type="password" id="member_passwd" name="member_passwd" />
			</div>
			<div id="chk_space"></div>
			<div>
				<input type="button" id="login_btn" name="login_btn" value="로그인" />
				<input type="reset" id="reset_btn" name="reset_btn" value="취소" />
				<input type="button" id="reg_btn" name="reg_btn" value="회원가입" />
				<input type="button" id="find_pwd_btn" name="find_pwd_btn" value="비밀번호찾기" />
			</div>
		</form>
	</c:when>
	<c:otherwise>
		<span>이미 로그인 된 사용자 입니다.</span>
		<input type="button" id="back_btn" name="back_btn" value="뒤로가기" />
		<input type="button" id="logout_btn" name="logout_btn" value="로그아웃" />
	</c:otherwise>
</c:choose>
</body>
</html>
