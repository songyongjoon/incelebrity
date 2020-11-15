<%--
  Created by IntelliJ IDEA.
  User: khotaehyeong
  Date: 20. 11. 11.
  Time: 오후 4:19
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
            $("#addFile").click(function(){
                var fileIndex = $('input[type = "file"]').length;

                var addData = '<div class="row">';
                addData += '<div class="col-md-11">';
                addData += '<input type="file" name="images[0].files[' + fileIndex + ']" id="images[0].files[' + fileIndex + ']" class="margin_top btn_block file" /></div>';
                addData += '<div class="col-md-1">';
                addData += '<span class="closeBtn">&times;</span></div></div>';

                $('.table tr:nth-child(1) td:eq(0)').attr("rowspan", fileIndex + 1);
                $('.table tr:nth-child(1) td:eq(1)').append(addData);
            });

            $(document).on("click", ".closeBtn", function(){
                var fileIndex = $('input[type="file"]').length;

                $('.table tr:nth-child(1) td:eq(0)').attr("rowspan", 1);
                $(this).parents("div.row").remove();
                $("div.row .col-md-11 input[type='file']").each(function(index){
                    console.log(fileIndex + "/" + index);

                    $(this).attr("name", "images[0].files[" + index + "]");
                });
            });

            $("#productManageInsertBtn").click(function(){ //경고 문구랑 유효성 검증 제대로 넣기
                if(!chkSubmit($('#product_name'), "상품명을")) return;
                else if(!chkSubmit($('#product_content'), "내용을")) return;
                else{
                    $('.file').each(function(){
                        if($(this).val() != ""){
                            if(!chkFile($(this))) exit = true;
                            else exit = false;
                        }
                        else if($(this).val() == ""){
                            if(!chkSubmit($(this), "파일을")) exit = true;
                            else exit = false;
                        }
                    });

                    if(exit){
                        return false;
                    }

                    $("div.row .col-md-11 input[type='file']").each(function(){
                        if($(this).val() == ""){
                            $(this).parents("div.row").remove();
                        }
                    });

                    $("div.row .col-md-11 input[type='file']").each(function(index){
                       var fileIndex = $(".existing_file").length;
                       if($(this).val()!=""){
                           $(this).attr("name", "images[" + fileIndex + "].files[" + index++ + "]");
                       }
                    });

                    $("#f_writeForm").attr({
                        "method" : "post",
                        "enctype" : "multipart/form-data",
                        "action" : "/product/productManageInsert"
                    });
                    $("#f_writeForm").submit();
                }
            });
        });
    </script>
</head>
<body>
    <form id="f_writeForm" name="f_writeForm"> <%-- 옵션도 리스트 형식으로 바꿔서 한번에 여러 옵션을 올릴 수 있게 --%>
        상품명 : <input type="text" name="product_name" id="product_name" />
        수량 : <input type="number" name="product_detail_stock" id="product_detail_stock" />
        색상 : <input type="text" name="product_detail_color" id="product_detail_color" />
        가격 : <input type="number" name="product_price" id="product_price" />
        크기 : <select name="product_detail_size" id="product_detail_size">
                <option value="F">Freesize</option>
                <option value="S">S</option>
                <option value="M">M</option>
                <option value="L">L</option>
            </select>
        내용 : <input type="text" name="product_content" id="product_content" />
        <table class="table">
            <tr>
                <td>
                    리스트 파일 추가 : <input type="file" name="list_image" class="margin_top btn_block file" />
                    컨텐츠 파일 추가 : <input type="file" name="content_image" class="margin_top btn_block file" />
                    <button type="button" id="addFile" class="btn btn-default btn-block">첨부파일추가</button>
                </td>
                <td class="text-left"></td>
            </tr>
        </table>
    </form>
    <input type="button" value="저장" id="productManageInsertBtn" class="btn btn-primary" />
</body>
</html>
