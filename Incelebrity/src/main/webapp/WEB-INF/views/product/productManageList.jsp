<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: khotaehyeong
  Date: 20. 11. 11.
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <title>상품 목록</title>
    <link rel="shortcut icon" href="/resources/image/icon.png" />
    <link rel="apple-touch-icon" href="/resources/image/icon.png" />

    <link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.css"/>

    <script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
    <script type="text/javascript" src="/resources/include/js/common.js"></script>
    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function(){
            //검색 후 검색 대상과 검색 단어 출력
            var word="<c:out value='${data}' />";
            var value="";

            if(word!=""){
                $("#keyword").val("<c:out value='${data.keyword}' />");
            }

            $("#insertFormBtn").click(function(){
                location.href = "/product/productManageUpload";
            });
        });
    </script>
</head>
<body>
    <div class="contentBtn text-right">
        <input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-primary" />
    </div>
</body>
</html>
