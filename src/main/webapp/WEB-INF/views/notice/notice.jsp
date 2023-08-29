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
	
	var g_menu = "${param.g_menu}" ;
	var l_menu = "${param.l_menu}" ;
	var m_menu = "${param.m_menu}" ;
	var s_menu = "${param.s_menu}" ;
	
	var boardType = "20"; //프로그램: 10, 공지:20, 리뷰:30

// ******************************************************************************************* 
// 2. 최초, 최종 실행 및  addEventListener 등록                                						                              														  
// ******************************************************************************************* 
$(document).ready(function(){
	
	init();  //최초 실행함수

	//각종 addEventListener 등록
	//페이징의 숫자를 클릭했을때 해당 페이지로 이동하기
	$(document).on("click", ".paging.list  a", function(){

		var num = $(this).text();
		//공지사항 리스트 호출
		var sUrl = "${pageContext.request.contextPath}/notice/notice_01_list.ajax" ;
		var searchSelector = $("#schCd option:selected").val();
		var searchText = $(".search").eq(0).val()
		fn_listType(sUrl, boardType, searchSelector, searchText, num)
		
	});

	//검색버튼 클릭했을때
	$(document).on("click", ".btn_search", function(){

		var num = 1;
		//공지사항 리스트 호출
		var sUrl = "${pageContext.request.contextPath}/notice/notice_01_list.ajax" ;
		var searchSelector = $("#schCd option:selected").val();
		var searchText = $(".search").eq(0).val()
		fn_listType(sUrl, boardType, searchSelector, searchText, num) ;
	});
});

	//최초 실행시 함수 
	function init(){
		//공지사항 리스트 호출
		var sUrl = "${pageContext.request.contextPath}/notice/notice_01_list.ajax" ;
		var searchSelector = $("search-selector option:selected").val();
		var searchText = $("#search-text").text()
		var num = 1;
		fn_listType(sUrl, boardType, searchSelector, searchText,  num)
		
	}
	
