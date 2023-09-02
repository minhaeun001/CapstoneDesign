<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String seqno = request.getParameter("seqno");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_notice_view</title>
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
		
		var sUrl = "${pageContext.request.contextPath}/notice/notice_view.ajax" ;
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
		var sUrl = "${pageContext.request.contextPath}/notice/notice_delete.ajax" ;
		var params = {
				seqno:"<%=seqno%>"
		};
		
		
		$.ajax({
			url : sUrl, // controller와 매핑할 이름이자 주소
			data : params, // controller로 넘겨줄 data
			method : 'post', // controller로 넘겨줄 방식
			dataType : 'json', // controller로부터 넘겨받을 데이터의 형식
			success : function(response) {
				location.href = './notice.do';				
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
		var sUrl = "${pageContext.request.contextPath}/notice/notice_viewcnt.ajax" ;
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
		var sUrl = "${pageContext.request.contextPath}/notice/notice_likecnt.ajax" ;
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
		var category_nm = response.result.CATEGORY_NM;
		var like = response.result.LIKE_CNT;
		var view_cnt = response.result.VIEW_CNT;
		
		$(".notice_title").text(title);
		$(".notice_nm").text(regntnm);
		$(".notice_regdtm").text(regntdtm);
		$(".notice_contents").html(contents);
		$(".notice_category").text(category_nm);
		$(".notice_likeNum").text(like);
		$(".view_cnt").text(view_cnt);
		
	}
	
	function fn_mod(){
		
		var url = "./notice_modify.do";
		var params = "seqno="+seqno;
	
		location.href = url + "?" + params
		
	}
	
	$(document).on("click", ".btn_modify", function(){
		fn_mod();
	});
	
	$(document).on("click", ".btn_delete", function() {
	    if (confirm("게시글을 삭제하시겠습니까?")) {
	    	fn_Delete();
	    } else {
	        // 사용자가 취소를 선택한 경우
	        // 아무 작업도 수행하지 않음
	    }
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
                    <h2>NOTICE</h2>
					<p>MAKEGYM 운영팀에서 알려 드립니다.</p>
                </div>
                <div class="baord">
                    <div class="view">
                        <div class="col01">
                            <span class="notice_category"><strong></strong></span>
                            <h2 class="notice_title"></h2>
                            <p class="sm_txt"><span class="notice_nm"></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<span class="notice_regdtm">2023.05.13</span></p>
                            <p>조회수: <span class="view_cnt"></span></p>
                            <p class="txt_area notice_contents">
                            </p>
                            <p class="tac">
                                <button class="btn_like" OnClick="fn_LikeCnt();">
                                    <img class="btn_likeIcon" src="../../img/btn_like.png" alt="like">
                                    <span class="btn_likeNum notice_likeNum"></span>
                                </button>
                            </p>
                        </div>
                        <div class="col02">첨부파일이 없습니다</div>
                    </div>
                    <div class="navigation clear">
                        <a href="javascript:///" class="fl nv_prev">이전</a>
                        <a href="../notice/notice.do">LIST</a>
                        <a href="javascript:///" class="fr nv_next">다음</a>
                    </div>
                    <div class="btn_area mt70">
                        <button class="btn_gray btn_delete"">삭제하기</button>
                        <button class="btn_green btn_modify" onclick = "fn_mod();">수정하기</button>
                    </div> 
                </div>

                <div class="comments clear">
                    <div class="cm_write clear">
                        <textarea name="" id="" cols="160" rows="10"></textarea>
                        <button class="btn_comments">댓글 달기</button>
                    </div>
                    <ul class="cm_list">
                        <li>
                            <p><em>박윤선</em><span>2023.05.13</span></p>
                            <div class="cm_txt">답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.</div>
                            <button class="btn_reply">댓글</button>
                            <div class="reply_write clear">
                                <textarea name="" id="" cols="100" rows="2" placeholder="댓글을 입력해주세요."></textarea>
                                <div class="rp_btn">
                                    <button>댓글 수정</button>
                                    <button>댓글 삭제</button>
                                </div>
                            </div>
                            <div class="btnRight">
                            </div>
                        </li>
                        <li>
                            <p><em>박윤선</em><span>2023.05.13</span></p>
                            <div class="cm_txt">게시판에 동일 내용 문의로 답변 갈음함</div>
                            <button class="btn_reply">댓글</button>
                            <div class="btnRight">
                                    <button>댓글 수정</button>
                                    <button>댓글 삭제</button>
                            </div>
                        </li>
                        <li>
                            <div class="reply_view">
                                <p><em>박정윤</em><span>2023.05.13</span></p>
                                <div class="re_reply"><em>민하은</em>
                                    <p>답글에 대한 댓글.</p>
                                </div>
                                <button class="btn_reply">댓글</button>
                                <div class="reply_write clear">
                                    <textarea name="" id="" cols="120" rows="2" placeholder="대댓글을 입력해주세요."></textarea>
                                    <div class="rp_btn">
                                        <button>대댓글 수정</button>
                                        <button>대댓글 삭제</button>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body></html>