<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		
		<title>Insert title here</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="resources/js/html5shiv.js"></script>
		<![endif]-->
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
    	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css" />
		
		<script type="text/javascript" src="/resources/include/js/jQuery/jquery-1.12.4.min.js"></script>
  		<script type="text/javascript" src="/resources/include/js/common.js"></script>
    	<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">	
			$(function() {
				/* 댓글 등록 버튼 클릭시 모달창 설정 작업 */
				$("#showOrdersDetailBtn").click(function() {
					updateForm(orders_no);
					setModal("상세 정보", "insertBtn", "상세 정보 보기");
					$('#replyModal').modal();
				});
				
				/* 수정 폼 화면 구현 함수 */
				function updateForm(orders_no) {
					$.ajax({
						url : "/all/" + orders_no + ".json",
						type : "get",
						dataType : "json",
						error : function() {
							alert('시스템 오류. 관리자에게 문의 하세요');
						},
						success : function(data) {
							$("#orders_detail_name").val(data.orders_detail_name);
							$("#orders_detail_price").val(data.orders_detail_price);
							$("#orders_detail_color").val(data.orders_detail_color);
							$("#orders_date").val(data.orders_date);
							

							setModal("상세 정보 불러오기", "ListBtn", "불러오기");
							$('#replyModal').modal();
						}
					});
				}
				
				/* 글 삭제를 위한 Ajax 연동 처리 */
				function deleteBtn(b_num, r_num) {
					if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
						$.ajax({
							url : '/replies/' + r_num,
							type : 'delete',
							headers : {
								"X-HTTP-Method-Override" : "DELETE"
							},
							dataType : 'text',
							error : function() {
								alert('시스템 오류. 관리자에게 문의 하세요');
							},
							success : function(result) {
								console.log("result");
								if (result == 'SUCCESS') {
									alert("댓글 삭제가 완료 되었습니다.");
									listAll(b_num);
								}
							}
						});
					}
				}
			}); // 최상위 $ 종료.

			/* 모달창 초기화 */
			function setModal(title, value, text) {
				$("#replyModalLabel").html(title);
				$("#replyInsertBtn").attr("data-button", value);
				$("#replyInsertBtn").html(text);
			}

		</script>
	</head>
	<body>
		<div id="replyContainer">
			<%-- 등록 버튼 영역 --%>
			<p class="text-right">
			<button type="button" class="btn btn-success" id="showOrdersDetailBtn">
			상세 정보</button><!-- data-target="#exampleModal" data-whatever="@mdo" -->
			<p>
			
			<%-- 리스트 영역 --%>
			<div id="reviewList"></div>
			
			<%-- 등록 화면 영역(modal) --%>
			<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="replyModalLabel">상세 정보</h4>
			      </div>
			      <div class="modal-body">
			          <table class="table table-bordered">
						<colgroup>
							<col width="17%"/>
							<col width="33%"/>
							<col width="17%"/>
							<col width="33%"/>
						</colgroup>
						<tr>
							<td>총 가격</td>
							<td colspan="3" class="text-left" id="orders_detail_price"></td>
						</tr>
						<tr>
							<td>size</td>
							<td colspan="3" class="text-left" id="orders_detail_size"></td>
						</tr>
						<tr>
							<td>color</td>
							<td colspan="3" class="text-left" id="orders_detail_color"></td>
						</tr>
						<tr>
							<td>주문 날짜</td>
							<td colspan="3" class="text-left" id="orders_date"></td>
						</tr>
					</table>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" id="#">주문 완료</button>
			        <button type="button" class="btn btn-default" id="#">주문 취소</button>
			        <button type="button" class="btn btn-default" id="#">환불,반품 처리</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			 </div>
		</div>
		</div>
	</body>
</html>