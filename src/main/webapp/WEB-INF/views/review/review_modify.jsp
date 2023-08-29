<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String seqno = request.getParameter("seqno");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_review_modify</title>
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
	var seqno = "<%=seqno%>";
	
	/******************************************************************************************** 
	 2. 최초 실행 함수                               						                              														  
	*********************************************************************************************/ 
	$(document).ready(function() {
		
		init();
	});
	
	//초기화 작업
	function init(){
		
		fn_SearchDetail();
	}
	
	/******************************************************************************************** 
	 3. ajax 함수                                 						                              														  
	*********************************************************************************************/ 
	// 게시글 상세 페이지 호출
	function fn_SearchDetail() {
		
		var sUrl = "${pageContext.request.contextPath}/review/review_view.ajax" ;
		var params = {
				seqno:"<%=seqno%>"
		};
		
		
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				
				fn_Bind(response);
				
			},	
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
		    }
		});
	}
	
	
	
	function fn_modify(){

		var sUrl = "${pageContext.request.contextPath}/review/review_modify.ajax" ;

		
// 		var params = {title:"제목", contents:"내용"};
		var params = {};		
		params.title = $(".title").val();
		params.contents = $(".contents").val();
		params.seqno = seqno;
// 		params.regntid = "아이디";
// 		params.attachfile = "첨부파일";
// 		params.regntnm = "등록자 이름";
// 		params.modid = "수정자 아이디";
// 		params.boardtype = "30";
		
		// jquery가 만든 함수~
		// 파라미터는 json 타입으로 넘겨줘~
		$.ajax({
			
			url:sUrl,
			data: params,
			method:"post",
			datatype:"json",
			success: function(response) {
				
				alert("수정되었습니다.");
				location.href='./review_view.do?seqno='+seqno;
				
			},
			error : function(xhr, error, status) {
				alert("저장 실패");
			},
			complete : function() {}
			
		});
		
	}
	
	/******************************************************************************************** 
	 4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	*********************************************************************************************/ 
	function fn_Bind(response) {
		
		var title = response.result.TITLE;
		var contents = response.result.CONTENTS;
		
		$(".review_title").val(title);
		$(".review_contents").val(contents);
		
	}
	
	
	
	
	
	/******************************************************************************************** 
	 5. 기타 함수                            						                              														  
	*********************************************************************************************/ 
	
	
	/******************************************************************************************** 
	 6. 이벤트 함수                            						                              														  
	*********************************************************************************************/ 
	//"저장" 버튼 클릭 시 수정 내용 서버로 전송
	$(document).on("click", ".btn_modify", function(){
		
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
		
        fn_modify();
	});
</script>
</head>

<body>
    <div class="wrap">
	<%@include file="../include/header.jsp" %>
        <div class="main">
            <div class="inner">
                <div class="tit">
                    <h2>review</h2>
					<p>MAKEGYM 운영팀에서 알려 드립니다.</p>
                </div>
                <div class="baord bd_write">
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
                                    <span><input type="radio" id="important" name="category"><label for="important">중요 공지</label></span>
                                    <span><input type="radio" id="normal" name="category"><label for="normal">일반 공지</label></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                            <th>TITLE&nbsp;&nbsp;<span class="require">*</span></th>
                            <td><input type="text" class="title review_title" style="width: 100%"></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                            <th>CONTENTS&nbsp;&nbsp;<span class="require">*</span></th>
                            <td><textarea name="" id="" class="contents review_contents"></textarea></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                            <th>FILE</th>
                            <td><input type="file" style="width: 100%"></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                    </table>
                    <div class="btn_area mt70">
                        <button class="btn_blue btn_modify">수정하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body></html>