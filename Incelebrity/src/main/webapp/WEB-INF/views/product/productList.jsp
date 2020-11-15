<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
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
            //상품 클릭 시 상세 페이지 이동을 위한 처리 이벤트
            $(".goDetail").click(function(){
                var product_no = $(this).parents("td").attr("data-num");
                $("#product_no").val(product_no);
                //상세 페이지로 이동하기 위해  form 추가(id: detailForm)
                $("#detailForm").attr({
                    "method" : "get",
                    "action" : "/product/productDetail"
                });
                $("#detailForm").submit();
            });
        });
    </script>
</head>
<body>
<form id="detailForm" name="detailForm">
    <input type="hidden" id="product_no" name="product_no" />
</form>

<div class="container">
    <div id="productList">
        <table summary="상품 리스트" class="table table-striped">
            <c:choose>
                <c:when test="${not empty productList}">
                    <c:forEach var="product" items="${productList}" varStatus="status">
                        <c:if test="${status.index%3 == 0}">
                            <tr class="text-center">
                        </c:if>
                            <td class="text-left" data-num="${product.product_no}">
                                <img src="${product.product_list_img}" width="250px" height="250px" class="goDetail" /><br />
                                <span>${product.product_name}</span>
                            </td>
                        <c:if test="${status.index%3 == 2}">
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4" class="text-center">등록된 상품이 존재하지 않습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>
</body>
</html>