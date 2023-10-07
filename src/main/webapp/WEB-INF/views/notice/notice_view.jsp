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
	var  tmpSeqnno = seqno;
	
	/******************************************************************************************** 
	 2. 최초 실행 함수                               						                              														  
	*********************************************************************************************/ 
	$(document).ready(function() {
		
		init();
		
	});
	
	
	
	function init(){
		if( "null"  == "<%=(String) session.getAttribute("m_id")%>"  || "" == "<%=(String) session.getAttribute("m_id")%>") {
			$("#btn_modify").hide();
			$("#btn_delete").hide();
		}
		
		fn_UpdateViewCnt(seqno);
		fn_SearchDetail(seqno);
		
	}
	
	/******************************************************************************************** 
	 3. ajax 함수                                 						                              														  
	*********************************************************************************************/ 
	
	// 게시글 상세 페이지 호출
	function fn_SearchDetail(tmpSeqnno) {
		
		var sUrl = "${pageContext.request.contextPath}/notice/notice_view.ajax" ;
		var params = {
				seqno:tmpSeqnno
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
	
	
	function fn_Delete(tmpSeqnno) {
		
		//Url - 컨트롤러에 던져줄 것
		var sUrl = "${pageContext.request.contextPath}/notice/notice_delete.ajax" ;
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
				location.href = '../notice/notice.do';				
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
		var sUrl = "${pageContext.request.contextPath}/notice/notice_viewcnt.ajax" ;
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
		var sUrl = "${pageContext.request.contextPath}/notice/notice_likecnt.ajax" ;
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
				
				$(".notice_likeNum").text(response.result.updateCnt);
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
	    var sUrl = "${pageContext.request.contextPath}/notice/notice_prev.ajax";
		
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
	    var sUrl = "${pageContext.request.contextPath}/notice/notice_next.ajax";
		
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
	/******************************************************************************************** 
	 4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	*********************************************************************************************/ 
	function fn_Bind(response) {
		
		var title = response.result.TITLE;
		var regntnm = response.result.REGNT_ID;
		var regntdtm = response.result.REGNT_DTM;
		var contents = response.result.CONTENTS;
		var category_nm = response.result.CATEGORY_NM;
		var like = response.result.LIKE_CNT2;
		var view_cnt = response.result.VIEW_CNT;
		var origin_file_name1 = response.result.ORIGIN_FILE_NAME1;
		var target_file_name1 = response.result.TARGET_FILE_NAME1;
		var file_size1 = response.result.FILE_SIZE1;
		var file_ext1 = response.result.FILE_EXT1;
		var origin_file_name2 = response.result.ORIGIN_FILE_NAME2;
		var target_file_name2 = response.result.TARGET_FILE_NAME2;
		var file_size2 = response.result.FILE_SIZE2;
		var file_ext2 = response.result.FILE_EXT2;
		var file_path = response.result.FILE_PATH;
		
		$(".notice_title").text(title);
		$(".notice_nm").text(regntnm);
		$(".notice_regdtm").text(regntdtm);
		$(".notice_contents").html(contents);
		$(".notice_category").text(category_nm);
		$(".notice_likeNum").text(like);
		$(".view_cnt").text(view_cnt);

		var img_path = "<img src='../../img/ico_fileDown_black.png'>";

		if (origin_file_name1 !== null && origin_file_name1 !== undefined && origin_file_name1 !== ""){
			origin_file_name1 = "<a href='/upload/"+file_path+"/"+target_file_name1+"' download='"+origin_file_name1+"' target='_self'>"+origin_file_name1+"</a>";
		
			$("#origin_file_name1").html(img_path);
			$("#origin_file_name1").append(origin_file_name1);
		} else {
			$("#origin_file_name1").text("첨부파일이 없습니다.");
		}
		if (origin_file_name2 !== null && origin_file_name2 !== undefined && origin_file_name2 !== ""){
			origin_file_name2 = "<a href='/upload/"+file_path+"/"+target_file_name2+"' download='"+origin_file_name2+"' target='_self'>"+origin_file_name2+"</a>";

			$("#origin_file_name2").html(img_path);
			$("#origin_file_name2").append(origin_file_name2);
		} else {
			$("#origin_file_name2").hide();
		}
		
	}
	
	function fn_mod(tmpSeqnno){
		
		var url = "../notice/notice_modify.do";
		var params = "seqno="+tmpSeqnno;
	
		location.href = url + "?" + params
		
	}

	/******************************************************************************************** 
	 5. 기타 함수                            						                              														  
	*********************************************************************************************/ 
	
	
	/******************************************************************************************** 
	 6. 이벤트 함수                            						                              														  
	*********************************************************************************************/
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
	
	$(document).on("click", "#btn_delete", function() {
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
                                <button class="btn_like">
                                    <img class="btn_likeIcon" src="../../img/btn_like.png" alt="like">
                                    <span class="btn_likeNum notice_likeNum"></span>
                                </button>
                            </p>
                        </div>
                        <div class="col02">
	                        <label class="attach_area"><span id="origin_file_name1">첨부파일이 없습니다.</span></label>
	                        <label class="attach_area"><span id="origin_file_name2"></span></label>
                        </div>
                    </div>
                    <div class="navigation clear">
                        <a href="javascript:///" class="fl nv_prev">이전</a>
                        <a href="../notice/notice.do">LIST</a>
                        <a href="javascript:///" class="fr nv_next">다음</a>
                    </div>
                    <div class="btn_area mt70">
                        <button class="btn_gray btn_delete" id="btn_delete">삭제하기</button>
                        <button class="btn_green btn_modify" id="btn_modify">수정하기</button>
                    </div> 
                </div>

            </div>
        </div>
    </div>
</body></html>