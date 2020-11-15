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
					
					if($("search").val()!='notice_content'){
						//:contains()는 특정 텍스트를 포함한 요소반환
						if($("#search").val()=='notice_title')value = "#list tr td.goDetail";
						else if($("#search").val()=='notice_name')value = "#list tr td.name";
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
				
				//제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트
				$(".goDetail").click(function(){
					var notice_no = $(this).parents("tr").attr("data-num");
				$("#notice_no").val(notice_no);
					console.log("글번호: " + notice_no);
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/notice/noticeDetail"
					});
					$("#detailForm").submit();
				});
				
				$("paginate_button a").click(function(e) {
					e.preventDefault();
					$("#f_search").find("input[name='[ageNum']").val($(this).attr("href"));
					goPage();
				});
			});
			
			//검색을 위한 실질적인 처리 함수
	    	function goPage() {
				if($("#search").val()=="all"){
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method" : "get",
					"action" : "/notice/noticeList"
				});
				$("#f_search").submit();
			}
	    	function selChange() {
	    	      var sel = document.getElementById('cntPerPage').value;
	    	      location.href="noticeList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	    	   }
			
		</script>
	</head>
	<body>
		<form id="detailForm" name="detailForm">
			<input type="hidden" id="notice_no" name="notice_no"/>
		</form>
		
		<form id="detailForm">
         <input type="hidden" id="notice_no" name="notice_no" />
      </form>
      
      <%--===================== 검색 기능 시작 ====================== --%>
   <div id="noticeSearch" class="text-right">
      <form id="f_search" name="f_search" class="form-inline">
         <div class="form-group">
            <label>검색조건</label>
            <select id="search" name="search" class="form-control">
               <option value="all">전체</option>
               <option value="notice_title">제목</option>
               <option value="notice_name">작성자</option>
               <option value="notice_content">내용</option>
            </select>
            <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" maxlength="20" class="form-control" />
            <button type="button" class="btn btn-primary btn-sm" id="searchData">검색</button>
         </div>
      </form>
   </div>      
   <%--======================검색 기능 종료====================== --%>
  
		
		<div class="container">
			<div id="noticeList">
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
							<c:when test="${not empty viewAll}">
								<c:forEach var="notice" items="${viewAll}" varStatus="status">
									<tr class="text-center" data-num="${notice.notice_no}">
										<td>${notice.notice_no}</td>
										<td class="goDetail text-left">${notice.notice_title}</td>
										<td class="text-left">${notice.notice_writeday}</td>
										<td class="name">${notice.notice_name}</td>
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
			</div>
		</div> 
		 <div style="display: block; margin-bottom: 100px; text-align: center;">      
      <c:if test="${paging.startPage != 1 }">
         <a href="/notice/noticeList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
      </c:if>
      <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b>${p }</b>
            </c:when>
            <c:when test="${p != paging.nowPage }">
               <a href="/notice/noticeList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
            </c:when>
         </c:choose>
      </c:forEach>
      <c:if test="${paging.endPage != paging.lastPage}">
         <a href="/notice/noticeList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
      </c:if>
   </div>
	</body>
</html>