<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title><tiles:getAsString name="title" /></title>
        
    <link rel="icon" href="/resources/images/common/icon.png">

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/include/dist/css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="/resources/include/dist/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<link rel="stylesheet" type="text/css" href="/resources/include/css/admin.css" />
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script> 
	<script type="text/javascript">
		$(function(){
			var errorMsg = "${errorMsg}";
			if(errorMsg!=""){
				alert(errorMsg);
				errorMsg = "";
			}
			
			$("#login").click(function(){
				if (!chkData("#adminId","아이디를"))	return;
				else if (!chkData("#adminPwd","비밀번호를"))	return;
				else {
					$("#loginForm").attr({
						"method":"POST",
						"action":"/admin/login"
					});
					$("#loginForm").submit();
				}
			});
		});
	
	</script>
  </head>

  <body>

    <div class="container">

      <form class="form-signin" id="loginForm">
        <h2 class="form-signin-heading">관리자 로그인</h2>
        <label for="adminid" class="sr-only">관리자아이디</label>
        <input type="text" id="adminId" name="adminId" class="form-control" placeholder="아이디">
        <label for="adminpwd" class="sr-only">비밀번호</label>
        <input type="password" id="adminPwd" name="adminPwd" class="form-control" placeholder="비밀번호">
        <button class="btn btn-lg btn-primary btn-block" type="button" id="login">로그인</button>
      </form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
