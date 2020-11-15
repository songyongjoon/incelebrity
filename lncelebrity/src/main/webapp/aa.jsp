<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>comment - comment.html</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>comment - comment.html</title>

		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->

		<!-- 공통 css -->		
		<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="../css/comment.css"/>
		
		<style type="text/css">
			#item-template{display:none;}
		</style>
		
		<!-- jQuery Framework 참조하기 -->
		<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>

		<!-- 사용자 스크립트 블록 -->
		<script type="text/javascript">
			var num = 0; 
			
			// 작성자/댓글내용 초기화 함수
			function dataReset(){
				$("#user_name").val("");
				$("#comment").val("");
				$("#user_name").focus();
			} // dataReset 함수 종료.
			
			function template(num, writer, datetime, content){
				var $ul = $('#comment_list');
				 
				var $element = $('#item-template').clone().removeAttr('id');
				$element.attr("data-num", num);
				$element.find('.item-name').html(writer);
			    $element.find('.item-date').html(datetime);
			    $element.find('.item-content').html(content);

			    $ul.append($element); 
			}
			
			
			$(function() {
				$.getJSON("../ajax/comment/comment_list.json", function(data){	
					
					var item = data.comment.item;

					for(var i=0; i < item.length; i++ ){
						num = item[i].num;
						var writer = item[i].writer;
						var content = item[i].content;
						var datetime = item[i].datetime;
						template(num, writer, datetime, content);
					}
					num = item[0].num;
				}).fail(function() {
					alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
				});
				
				/** 덧글 내용 저장 이벤트 */
				$("#comment_form").submit(function() {
					// 작성자 이름에 대한 입력여부 검사
					if ($("#user_name").val().replace(/\s/g,"")=="") {
						alert("작성자를 입력해 주세요.");
						$("#user_name").focus();
						return false;
					}

					// 내용에 대한 입력여부 검사
					if ($("#comment").val().replace(/\s/g,"")=="") {
						alert("댓글 내용을 입력해 주세요.");
						$("#comment").focus();
						return false;
					}

					++num;
					console.log(num);
					var writer = $("#user_name").val();
					var content = $("#comment").val();
					var datetime = new Date().toLocaleString();
					
					// 저장 결과를 새로운 목록으로 출력하기 위해서 함수 호출
					template(num, writer, datetime, content);
					dataReset();
					
					return false;
				});

				/** 삭제 버튼 클릭시에 항목 삭제하도록 "미리" 지정 */
				$(document).on("click", ".delete_btn", function() {
					if (confirm("정말 선택하신 항목을 삭제하시겠습니까?")) {
						var target = $(this).parents(".comment_item");
						target.remove();
						target.removeClass();
					}
				});
			});
		</script>
	</head>
	<body>
		<div id="container">
			<h1>jQuery Comment</h1>
			<div id="comment_write">
				<form id="comment_form">
					<div>
						<label for="user_name">작성자</label>
						<input type="text" name="user_name" id="user_name" />
						<input type="submit" value="저장하기" />
					</div>
					<div>
						<label for="comment">덧글 내용</label>
						<textarea name="comment" id="comment"></textarea>
					</div>
				</form>
			</div>

			<ul id="comment_list">
				<li id="item-template" class="comment_item">
					<p class="writer">
						<span class="item-name"></span>
						<span class="item-date"></span>
						<input type="button" value="삭제하기" class="delete_btn" />
					</p>
					<p class="item-content"></p>	
				</li>
			</ul>
		</div>
	</body>
</html>