// ******************************************************************************************* 
// 3. ajax 함수                                						                              														  
// ******************************************************************************************* 

 	//게시글 데이터 호출
	function fn_listType(sUrl, boardType, searchSelector, searchText,  num){

		//현재 페이지
		if (num === undefined){
			num = 1 ;
		}	
		
		//검색어
		if (searchSelector === undefined){
			searchSelector = "*" ;
		}
		
		//검색어
		if (searchText === undefined){
			searchText = "" ;
		}
		
		
		// 파라미터
		var params = {
 			pageNo:num,   // 현재 페이지 번호 사용자가 넘겨줌
 			page:num,	  	
 			pageSize:10,  // 리스트에서 한페이지에 보여줄 개수 고정
 			pageBlock:10, // 한번에 나오는 페이지 넘버링 개수	고정
 			navigatorNum:10, 
 			totalcnt:0	,  // 총 개수 db서버 에서 가져옴
 			boardType:boardType,  // 공지사항: 1, 이벤트: 2, Q&A: 3
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
	function fn_list(){
	
		location.href="../notice/notice_write.do?g_menu=2&l_menu=0&m_menu=0&s_menu=0" ;
	}

	function fn_noData(programType){
		var str = "";
		var tmpStr = "";
	tmpStr += "<tr>";
	tmpStr += "	<td colspan='6' style='text-align:center'>조회된 데이터가 없습니다.</td>";
	tmpStr += "</tr>";
	
		$("#tbl_list tbody").html(tmpStr);
		
	}

	//프로그램 타입에 따른 바인딩 함수
	function fn_listType_bind(params){
		//$(".totalCnt").eq(0).text(params.totalcnt) //총갯수 바인딩
		
		$(".tb_type1:eq(0) tr:gt(0)").remove();
		
		var tmpStr = "";
		
		
			for (var i=0, j=params.result.length ; i < j ; i++ ) {
					
				tmpStr += "<tr>";
				tmpStr += "	<td id='sNo'>0</td>";
				tmpStr += "	<td>";
				tmpStr += "	<a href='../notice/notice_view.do?" + "seqno="+params.result[i].SEQ_NO+"' id='sTitle'>"+params.result[i].TITLE+"</a>";
				tmpStr += "	</td>";
				tmpStr += "	<td id='sView'>"+params.result[i].VIEW_CNT+"</td>";
				tmpStr += "	<td id='sRegdate'>"+params.result[i].LIKE_CNT+"</td>";
				tmpStr += "	<td id='sView'>"+0+"</td>";
				tmpStr += "	<td id='sRegdate'>"+params.result[i].REGNT_DTM+"</td>";
				tmpStr += "</tr>";

			}
		
		$(".tb_type1 tbody").append(tmpStr);
		
		//페이징 처리가 필요할 만큼 데이터가 있다면
		//pagingView(params); //페이징  호출
					
	}
	
	
	//페이징 처리
	function fn_paging(pagingId) {
		
		if (typeof (pagingId) !== "undefined") {
			pagingId = "paging";
		}

		var tmpStr = '';
		tmpStr +="<article class='paging clearfix'>";
		tmpStr +="	<ul class='paging-list'>";
		tmpStr +="		<li><a href='javascript://' class='prev-end paging-btn'></a></li>";
		tmpStr +="		<li><a href='javascript://' class='prev paging-btn'></a></li>";
		tmpStr +="		<li><a href='javascript://' class='paging-num'>1</a></li>";
		tmpStr +="		<li><a href='javascript://' class='paging-num'>2</a></li>";
		tmpStr +="		<li><a href='javascript://' class='paging-num'>3</a></li>";
		tmpStr +="		<li><a href='javascript://' class='paging-num'>4</a></li>";
		tmpStr +="		<li><a href='javascript://' class='paging-num'>5</a></li>";
		tmpStr +="		<li><a href='javascript://' class='paging-num'>6</a></li>";
		tmpStr +="		<li><a href='javascript://' class='paging-num'>7</a></li>";
		tmpStr +="		<li><a href='javascript://' class='paging-num'>8</a></li>";
		tmpStr +="		<li><a href='javascript://' class='paging-num'>9</a></li>";
		tmpStr +="		<li><a href='javascript://' class='paging-num'>10</a></li>";
		tmpStr +="		<li><a href='javascript://' class='next paging-btn'></a></li>";
		tmpStr +="		<li><a href='javascript://' class='next-end paging-btn'></a></li>";
		tmpStr +="	</ul>";
		tmpStr +="</article>";
		
		$("." + pagingId).html(tmpStr);
	}


	// ******************************************************************************************* 
	// 5. 기타 함수                               						                              														  
	// ******************************************************************************************* 
	
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
                            <button class="btn_blue" onclick = "location.href = 'notice_write.do' ">작성하기</button>
                        </div>
                    </div>
                    <table class="tb_type1 notice">
                        <colgroup>
                        	<col style="width: 5%;">
                            <col style="width: *%;">
                            <col style="width: 7%">
                            <col style="width: 7%">
                            <col style="width: 7%">
                            <col style="width: 13%">
                            <col style="width: 0">
                        </colgroup>
                        <tr>
                        	<th id="sno">NO</th>
							<th id="bltndTitl">제목</th>
							<th id="bltnInqrCnt">조회수</th>
							<th id="recommendCounty">추천</th>
							<th id="commentCount">댓글</th>
							<th id="sysRegDtm">날짜</th>
							<th id="totalcount" style="display:none">전체갯수</th>
						</tr>	
                        
                    </table>
                    <div class="paging">
                        <a href="#" class="prev_end"></a>
                        <a href="#" class="prev"></a>
                        <a href="#" class="on">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#" class="next"></a>
                        <a href="#" class="next_end"></a>
                    </div>
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
</body></html>