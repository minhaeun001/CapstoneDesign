<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_notice</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/script.js"></script>
    <link href="../../js/aos.css" rel="stylesheet"> 
    <script src="../../js/aos.js"></script>
<script>
// ******************************************************************************************* 
// 1. 전역변수 선언                               						                              														  
// *******************************************************************************************
	
	var _g_pageNo = 1; // 페이지 넘버
	var pageNo = _g_pageNo;
	var boardType = "20"; //프로그램: 10, 공지:20, 리뷰:30
	

// ******************************************************************************************* 
// 2. 최초, 최종 실행 및  addEventListener 등록                                						                              														  
// ******************************************************************************************* 
	$(document).ready(function(){
		
		init();  //최초 실행함수
	
	});

	//최초 실행시 함수 
	function init(){
		if( "null"  == "<%=(String) session.getAttribute("m_id")%>"  || "" == "<%=(String) session.getAttribute("m_id")%>") {
			$("#btn_write").hide();
		}
		
		//공지사항 리스트 호출
		fn_listType();
		
	}
	
// ******************************************************************************************* 
// 3. ajax 함수                                						                              														  
// ******************************************************************************************* 

 	//게시글 데이터 호출
	function fn_listType(){

		var sUrl = "${pageContext.request.contextPath}/notice/notice_01_list.ajax" ;
		
		var searchText = $(".search").val();
	
		//현재 페이지
		if (pageNo == undefined){
			pageNo = 1 ;
		}	var searchSelector = $("#schCd option:selected").val();
		
		//검색어
		if (searchSelector == undefined){
			searchSelector = "*" ;
		}
		
		//검색어
		if (searchText == undefined){
			searchText = "" ;
		}
		
		// 파라미터
		var params = {
 			pageNo:pageNo,   // 현재 페이지 번호 사용자가 넘겨줌
 			page:pageNo,	  	
 			pageSize:10,  // 리스트에서 한페이지에 보여줄 개수 고정
 			pageBlock:10, // 한번에 나오는 페이지 넘버링 개수	고정
 			navigatorNum:10, 
 			totalcnt:0	,  // 총 개수 db서버 에서 가져옴
 			boardType:boardType,  // PROGRAM:10 NOTICE:20 REVIEW:30
 			searchText:searchText, //검색어
 			searchSelector:searchSelector //검색조건
		}
		
		
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				
				//데이터가 있는지 확인한다.
				if (response.result.length < 1 ) {
				
					//데이터가 없을때
					$(".totalCnt").eq(0).text(0);  //총갯수 초기화
					//페이징 내용 감추기
					$("#paging").hide();
					
					fn_noData(boardType);
					
					return ;
				}
				
				//response 의 결과값을 바인딩 전용 함수로 넘기기 위해  response값을 params 에 재 할당
				//params.totalcnt	= response.result[0].totalcnt ; //총갯수  - 페이징 처리에 필요하여 params.totalcnt	 대입
				params.result = response.result ; //결과값을  params에 담는다
				
				//결과값 바인드 함수 호출
				fn_listType_bind(params) ;

			},	
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
				//실패나 성공시 항상 실행 콜백함수
		    }
		});
	}

