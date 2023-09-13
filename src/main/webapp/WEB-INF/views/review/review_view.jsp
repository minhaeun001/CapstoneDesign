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

	//******************************************************************************************** 
	// 1. 전역변수 선언                                      						                              														  
	//*********************************************************************************************/ 
	var seqno = "<%=seqno%>";
	var  tmpSeqnno = seqno;
	
	
	//******************************************************************************************** 
	// 2. 최초 실행 함수                               						                              														  
	//*********************************************************************************************/ 
	$(document).ready(function() {
		
		init();
		
	});
	
	
	
	function init(){
		if( "null"  == "<%=(String) session.getAttribute("m_id")%>"  || "" == "<%=(String) session.getAttribute("m_id")%>") {
			$("#btn_modify").hide();
			$("#btn_delete").hide();
		}
		
		fn_UpdateViewCnt();
		fn_SearchDetail(seqno);
		
	}
	
	//******************************************************************************************** 
	// 3. ajax 함수                                 						                              														  
	//*********************************************************************************************/ 
	
	// 게시글 상세 페이지 호출
	function fn_SearchDetail(tmpSeqnno) {
		
		var sUrl = "${pageContext.request.contextPath}/review/review_view.ajax" ;
		var params = {
				seqno:tmpSeqnno
		};
		
		
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				if(response.result == null ) {
	        		alert("게시글이 없습니다.");
	        	} else {
	        		tmpSeqnno  = response.result.SEQ_NO;
	        		fn_Bind(response);	
	        	}
				
			},	
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
		    }
		});
	}
	
	function fn_Delete(tmpSeqnno) {
		
		//Url - 컨트롤러에 던져줄 것
		var sUrl = "${pageContext.request.contextPath}/review/review_delete.ajax" ;
		var params = {
				seqno:tmpSeqnno
		};
		
		
		$.ajax({
			url : sUrl, // controller와 매핑할 이름이자 주소
			data : params, // controller로 넘겨줄 data
			method : 'post', // controller로 넘겨줄 방식
			dataType : 'json', // controller로부터 넘겨받을 데이터의 형식
			success : function(response) {
				alert('삭제되었습니다.');
				location.href = '../review/review.do';				
			},	
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
		    }
		});
	}
		
	//조회수 업데이트
	function fn_UpdateViewCnt(tmpSeqnno) {
		//Url - 컨트롤러에 던져줄 것
		var sUrl = "${pageContext.request.contextPath}/review/review_viewcnt.ajax" ;
		var params = {
				seqno:tmpSeqnno
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
	function fn_LikeCnt(tmpSeqnno) {
		//Url - 컨트롤러에 던져줄 것
		var sUrl = "${pageContext.request.contextPath}/review/review_likecnt.ajax" ;
		var params = {
				seqno:tmpSeqnno
		};
		
		
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				
				if(response.flag != "T"){
					alert(response.msg);
					
					return ;
				}
				
				$(".review_likeNum").text(response.result.updateCnt);
				alert('좋아요를 눌렀습니다.');
				
			},	
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
		    }
		});
	}
	                         
	
	function fn_Prev() {
	    var sUrl = "${pageContext.request.contextPath}/review/review_prev.ajax";
		
	    var params = {
	        seqno: tmpSeqnno
	    };	    
	    
	    $.ajax({
	        url: sUrl,
	        data: params,
	        method: 'post',
	        dataType: 'json',
	        success: function (response) {
	        	if(response.result == null ) {
	        		alert("다음 게시글이 없습니다.");
	        	} else {
	        		tmpSeqnno  = response.result.SEQ_NO;
	        		fn_Bind(response);	
	        	}
	        },
	        error: function (xhr, status, error) {
	            alert("error");
	        },
	        complete: function () {}
	    });
	}

	// 다음글로 넘기기
	function fn_Next() {
	    var sUrl = "${pageContext.request.contextPath}/review/review_next.ajax";
		
	    var params = {
	        seqno: tmpSeqnno 
	    };	    
	    
	    $.ajax({
	        url: sUrl,
	        data: params,
	        method: 'post',
	        dataType: 'json',
	        success: function (response) {
	        	if(response.result == null  ){
	        		alert("이전 게시글이 없습니다.");
	        	} else {
	        		tmpSeqnno  = response.result.SEQ_NO;
	        		fn_Bind(response);	
	        	}
	        },
	        error: function (xhr, status, error) {
	            alert("error");
	        },
	        complete: function () {}
	    });
	}
	
	function fn_CommentsSave(){
	    var sUrl = "${pageContext.request.contextPath}/review/review_comments_save.ajax";
	    
	    var params = {
	        seqno: tmpSeqnno
	    };	    
	    
	    params.regntid = "";
	    params.regntnm = "";
	    params.modid = "";
	    
	    $.ajax({
	        url: sUrl,
	        data: params,
	        method: 'post',
	        dataType: 'json',
	        success: function (response) {
	        	if(response.result == null  ){
	        		alert("이전 게시글이 없습니다.");
	        	} else {
	        		tmpSeqnno  = response.result.SEQ_NO;
	        		fn_Bind(response);	
	        	}
	        },
	        error: function (xhr, status, error) {
	            alert("error");
	        },
	        complete: function () {}
	    });
	}
	//******************************************************************************************** 
	// 4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	//*********************************************************************************************/ 
	function fn_Bind(response) {
		
		var title = response.result.TITLE;
		var regntnm = response.result.REGNT_NM;
		var regntdtm = response.result.REGNT_DTM;
		var contents = response.result.CONTENTS;
		var like = response.result.LIKE_CNT2;
		var view_cnt = response.result.VIEW_CNT;
		
		$(".review_title").text(title);
		$(".review_nm").text(regntnm);
		$(".review_regdtm").text(regntdtm);
		$(".review_contents").text(contents);
		$(".review_likeNum").text(like);
		$(".view_cnt").text(view_cnt);
		
	}
	
	function fn_mod(tmpSeqnno){
		
		var url = "../review/review_modify.do";
		var params = "seqno="+tmpSeqnno;
	
		location.href = url + "?" + params
		
	}

	
	//******************************************************************************************** 
	// 5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 
	
	
	//******************************************************************************************** 
	//6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/ 
	
	// "이전" 버튼 클릭 시 이벤트 처리
	$(document).on("click", ".nv_next", function() {
		fn_Prev();
	});

	// "다음" 버튼 클릭 시 이벤트 처리
	$(document).on("click", ".nv_prev", function() {
		fn_Next();
	});
	
	$(document).on("click", "#btn_modify", function(){
		fn_mod(tmpSeqnno);
	});
	
	$(document).on("click", "#btn_delete", function(){
	    if (confirm("게시글을 삭제하시겠습니까?")) {
	    	fn_Delete(tmpSeqnno);
	    } else {
	        // 사용자가 취소를 선택한 경우
	        // 아무 작업도 수행하지 않음
	    }
	});
	
	$(document).on("click", ".btn_like", function(){
		fn_LikeCnt(tmpSeqnno);
	});
	
	$(document).on("click", ".btn_reply", function () {
	    $(this).siblings(".reply_write").slideToggle();
	});
	
	$(document).on("click", "#btn_comments", function(){
		fn_CommentsSave(tmpSeqnno);
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
                                <button class="btn_like">
                                    <img class="btn_likeIcon" src="../../img/btn_like.png" alt="like">
                                    <span class="btn_likeNum review_likeNum"></span>
                                </button>
                            </p>
                        </div>
                        <div class="col02">첨부파일이 없습니다</div>
                    </div>
                    <div class="navigation clear">
                        <a class="fl nv_prev">이전</a>
                        <a href="../review/review.do">LIST</a>
                        <a class="fr nv_next">다음</a>
                    </div>
                    <div class="btn_area mt70">
                        <button class="btn_gray btn_delete" id="btn_delete" >삭제하기</button>
                        <button class="btn_green btn_modify" id="btn_modify">수정하기</button>
                    </div> 
                </div>
                <div class="comments clear">
                    <div class="cm_write clear">
                        <textarea name="" id="comments" cols="160" rows="10"></textarea>
                        <button class="btn_comments" id="btn_comments">댓글 달기</button>
                    </div>
                    <ul class="cm_list">
                        <li>
                            <p><em>박윤선</em><span>2023.05.13</span></p>
                            <div class="cm_txt">답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.답변을이곳에 적을 겁니다.</div>
                            <button class="btn_reply" id="btn_reply">댓글</button>
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