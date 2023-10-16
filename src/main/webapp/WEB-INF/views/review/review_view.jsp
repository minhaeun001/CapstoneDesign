<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String seqno = request.getParameter("seqno");
%>
<%

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_review_view</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/review.css" />
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
	var m_id = "<%=(String) session.getAttribute("m_id")%>";
	
	var  tmpSeqnno = seqno;
	
	const BOARD_TYPE = "30";
	var boardSubType = "R"; // R: Review 본문, C: Review Comments
	//******************************************************************************************** 
	// 2. 최초 실행 함수                               						                              														  
	//*********************************************************************************************/ 
	$(document).ready(function() {
		
		init();
		
	});
	
	
	
	function init(){

// 		if( "null"  == m_id  || "" == m_id) {
// 			$("#btn_modify").hide();
// 			$("#btn_delete").hide();
// 		}
		
		fn_UpdateViewCnt(seqno);
		fn_SearchDetail(seqno);
	}
	
	//******************************************************************************************** 
	// 3. ajax 함수                                 						                              														  
	//*********************************************************************************************/ 
	
	// 게시글 상세 페이지 호출
	function fn_SearchDetail(tmpSeqnno) {
		
		var sUrl = "${pageContext.request.contextPath}/review/review_view.ajax" ;
		var params = {
				seqno:tmpSeqnno,
				boardType:BOARD_TYPE,
				boardSubType:boardSubType
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
				if(response.result.REGNT_ID !== m_id){
					$(".myAuth").hide();
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
				seqno:tmpSeqnno,
				boardType:BOARD_TYPE,
				boardSubType:boardSubType
		};
		
		
		$.ajax({
			url : sUrl, // controller와 매핑할 이름이자 주소
			data : params, // controller로 넘겨줄 data
			method : 'post', // controller로 넘겨줄 방식
			dataType : 'json', // controller로부터 넘겨받을 데이터의 형식
			success : function(response) {
				
				alert(response.result.msg);
				if("T" == response.result.flag){
					location.href = '../review/review.do';	
				}
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
				seqno:tmpSeqnno,
				boardType:BOARD_TYPE,
				boardSubType:boardSubType
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
				seqno:tmpSeqnno,
				boardType:BOARD_TYPE,
				boardSubType:boardSubType
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
	        seqno: tmpSeqnno,
	        boardType:BOARD_TYPE,
	        boardSubType:boardSubType
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
	        seqno: tmpSeqnno,
	        boardType:BOARD_TYPE,
	        boardSubType:boardSubType
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
	
	//댓글 저장
	function fn_CommentsSave(tmpSeqnno){
	    var sUrl = "${pageContext.request.contextPath}/review/review_comments_save.ajax";
	    
		var params = {};
		
		
		params.prt_seqno = tmpSeqnno;
		params.contents = $("#comments").val();
		params.regntid = "";
		params.regntnm = "";
		params.modid = "";
		params.boardType = BOARD_TYPE;
		params.boardSubType = boardSubType;
	    
	    $.ajax({
	        url: sUrl,
	        data: params,
	        method: 'post',
	        dataType: 'json',
	        success: function (response) {
				if(response.flag != "T"){
					alert(response.result.msg);
					
					return ;
				}
				
				alert("저장되었습니다.");
				fn_comments_listType(tmpSeqnno) ;
	        },
	        error: function (xhr, status, error) {
	            alert("error");
	        },
	        complete: function () {}
	    });
	}
	
 	//댓글 데이터 호출
	function fn_comments_listType(tmpSeqnno){
		//댓글 리스트 호출
		var boardSubType = "C";
		
		var sUrl = "${pageContext.request.contextPath}/review/comments_listType.ajax";	
		
		// 파라미터
		var params = {
			prt_seqno:tmpSeqnno,
 			boardType:BOARD_TYPE,
 			boardSubType:boardSubType,
 			step:"1"
		}
		
		
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				
				//데이터가 있는지 확인한다.
				if (response.result.length < 1 ) {
					fn_noData();
					
					return ;
				}
				
				//response 의 결과값을 바인딩 전용 함수로 넘기기 위해  response값을 params 에 재 할당
				//params.totalcnt	= response.result[0].totalcnt ; //총갯수  - 페이징 처리에 필요하여 params.totalcnt	 대입
				params.result = response.result ; //결과값을  params에 담는다
				
				
				$("#comments").val("");
				//결과값 바인드 함수 호출
				fn_comments_bind(params) ;

			},	
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
				//실패나 성공시 항상 실행 콜백함수
		    }
		});
	}
 	
	function fn_CommentMod(seqno, contents){
		var boardSubType = "C";
		
		var sUrl = "${pageContext.request.contextPath}/review/review_comments_mod.ajax";
		
		// 파라미터
		var params = {
			seqno:seqno,
			boardType:BOARD_TYPE,
			boardSubType:boardSubType,
			contents:contents
		}
		
		
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				alert("수정 되었습니다.");
				fn_comments_listType(tmpSeqnno);
			},
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
				//실패나 성공시 항상 실행 콜백함수
		    }
		});
	}
	
	function fn_CommentDel(seqno){
		var boardSubType = "C";
		
		var sUrl = "${pageContext.request.contextPath}/review/review_comments_delete.ajax";
		
		// 파라미터
		var params = {
			seqno:seqno,
			boardType:BOARD_TYPE,
			boardSubType:boardSubType
		}
		
		
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				alert("삭제 되었습니다.");
				fn_comments_listType(tmpSeqnno);
			},
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
				//실패나 성공시 항상 실행 콜백함수
		    }
		});
	}
	
	function fn_Comment_reply(tmpSeqnno, contents, grp_seqno){
		
		var boardSubType = "C";
		
	    var sUrl = "${pageContext.request.contextPath}/review/review_reply_save.ajax";
	    
		var params = {
			prt_seqno:tmpSeqnno,
			grp_seqno:grp_seqno,
			contents:contents,
			boardType:BOARD_TYPE,
			boardSubType:boardSubType
		};
	    
	    $.ajax({
	        url: sUrl,
	        data: params,
	        method: 'post',
	        dataType: 'json',
	        success: function (response) {
				if(response.flag != "T"){
					alert(response.result.msg);
					
					return ;
				}
				
				alert("등록되었습니다.");
				
				fn_comments_listType(tmpSeqnno);
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
		var regntnm = response.result.REGNT_ID;
		var regntdtm = response.result.REGNT_DTM;
		var contents = response.result.CONTENTS;
		var like = response.result.LIKE_CNT2;
		var view_cnt = response.result.VIEW_CNT;

		var seq_no = response.result.GRP_SEQNO;
		
		$(".review_title").text(title);
		$(".review_nm").text(regntnm);
		$(".review_regdtm").text(regntdtm);
		$(".review_contents").text(contents);
		$(".review_likeNum").text(like);
		$(".view_cnt").text(view_cnt);
		
		fn_comments_listType(tmpSeqnno);

	}
	
	function fn_mod(tmpSeqnno){
		
		var url = "../review/review_modify.do";
		var params = "seqno="+tmpSeqnno;
	
		location.href = url + "?" + params
	}
	
	function fn_noData(){
		var str = "";
		var tmpStr = "";
		tmpStr += "<li>"
		tmpStr += "<div>댓글이 없습니다.</div>";
		tmpStr += "</li>"
	
		$(".cm_list").html(tmpStr);
		$(".cm_list").show();
	}
	
	//댓글 바인딩
	//프로그램 타입에 따른 바인딩 함수
	function fn_comments_bind(params){
		
		$(".cm_list li").remove();
		
		var tmpStr = "";
		
		if(params.result && params.result.length > 0) {
			for (var i=0, j=params.result.length ; i < j ; i++ ) {
				var cls = "";
				var content = params.result[i].CONTENTS;
				var btn_bar = "<span class='rp_btn_cm'><button class='btn_comment_mod'><i class='fa-duotone fa-m' style='--fa-primary-color: #6d6f82; --fa-secondary-color: #6e6e6e;'></i></button><button class='btn_comment_del' id='del_"+params.result[i].SEQ_NO+"'><i class='fa-duotone fa-x' style='--fa-primary-color: #6d6f82; --fa-secondary-color: #6d6f82;'></i></button></span></p>";
				if (params.result[i].DISABLED == "0"){
					content = "삭제된 댓글입니다."
					cls = "class=disabled";
					btn_bar = "";
				}
				
				if(params.result[i].STEP == 0){
					if(params.result[i].REGNT_ID == m_id){
						tmpStr += "<li id='comment_grp_"+params.result[i].GRP_SEQNO+"' "+cls+"><p><em>"+ params.result[i].REGNT_ID +"</em>";
						tmpStr += "<span>"+params.result[i].REGNT_DTM+"</span>";
						tmpStr += btn_bar;
						tmpStr += "<div class='wrap_txt_mod'> <textarea class='txtarea_mod' id='rpl_"+params.result[i].SEQ_NO+"'cols='100' rows='2'>"+content+"</textarea><button class='btn_reply_mod' id='mod_"+params.result[i].SEQ_NO+"'>수정</button> </div>"
						tmpStr += "<div class='cm_txt cm_"+ params.result[i].SEQ_NO+"'>"+ content +"</div>";
						tmpStr += "<button class='btn_reply' id='btn_reply_"+params.result[i].GRP_SEQNO+"'>댓글</button>";
						tmpStr += "<div class='reply_write clear'>";
						tmpStr += "<textarea class='comments_reply' id='comments_reply_"+params.result[i].SEQ_NO+"' cols='100' rows='2' placeholder='댓글을 입력해주세요.'></textarea>";
						tmpStr += "<div class='rp_btn'><button id='rp_"+params.result[i].SEQ_NO+"'>댓글 등록</button></div>";
						tmpStr += "</li>"
					} else {
						tmpStr += "<li id='comment_grp_"+params.result[i].GRP_SEQNO+"' "+cls+"><p><em>"+ params.result[i].REGNT_ID +"</em>";
						tmpStr += "<span>"+params.result[i].REGNT_DTM+"</span>";
						tmpStr += "<div class='wrap_txt_mod'> <textarea class='txtarea_mod' id='rpl_"+params.result[i].SEQ_NO+"'cols='100' rows='2'>"+content+"</textarea><button class='btn_reply_mod' id='mod_"+params.result[i].SEQ_NO+"'>수정</button> </div>"
						tmpStr += "<div class='cm_txt cm_"+ params.result[i].SEQ_NO+"'>"+ content +"</div>";
						tmpStr += "<button class='btn_reply' id='btn_reply_"+params.result[i].GRP_SEQNO+"'>댓글</button>";
						tmpStr += "<div class='reply_write clear'>";
						tmpStr += "<textarea class='comments_reply' id='comments_reply_"+params.result[i].SEQ_NO+"' cols='100' rows='2' placeholder='댓글을 입력해주세요.'></textarea>";
						tmpStr += "<div class='rp_btn'><button id='rp_"+params.result[i].SEQ_NO+"'>댓글 등록</button></div>";
						tmpStr += "</li>"
					}
					
				} else {
					if(params.result[i].REGNT_ID == m_id){
						tmpStr += "<li "+cls+"><div class='reply_view'>";
						tmpStr += "<p><em>"+params.result[i].REGNT_ID+"</em><span>"+params.result[i].REGNT_DTM+"</span>";
						tmpStr += btn_bar;
						tmpStr += "<div class='wrap_txt_mod'> <textarea class='txtarea_mod' id='rpl_"+params.result[i].SEQ_NO+"'cols='100' rows='2'>"+content+"</textarea><button class='btn_reply_mod' id='mod_"+params.result[i].SEQ_NO+"'>수정</button> </div>"
						tmpStr += "<div class='cm_txt cm_"+ params.result[i].SEQ_NO+"'>"+ content +"</div>";
						tmpStr += "</div></div></li>"
					} else {
						tmpStr += "<li "+cls+"><div class='reply_view'>";
						tmpStr += "<p><em>"+params.result[i].REGNT_ID+"</em><span>"+params.result[i].REGNT_DTM+"</span>";
						tmpStr += "<div class='cm_txt cm_"+ params.result[i].SEQ_NO+"'>"+ content +"</div>";
						tmpStr += "</div></div></li>"
					}
				}
			}
			
		} else {
		}			
		
		$(".cm_list").append(tmpStr);
		
		if( "null"  == m_id  || "" == m_id) {
			$(".rp_btn_cm").hide();
		}
	}
	
	function fn_Comment_mod_Bind(response){
		$(".txtarea_mod").val(contents);
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
		if ($("#comments").val() === "") {
			alert("내용을 입력해주세요.");
			$("#comments").focus();
			return ;
		}
		fn_CommentsSave(tmpSeqnno);
	});
	
	$(document).on("click", ".btn_comment_mod", function () {
	    var $li = $(this).closest("li");
	    
	    var C = "<i class='fa-duotone fa-c' style='--fa-primary-color: #6d6f82; --fa-secondary-color: #071731;'></i>";
	    
	    // cm_txt를 숨기고 wrap_txt_mod를 보이게 합니다.
	    $li.find(".cm_txt").hide();
	    $li.find(".btn_comment_del").hide();
	    $li.find(".wrap_txt_mod").show();
	    
	    // "M" 버튼을 "C" 버튼으로 변경합니다.
	    $(this).html(C).removeClass("btn_comment_mod").addClass("btn_comment_cancel");
	});

	// "C" 버튼 클릭 시 wrap_txt_mod를 숨기고 cm_txt를 보이게 합니다.
	$(document).on("click", ".btn_comment_cancel", function () {
	    var $li = $(this).closest("li");
	    
	    var M = "<i class='fa-duotone fa-m' style='--fa-primary-color: #6d6f82; --fa-secondary-color: #6e6e6e;'></i>"
	    
	    // wrap_txt_mod를 숨기고 cm_txt를 보이게 합니다.
	    $li.find(".wrap_txt_mod").hide();
	    $li.find(".btn_comment_del").show();
	    $li.find(".cm_txt").show();
	    
	    // "C" 버튼을 다시 "M" 버튼으로 변경합니다.
	    $(this).html(M).removeClass("btn_comment_cancel").addClass("btn_comment_mod");
	});

	
	$(document).on("click", "[id^=mod_]", function(){
		var seqno = $(this).attr("id").replace(/mod_/gi,"");
		var contents = $(this).prev().val();
		
		var contents_area = $("#rpl_" + seqno).val();
		
		if (contents.trim() === "") {
	        alert("내용을 입력해주세요.");
	        $(contents_area).focus();
	        return;
	    }
		fn_CommentMod(seqno, contents);
	});
	
	$(document).on("click", "[id^=del_]", function(){
		var seqno = $(this).attr("id").replace(/del_/gi,"");
		
	    if (confirm("댓글을 삭제하시겠습니까?")) {
	        // 사용자가 "예"를 선택한 경우
	        fn_CommentDel(seqno);
	    }
	});
	
	$(document).on("click", "[id^=rp_]", function(){
		var seqno = $(this).attr("id").replace(/rp_/gi,"");
		var contents = $("#comments_reply_"+seqno).val();

		var grp_seqno = $(this).parent().parent().parent().attr("id").replace(/comment_grp_/gi,"");
		
		fn_Comment_reply(tmpSeqnno, contents, grp_seqno);
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
                    </div>
                    <div class="navigation clear">
                        <a href="javascript:///" class="fl nv_prev">이전</a>
                        <a href="../review/review.do">LIST</a>
                        <a href="javascript:///" class="fr nv_next">다음</a>
                    </div>
                    <div class="btn_area mt70">
                        <button class="btn_gray btn_delete myAuth" id="btn_delete" >삭제하기</button>
                        <button class="btn_green btn_modify myAuth" id="btn_modify">수정하기</button>
                    </div> 
                </div>
                <div class="comments clear">
                <%if (m_id != null && !m_id.equals("")) {
				%>
                    <div class="cm_write clear">
                        <textarea id="comments" cols="160" rows="10"></textarea>
                        <button class="btn_comments" id="btn_comments">댓글 달기</button>
                    </div>
                <%} %>
                    <ul class="cm_list">
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body></html>