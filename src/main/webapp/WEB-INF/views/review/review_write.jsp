<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_review_write</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/script.js"></script>
    <script>

	//******************************************************************************************** 
	// 1. 전역변수 선언                               						                              														  
	//*********************************************************************************************/ 
	const BOARD_TYPE = "30";
	
	//******************************************************************************************** 
	// 2. 최초 실행 함수                               						                              														  
	//*********************************************************************************************/ 
	$(document).ready(function() {
		
		init();
		
	});
	
	
	
	function init(){
		
	}
	
	//******************************************************************************************** 
	// 3. ajax 함수                                 						                              														  
	//*********************************************************************************************/ 
		function fn_save(){

// 		var params = {title:"제목", contents:"내용"};
		var params = {};
		params.title = $(".title").val();
		params.contents = $(".contents").val();
		params.regntid = "아이디";
		params.regntnm = "등록자 이름";
		params.modid = "수정자 아이디";
		params.boardType = BOARD_TYPE;
		params.boardSubType = "R";
		
		// jquery가 만든 함수~
		// 파라미터는 json 타입으로 넘겨줘~
		$.ajax({
			
			url:"${pageContext.request.contextPath}/review/review_save.ajax",
			data: params,
			method:"post",
			datatype:"json",
			success: function(response) {

				if(undefined != response.result.msg && "" != response.result.msg){
					alert(response.result.msg);
					location.href="../login/login.do";
				} else {
					alert("저장되었습니다.");
					location.href='../review/review.do';	
				}
			},
			error : function(xhr, error, status) {
				alert("저장 실패");
			},
			complete : function() {}
			
		});
		
	}
	
	//******************************************************************************************** 
	// 4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	//*********************************************************************************************/ 

	
	//******************************************************************************************** 
	// 5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 
	
	
	//******************************************************************************************** 
	// 6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/ 
	$(document).on("click", ".btn_save", function() {
		
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
                    <h2>REVIEW</h2>
					<p>리뷰를 작성해주세요.</p>
                </div>
                <div class="baord bd_write">
                    <table class="tb_type2">
                        <colgroup>
                            <col style="width: 18%">
                            <col style="width: *;">
                        </colgroup>
                        <tr>
                            <th colspan="2" style="height: 40px;"></th>
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
                    </table>
                    <div class="btn_area mt70">
<!--                         <button class="btn_gray">Delete</button> -->
<!--                         <button class="btn_green">Modify</button> -->
						<div class="navigation clear">
							<a href="../review/review.do">LIST</a>
						</div>
						<div class="btn_area mt70">
                        	<button class="btn_blue btn_save">등록하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body></html>