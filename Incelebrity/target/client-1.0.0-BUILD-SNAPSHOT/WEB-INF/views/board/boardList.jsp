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
  		<title>게시판 목록</title>
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
				var word="<c:out value='${data.keyword}'/>";
				var value="";
				if(word!=""){
					$("#keyword").val("<c:out value='${data.keyword}'/>");
					$("#search").val("<c:out value='${data.search}'/>");
					
					if($("search").val()!='b_content'){
						//:contains()는 특정 텍스트를 포함한 요소반환
						if($("#search").val()=='b_title')value = "#list tr td.goDetail";
						else if($("#search").val()=='b_name')value = "#list tr td.name";
						console.log($(value+":contains('"+word+"')").html());
						
						$(value+":contains('"+word+"')").each(function() {
							var regex = new RegExp(word,'gi');
							$(this).html($(this).html().replace(regex, "<span class='required'>"+word+"</sapn>"));
						});
					}
				}
				
				//검색 대상이 변경될 때마다 처리 이벤트
	         	$("#search").change(function() {
	 				if($("#search").val()=="all"){
	 					$("#keyword").val("전체 데이터 조회합니다.");
	 				}else if($("search").val()!="all"){
	 					$("#keyword").val("");
	 					$("#keyword").focus();
	 				}
	 			});
	         	
	         	//검색버튼 클릭 시 처리 이벤트
	         	$("#searchData").click(function() {
	 				if($("#search").val()!="all"){
	 					if(!chkData("#keyword","검색어를"))return;
	 				}
	 				goPage();
	 			});       
	        	 
				
				//글쓰기 버튼 클릭 시 처리 이벤트
				$("#insertFormBtn").click(function(){
					location.href = "/board/writeForm";
				});
				
				//제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트
				$(".goDetail").click(function(){
					var b_num = $(this).parents("tr").attr("data-num");
				$("#b_num").val(b_num);
					console.log("글번호: " + b_num);
					//상세 페이지로 이동하기 위해  form 추가(id: detailForm)
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/board/boardDetail"
					});
					$("#detailForm").submit();
				});
			});
			
			//검색을 위한 실질적인 처리 함수
	    	function goPage() {
				if($("#search").val()=="all"){
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method" : "get",
					"action" : "/board/boardList"
				});
				$("#f_search").submit();
			}
			
		</script>
	</head>
	<body>
		<form id="detailForm" name="detailForm">
			<input type="hidden" id="b_num" name="b_num"/>
		</form>
      
      <%--===================== 검색 기능 시작 ====================== --%>
   <div id="boardSearch" class="text-right">
      <form id="f_search" name="f_search" class="form-inline">
         <div class="form-group">
            <label>검색조건</label>
            <select id="search" name="search" class="form-control">
               <option value="all">전체</option>
               <option value="b_title">제목</option>
               <option value="b_name">작성자</option>
               <option value="b_content">내용</option>
            </select>
            <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" maxlength="20" class="form-control" />
            <button type="button" class="btn btn-primary btn-sm" id="searchData">검색</button>
         </div>
      </form>
   </div>      
   <%--======================검색 기능 종료====================== --%>
   
		
		<div class="container">
			<div id="boardList">
				<table summary="게시판 리스트" class="table table-striped">
					<thead>
						<tr>
							<th class="text-center">글번호</th>
							<th class="text-center">글제목</th>
							<th>작성일</th>
							<th class="text-center">작성자</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty boardList}">
								<c:forEach var="board" items="${boardList}" varStatus="status">
									<tr class="text-center" data-num="${board.b_num}">
										<td>${board.b_num}</td>
										<td class="goDetail text-left">${board.b_title}<c:if test="${board.r_cnt>0}"><span class="cnt">[${board.r_cnt}]</span></c:if></td>
			
										<td class="text-left">${board.b_date}</td>
										<td class="name">${board.b_name}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
							<tr>
								<td colspan="4" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="text-right">
				<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success"/>
			</div>
		</div> 
	</body>
</html>