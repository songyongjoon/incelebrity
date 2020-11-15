<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title><tiles:getAsString name="title" /></title> <!-- 값을 불러옴 -->

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/resources/include/js/jQuery/jquery-1.12.4.min.js"></script>
  </head>

  <body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
    	<!-- 외부에서 가져옴 'header'로 명시된 친구를 -->
    	<tiles:insertAttribute name="header" />
    </nav>

    <!-- Begin page content -->
    <div class="container">
    	<div class="jumbotron">
    		<div class="container">
        		<h1>옷 쇼핑몰</h1>
        		<p>만들자...</p>
        		<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
      		</div>
    	</div>
    	
    	<div class="row">
	        <!-- 테스트 -->
	        <div class="col-md-4">
	          <h2>orders 관리자</h2>
	          <p></p>
	          <p><a class="btn btn-default" href="orders/ordersList" role="button">이동 &raquo;</a></p>
	        </div>
	        <div class="col-md-4">
	          <h2>마이페이지 주문</h2>
	          <p></p>
	          <p><a class="btn btn-default" href="mypage/myOrdersList" role="button">이동 &raquo;</a></p>
	        </div>
	    </div>
	</div>

    <footer class="footer">
    	<tiles:insertAttribute name="footer" />
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>