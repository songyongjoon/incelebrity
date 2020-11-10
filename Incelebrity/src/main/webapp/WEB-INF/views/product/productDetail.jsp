<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
  		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
  		<title>게시판 글 쓰기</title>
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.css"/>
		
		<script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<tr>
						<td>
							<img src='${productData.product_list_img}' />
							<img src="/resources/image/top01.jpg" />
						</td>
						<td>
							${productData.product_name}
							${productData.product_price}
								<select>
							<c:forEach var="product" items="${productDetailData}" varStatus="status">
								<option>${product.product_detail_color} / ${product.product_detail_size} / 남은수량 : ${product.product_detail_stock}</option>
							</c:forEach>
								</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							${productData.product_content}
							<img src="${productData.product_content_img}" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							리플 나오는 곳
<%--							<jsp:include page="reply.jsp" />--%>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		
<%--		<form name="f_data" id="f_data" method="post">--%>
<%--			<input type="hidden" name="b_num" value="${detail.b_num}"/>--%>
<%--		</form>--%>
	</body>
</html>