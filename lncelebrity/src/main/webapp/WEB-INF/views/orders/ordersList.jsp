<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>관리자 주문 페이지</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
	    <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css" />
		<style type="text/css">
			#item-template{display:none;}
		</style>
	    <script type="text/javascript" src="/resources/include/js/jQuery/jquery-1.12.4.min.js"></script>
	    <script type="text/javascript" src="/resources/include/js/common.js"></script>
	    <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	    <script type="text/javascript">
			$(function(){
	    		/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
	    		$(".goDetail").click(function(){
	    			var orders_no = $(this).parents("tr").attr("data-num");
	    			
	    			$.ajax({
						url : "/orders/" + orders_no + ".json",
						type : "get",
						dataType : "json",
						error : function() {
							alert('시스템 오류. 관리자에게 문의 하세요');
						},
						success : function(data) { 
							$(data).each(function() {
								var orders_detail_price = this.orders_detail_price;
								var orders_detail_count = this.orders_detail_count;
								var orders_detail_size = this.orders_detail_size;
								var orders_detail_color = this.orders_detail_color;
								var orders_date = this.orders_date;
								
								template(orders_detail_price, orders_detail_count, orders_detail_size, orders_detail_color, orders_date)
								
								$('#replyModal').modal();
								
						});
						}
					});
	    		});
				
	    		$('button[data-dismiss="modal"]').click(function() {
	    			$('#item-template').empty();
				});
	    		
	    		
	    	// 모달 중복 값 받아올 함수
	    	function template(orders_detail_price, orders_detail_count, orders_detail_size, orders_detail_color, orders_date) {
	    		var $ul = $('#comment_list');
				 
				var $element = $('#item-template').clone().removeAttr('id');
				$element.find('.orders_detail_price').html(orders_detail_price);
			    $element.find('.orders_detail_count').html(orders_detail_count);
			    $element.find('.orders_detail_size').html(orders_detail_size);
			    $element.find('.orders_detail_color').html(orders_detail_color);
			    $element.find('.orders_date').html(orders_date);

			    $ul.append($element);
	    	}
	    		/* 검색 후 검색 대상과 검색 단어 출력 */
	    		var word = "<c:out value='${data.keyword}'/>";
	    		var value = "";
	    		if(word != "") {
	    			$("#keyword").val("<c:out value='${data.keyword}' />");
	    			$("#search").val("<c:out value='${data.search}'/>");
	    			
	    			if($("#search").val() != 'b_content') {
	    				//:contains()는 특정 텍스트를 포함한 요소반환
	    				if($("#search").val() == 'orders_detail_name') value = "#list tr td.godetail";
	    				else if($("#search").val() == 'orders_state') value = "#list tr td.name";
	    				
	    				$(value + ":contains('" + word + "')").each(function() {
	    					var regex = new RegExp(word , 'gi');
	    					$(this).html($(this).html().replace(regex, 
	    							"<span class='required>'" + word + "</span>"));
	    				});
	    			}
	    		}
	    		
	    		/* 검색 대상이 변경될 때마다 처리 이벤트 */
				$("#search").change(function(){
					if($("#search").val() == "all") {
						$("#keyword").val("전체 데이터 조회합니다.");
					} else if($("#search").val() != "all") {
						$("#keyword").val("");
						$("#keyword").focus();					
					}
				});	
	    		
	    		/* 검색 버튼 클릭 시 처리 이벤트 */
	    		$("#searchData").click(function(){
	    			if($("#search").val() != "all") {
	    				if(!chkData("#keyword" , "검색어를")) return;
	    			}
	    			goPage();
	    		});
	    	
	    	
	    	/* 검색을 위한 실질적인 처리 함수 */
	    	function goPage() {
	    		if($("#search").val() == "all") {
	    			$("#keyword").val("");
	    		}
	    		$("#f_search").attr({
	    			"method" : "get",
	    			"action" : "/orders/ordersList"
	    		});
	    		$("#f_search").submit();
	    	}
			
	    	});
	    	
	    </script>
	</head>
	<body>
		<div class="container">
		<form id="detailForm" name="deteilForm">
			<input type="hidden" id="orders_no" name="orders_no">
		</form>
		
		<!-- 게시판 검색 -->
		<div id="boardSearch" class="text-right">
    		<form id="f_search" name="f_search" class="form-inline">
        	<div class="form-group">
            	<label>검색조건</label>
           		<select id="search" name="search" class="form-control">
                	<option value="all">전체</option>
                	<option value="orders_detail_name">작성자</option>
                	<option value="orders_state">주문상태</option>
            	</select>
            	<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" maxlength="20" class="form-control" />
            	<button type="button" class="btn btn-primary btn-sm" id="searchData">검색</button>
        	</div>
    		</form>
		</div>
		
	    <div id="ordersList">
	        	<table summary="게시판 리스트" class="table table-striped">
	            	<thead>
	            	<tr>
	                	<th class="text-center">주문번호</th>
	                	<th class="text-center">주문자</th>
	                	<th class="text-center">주소</th>
	                	<th class="text-center">번호</th>
	                	<th class="text-center">주문상태</th>
	                	<th class="text-center">주문일</th>
	            	</tr>
	            	</thead>
	            	<tbody id="list" class="table-striped">
	            	<!-- 데이터 출력 -->
	            	<c:choose>
	                	<c:when test="${not empty ordersList}">
	                    	<c:forEach var="orders" items="${ordersList}" varStatus="status">
	                        	<tr class="text-center" data-num="${orders.orders_no}">
									<td>${orders.orders_no}</td>
									<td class="text-center" >${orders.orders_detail_name}</td>
									<td class="text-center" >${orders.orders_address}</td>
									<td class="text-center">${orders.orders_phone }</td>
									<td class="text-center">${orders.orders_state}</td> 
									<td class="text-center">${orders.orders_date}</td>
									<td><button type="button" class="goDetail">상세 정보</button></td>
	                        	</tr>
	                    	</c:forEach>
	                	</c:when>
	                	<c:otherwise>
	                    	<tr>
	                        	<td colspan="6" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
	                    	</tr>
	                	</c:otherwise>
	            	</c:choose>
	            	</tbody>
	        	</table>
	    	</div>
		</div>
	
		<%-- ============= 리스트 종료 =============  --%>
		
		<%-- 등록 화면 영역(modal) --%>
			<div class="modal fade bd-example-modal-lg" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="replyModalLabel">상세 정보</h4>
			      </div>
			      <div class="modal-body">
			          <table class="table table-striped">
						<colgroup>
							<col width="10%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="30%"/>
							<col width="30%"/>
						</colgroup>
						<tr>
							<th class="text-center">가격</th>
	                		<th class="text-center">수량</th>
	                		<th class="text-center">size</th>
	                		<th class="text-center">color</th>
	                		<th class="text-center">주문 일</th>
	                		<th colspan="2" class="text-center">주문 처리</th>
						</tr>
						<tbody id="comment_list" class="table-striped">
							<tr id="item-template" class="comment_item">
								<td class="text-center orders_detail_price"></td>
								<td class="text-center orders_detail_count"></td>
								<td class="text-center orders_detail_size"></td>
								<td class="text-center orders_detail_color"></td>
								<td class="text-center orders_date" id="orders_date"></td>
								<td class="text-center">
									<button type="button" class="btn btn-default jordersBtn" data-dismiss="modals">주문 취소</button>
				        			<button type="button" class="btn btn-default hordersBtn" data-dismiss="modals">환불,교환</button>
				        		</td>
							</tr>		
						</tbody>
						<tr>
							<td>총 가격</td>
							<td class="text-left" colspan="4"></td>
						</tr>
					</table>
			      </div>
			      <div class="modal-footer">
			        <button colspan="4" type="button" class="btn btn-default" id="#">최종 완료</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			 </div>
		</div>	
	</body>
</html>