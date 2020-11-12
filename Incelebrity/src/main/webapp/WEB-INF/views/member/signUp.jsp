<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
  		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
  		<title>로그인</title>
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.css"/>
		
		<script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">			
			function signUp() {
				console.log("가입 시작");
				$.ajax({
					url : "/member/signUp",
					method : 'post',
					data : $("#registerform").serialize(),
					dataType : "text",
					success : function(data) {
						if(data == "success"){
							alert("회원가입이 완료되었습니다.");
							location.href = "/member/login"
						}else if(data == "fail"){
							alert("이미 존재하는 아이디 입니다.");
							return false;
						}
						else{
							console.log(data);
						}
					},
					error : function(){
						alert("오류입니다.");
					}
				});
			}
		</script>
</head>
	<body>
		<form id="registerform">
			<div class="fieldlabel"><label for="id">아이디 :</label></div>
			<div class="formfield"><input type="text" id="member_id" name="member_id" maxlength="20" value=""></div>
			        
			<div class="fieldlabel"><label for="pw">패스워드 : </label></div>
			<div class="formfield">
				<input type="password" id="member_passwd" name="member_passwd" maxlength="20" autocomplete="off">
			</div>
			
			<div class="fieldlabel"><label for="name">이름 : </label></div>
			<div class="formfield"><input type="text" id="member_name" name="member_name" value=""></div>
			       
			<div class="fieldlabel"><label for="address">주소 :</label></div>
			<div class="formfield"><input type="text" id="member_address" name="member_address" value=""></div>
			
			<div class="fieldlabel"><label for="phone">전화번호 :</label></div>
			<div class="formfield"><input type="text" id="member_phone" name="member_phone" value=""></div>
			
			<div class="fieldlabel"><label for="birth">생일 :</label></div>
			<div class="formfield"><input type="date" id="member_birth" name="member_birth" value=""></div>
			
			<div class="fieldlabel"><label for="email">이메일 :</label></div>
			<div class="formfield"><input type="text" id="member_email" name="member_email" size="20" maxlength="20" 
			     value="" autocomplete="off"><span>@</span>
				<input id="domain" list="domains" name="domain" placeholder="선택">
					<datalist id="domains">
		                <option value="naver.com">
		                <option value="daum.net">
		                <option value="gmail.com">
		                <option value="yahoo.co.kr">
		                <option value="직접입력">
		            </datalist>
		    </div>
			
			<div class="fieldlabel"><label for="pwhint">비밀번호 힌트 : </label></div>
			<div class="formfield"><input type="text" id="member_passhint" name="member_passhint" value=""></div>
			
			<div class="fieldlabel"><label for="pwanswer">비밀번호 답변 :</label></div>
			<div class="formfield"><input type="text" id="member_passanswer" name="member_passanswer" value=""></div>
		       
		    <div class="btnfield">
		    	<input type="button" onclick="signUp()" value="회원가입">
		    	<inpyt type="reset" id="resetBtn" value="취소">
		    </div>
		</form>
	</body>
</html>