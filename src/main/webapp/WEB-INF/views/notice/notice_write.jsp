<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_notice_write</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/script.js"></script>
    <script>

	/******************************************************************************************** 
	 1. 전역변수 선언                               						                              														  
	*********************************************************************************************/ 
	const BOARD_TYPE = "20";
	
	/******************************************************************************************** 
	 2. 최초 실행 함수                               						                              														  
	*********************************************************************************************/ 
	$(document).ready(function() {
		
		init();
		
	});
	
	
	
	function init(){
		
	}
	
	/******************************************************************************************** 
	 3. ajax 함수                                 						                              														  
	*********************************************************************************************/ 
	function fn_save(){
		var sUrl = "${pageContext.request.contextPath}/notice/notice_save.ajax"

		var data = new FormData();
		data.append( "files", $("#file1")[0].files[0] );
		data.append( "files", $("#file2")[0].files[0] );
		data.append( "title", $(".title").val());
		data.append( "contents", $(".contents").val());
		data.append( "regntid", "아이디");
		data.append( "regntnm", "등록자 이름");
		data.append( "modid", "수정자 아이디");
		data.append( "boardtype", BOARD_TYPE);
		data.append( "category", $("input[name='category']:checked").val());
		
		$.ajax({
			type: 'POST',
			enctype: 'multipart/form-data',
			url: sUrl,
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 60000,
			success: function(response) {
				
				alert("저장되었습니다.");
				location.href='../notice/notice.do';
				
			},
			error : function(xhr, error, status) {
				alert("저장에 실패했습니다. 다시 시도해주세요.");
			},
			complete : function() {}
			
		});
		
	}
	
	
	/******************************************************************************************** 
	 4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	*********************************************************************************************/ 

	/******************************************************************************************** 
	 5. 기타 함수                            						                              														  
	*********************************************************************************************/ 
	
	
	/******************************************************************************************** 
	 6. 이벤트 함수                            						                              														  
	*********************************************************************************************/ 
	$(document).on("click", ".btn_save", function() {
	    var radioValue = $("input[name='category']:checked").val();
	    
		if (!radioValue){
			alert("분야를 선택해주세요.");
			return ;
		}
		if ($(".title").val() === "") {
			alert("제목은 필수항목입니다.");
			$(".title").focus();
			return ;
		}
		if ($(".contents").val() === "") {
			alert("분문은 필수항목입니다.");
			$(".contents").focus();
			return ;
		}
		fn_save();
	});
	
</script>
</head>

<body>
    <div class="wrap">
	<%@include file="../include/header.jsp" %>
        <div class="main">
            <div class="inner">
                <div class="tit">
                    <h2>NOTICE</h2>
					<p>MAKEGYM 운영팀에서 알려 드립니다.</p>
                </div>
                <div class="baord bd_write">
                <form method="POST" enctype="multipart/form-data" id="fileUploadForm" name="fileUploadForm">
                    <table class="tb_type2">
                        <colgroup>
                            <col style="width: 18%">
                            <col style="width: *;">
                        </colgroup>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                        <tr>
                            <th>CATEGORY&nbsp;&nbsp;<span class="require">*</span></th>
                            <td>
                                <div class="radioArea">
                                    <span><input type="radio" id="important" name="category" value="10"><label for="important">중요 공지</label></span>
                                    <span><input type="radio" id="normal" name="category" value="20"><label for="normal">일반 공지</label></span>
                                    <span><input type="radio" id="etc" name="category" value="30"><label for="etc">기타</label></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                            <th>TITLE&nbsp;&nbsp;<span class="require">*</span></th>
                            <td><input type="text" class="title" style="width: 100%"></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                            <th>CONTENTS&nbsp;&nbsp;<span class="require">*</span></th>
                            <td><textarea name="" id="" class="contents"></textarea></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                            <th>FILE</th>
                            <td><input type="file" name="files" id="file1" style="width: 100%"></td>
                        </tr>
                         <tr>
                            <th>FILE</th>
                            <td><input type="file" name="files" id="file2" style="width: 100%"></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                    </table>
               </form>
                    <div class="btn_area mt70">
<!--                         <button class="btn_gray">Delete</button> -->
<!--                         <button class="btn_green">Modify</button> -->
                        <button class="btn_blue btn_save">등록하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body></html>