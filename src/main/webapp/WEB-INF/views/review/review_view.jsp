<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String seqno = request.getParameter("seqno");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_review_view</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/aos.js"></script>
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
	
	
	
	function init(){
		
		fn_UpdateViewCnt();
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
	
	function fn_Delete() {
		
		//Url - 컨트롤러에 던져줄 것
		var sUrl = "${pageContext.request.contextPath}/review/review_delete.ajax" ;
		var params = {
				seqno:"<%=seqno%>"
		};
		
		
		$.ajax({
			url : sUrl, // controller와 매핑할 이름이자 주소
			data : params, // controller로 넘겨줄 data
			method : 'post', // controller로 넘겨줄 방식
			dataType : 'json', // controller로부터 넘겨받을 데이터의 형식
			success : function(response) {
				alert('삭제되었습니다.');
				location.href = './review.do';				
			},	
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
		    }
		});
	}
		
	//조회수 업데이트
	function fn_UpdateViewCnt() {
		//Url - 컨트롤러에 던져줄 것
		var sUrl = "${pageContext.request.contextPath}/review/review_viewcnt.ajax" ;
		var params = {
				seqno:"<%=seqno%>"
		};
		
		
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {

			},	
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
		    }
		});
	}
	
	//좋아요 업데이트
	function fn_LikeCnt() {
		//Url - 컨트롤러에 던져줄 것
		var sUrl = "${pageContext.request.contextPath}/review/review_likecnt.ajax" ;
		var params = {
				seqno:"<%=seqno%>"
		};
		
		
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				alert('좋아요를 눌렀습니다.');
				fn_SearchDetail();
			},	
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
		    }
		});
	}
	/******************************************************************************************** 
	 4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	*********************************************************************************************/ 
	function fn_Bind(response) {
		
		var title = response.result.TITLE;
		var regntnm = response.result.REGNT_NM;
		var regntdtm = response.result.REGNT_DTM;
		var contents = response.result.CONTENTS;
		var like = response.result.LIKE_CNT;
		var view_cnt = response.result.VIEW_CNT;
		
		$(".review_title").text(title);
		$(".review_nm").text(regntnm);
		$(".review_regdtm").text(regntdtm);
		$(".review_contents").text(contents);
		$(".review_likeNum").text(like);
		$(".view_cnt").text(view_cnt);
		
	}
	
	function fn_mod(){
		
		var url = "./review_modify.do";
		var params = "seqno="+seqno;
	
		location.href = url + "?" + params
		
	}
	
	$(document).on("click", ".btn_modify", function(){
		fn_mod();
	});
	/******************************************************************************************** 
	 5. 기타 함수                            						                              														  
	*********************************************************************************************/ 
	
	
	/******************************************************************************************** 
	 6. 이벤트 함수                            						                              														  
	*********************************************************************************************/ 
	</script>
</head>

<body>
    <div class="wrap">
	<%@include file="../include/header.jsp" %>
        <div class="main">
            <div class="inner">
                <div class="tit">
                    <h2>REVIEW</h2>
					<p>수강자 분들의 생생한 후기</p>
                </div>
                <div class="baord">
                    <div class="view">
                        <div class="col01">
                            <h2 class="review_title"></h2>
                            <p class="sm_txt"><span class="review_nm"></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<span class="review_regdtm">2023.05.13</span></p>
                            <p>조회수: <span class="view_cnt"></span></p>
                            <p class="txt_area review_contents">
                            </p>
                            <p class="tac">
                                <button class="btn_like" OnClick="fn_LikeCnt();">
                                    <img class="btn_likeIcon" src="../../img/btn_like.png" alt="like">
                                    <span class="btn_likeNum review_likeNum"></span>
                                </button>
                            </p>
                        </div>
                        <div class="col02">첨부파일이 없습니다</div>
                    </div>
                    <div class="navigation clear">
                        <a href="javascript:///" class="fl nv_prev">이전</a>
                        <a href="../review/review.do">LIST</a>
                        <a href="javascript:///" class="fr nv_next">다음</a>
                    </div>
                    <div class="btn_area mt70">
                        <button class="btn_gray btn_delete" OnClick="fn_Delete();">삭제하기</button>
                        <button class="btn_green btn_modify" onclick = "fn_mod();">수정하기</button>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</body></html>