// ******************************************************************************************* 
// 4. 사용자 일반 함수        - ajax 함수 이외 정의 함수                       						                              														  
// ******************************************************************************************* 
	$(document).on("keypress",".search", function(){
		if (event.keyCode == 13){
			$(".btn_search").click();	
		}
	});

	function fn_noData(programType){
		$(".tb_type1:eq(0) tr:gt(0)").remove();
		var str = "";
		var tmpStr = "";
		tmpStr += "<tr>";
		tmpStr += "	<td colspan='6' style='text-align:center'>조회된 데이터가 없습니다.</td>";
		tmpStr += "</tr>";
		
		$(".tb_type1 tbody").append(tmpStr);
		
	}

	//프로그램 타입에 따른 바인딩 함수
	function fn_listType_bind(params){
		//$(".totalCnt").eq(0).text(params.totalcnt) //총갯수 바인딩
		
		$(".tb_type1:eq(0) tr:gt(0)").remove();
		
		var tmpStr = "";
		var categoryNm = "";
		
		if(params.result.length > 0) {
			
			for (var i=0, j=params.result.length ; i < j ; i++ ) {
				
				tmpStr += "<tr>";
				tmpStr += "	<td id='sNo'>"+params.result[i].NO+"</td>";
				tmpStr += "	<td>"+params.result[i].CATEGORY_NM+"</td>";
				tmpStr += "	<td>";
				tmpStr += "<a href='../notice/notice_view.do?seqno="+params.result[i].SEQ_NO+"' id='sTitle'>"+params.result[i].TITLE+"</a>";
				tmpStr += "	</td>";
				tmpStr += "	<td id='sView'>"+params.result[i].VIEW_CNT+"</td>";
				tmpStr += "	<td id='sRegdate'>"+params.result[i].LIKE_CNT2+"</td>";
				tmpStr += "	<td id='sView'>"+0+"</td>";
				tmpStr += "	<td id='sRegdate'>"+params.result[i].REGNT_DTM+"</td>";
				tmpStr += "</tr>";

			}
			
			//페이징 처리가 필요할 만큼 데이터가 있다면
			params.totalCnt = params.result[0].TOTALCNT;
			fn_paging(params); //페이징  호출
			
		} else {
			
			tmpStr += "<tr>";
			tmpStr += "	<td colspan='7' style='text-align:center;'> 등록된 게시글이 없습니다. </td>";
			tmpStr += "</tr>";
		}
		
		
		$(".tb_type1 tbody").append(tmpStr);
		
					
	}
	
	
	//페이징 처리
	function fn_paging(params) {
		
		var pagingId = "paging";
		var i;
		var pageNo = params.pageNo;
		var pageSize = params.pageSize;
		var totalCnt = params.totalCnt;
		var pageBlock = parseInt((totalCnt/pageSize)) + 1;
		
		
		if (typeof (pagingId) !== "undefined") {
			pagingId = "paging";
		}

		var tmpStr = "";
		tmpStr +="<a href='javascript://' class='prev_end' data-num='1'></a>";
		tmpStr +="<a href='javascript://' class='prev' data-num='"+(parseInt(_g_pageNo)-1)+"'></a>";
		
		for(i=1; i <= pageBlock; i++) {
			if(_g_pageNo == i) {
				tmpStr +="<a href='javascript://' class='paging_num on' data-num='"+i+"'>"+ i +"</a>";
			} else {
				tmpStr +="<a href='javascript://' class='paging_num' data-num='"+i+"'>"+ i +"</a>";
			}
			
		}
		
		tmpStr +="<a href='javascript://' class='next paging-btn' data-num='"+(parseInt(_g_pageNo)+1)+"'> </a>";
		tmpStr +="<a href='javascript://' class='next_end paging-btn' data-num='"+pageBlock+"'></a>";
		
		$("#" + pagingId).html(tmpStr);
		
		if (pageBlock > 0){
			$("#" + pagingId).show();		
		} else {
			$("#" + pagingId).hide();
		}
	}


	// ******************************************************************************************* 
	// 5. 기타 함수                               						                              														  
	// ******************************************************************************************* 
	
	
	// ******************************************************************************************* 
	// 6. 이벤트 함수                               						                              														  
	// ******************************************************************************************* 
	
	//각종 addEventListener 등록
	//페이징의 숫자를 클릭했을때 해당 페이지로 이동하기
	$(document).on("click", ".paging a", function(){
		_g_pageNo = $(this).attr("data-num");
		
		if (_g_pageNo < 1){
			_g_pageNo = $(".prev_end").attr("data-num");
		}
		else if (_g_pageNo > $(".next_end").attr("data-num")){
			_g_pageNo = $(".next_end").attr("data-num");
		}
		
		pageNo = _g_pageNo;
		fn_listType();
	});

	$(document).on("click", "#btn_write", function(){
		location.href = "../notice/notice_write.do";
	})
	
	//검색버튼 클릭했을때
	$(document).on("click", ".btn_search", function(){
		
		//공지사항 리스트 호출
		fn_listType() ;
		
	});
	
	
	</script>  
</head>
<body>
	<%@include file="../include/header.jsp" %>
    <div class="wrap">
        <div class="main">
            <div class="inner">
                <div class="tit">
                    <h2>NOTICE</h2>
					<p>MAKEGYM 운영팀에서 알려 드립니다.</p>
                </div>
                <div class="baord"  data-aos="fade-up" data-aos-duration="1000">
                    <div class="tb_top clear">
                        <div class="left">
                            <select id="schCd" class="sch_sel" style="margin-right: 4px;">
                                <option value="*" selected>범위/All</option>
                                <option value="title">제목</option>
                                <option value="contents">내용</option>
                            </select>
                            <input type="text" class="search" placeholder="search" >
                            <button class="btn_search"><span class="hide">search</span></button>
                        </div>
                        <div class="right btn_area">
                            <button class="btn_blue" id="btn_write">작성하기 <i class="fa-solid fa-feather" style="color: #ffffff;"></i></button>
                        </div>
                    </div>
                    <table class="tb_type1 notice">
                        <colgroup>
                        	<col style="width: 5%;">
                        	<col style="width: 5%;">
                            <col style="width: *%;">
                            <col style="width: 7%">
                            <col style="width: 7%">
                            <col style="width: 7%">
                            <col style="width: 13%">
                            <col style="width: 0">
                        </colgroup>
                        <tr>
                        	<th>NO</th>
                        	<th>구분</th>
							<th>제목</th>
							<th>조회수</th>
							<th>추천</th>
							<th>댓글</th>
							<th>날짜</th>
							<th style="display:none">전체갯수</th>
						</tr>	
                        
                    </table>
                    <div id="paging" class="paging"></div>
                </div>
            </div>
        </div>
    </div>
    <script>
         var myAOS = function() {
                AOS.init({
                   easing: 'ease-out-back',
                   duration: 1500
                });
            }
            myAOS();
    </script>
</body>
</html>