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
			$(function(){				
				//목록 버튼 클릭 시 처리 이벤트
				$("#noticeListBtn").click(function(){
					location.href="/notice/noticeList";
				});
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<colgroup>
						<col width="17%"/>
						<col width="33%"/>
						<col width="17%"/>
						<col width="33%"/>
					</colgroup>
					<tbody>
						<tr>
							<td>글번호</td>
							<td class="text-left">${detail.notice_no}</td>
							<td>작성일</td>
							<td class="text-left">${detail.notice_writedate}</td>
						</tr>
						<tr>
							<td>글제목</td>
							<td class="text-left" colspan="3">${detail.notice_title}</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td class="text-left" colspan="3">${detail.notice_name}</td>
						</tr>
						<tr class="table-height">
							<td>글내용</td>
							<td class="text-left" colspan="3">${detail.notice_content}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="b_num" value="${detail.notice_no}"/>
		</form>
		
		<div class="text-right">
			<input type="button" value="목록" id="noticeListBtn" class="btn btn-success"/>
		</div>
	</body>
</html>