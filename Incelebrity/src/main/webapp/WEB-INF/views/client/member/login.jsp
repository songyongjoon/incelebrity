<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
		
		<script type="text/javascript">

		function loginValidation(){
			
			var userId = $("#member_id").val();
			var password = $("#member_passwd").val();
			
			if(!userId){
				alert("아이디를 입력하세요.");
				$("#member_id").focus();
				return false;
			}else if(!password){
				alert("비밀번호를 입력하세요.");
				$("#member_passwd").focus();
				return false;
			}else {
				login(member_id,member_passwd);
			}	
		}

		function login(member_id,member_passwd){
			
			$.ajax({
				
				url : "/member/login",
				type : 'POST',
				data : { userId : userId, 
						password : password	
				},
				success:function(data){
					if(data == 2){
						alert("아이디 혹은 비밀번호가 맞지 않습니다.");
						return false;
					}else if(data == 3){
						location.href="/";
					}
				}
				
			});
			
		}

		function enterKeyCheck(){
			
		 if(event.keyCode == 13)
			  {
			 loginValidation();
			  }
		}

		</script>

		</head>
		<body>

		<form class="signUp" id="signupForm">
		   <input type="text" id="userId" class="signUpInput" placeholder="ID" autofocus onkeyup="enterKeyCheck()">
		   <input type="password" id="password" class="signUpInput" placeholder="Password" onkeyup="enterKeyCheck()">
		   <input type="button" value="로그인" onclick="loginValidation()" class="loginButton">
		   <input type="button" value="회원가입" onclick="location.href='/member/signUp'" class="signUpButton">
		</form>

		</body>
	</html>