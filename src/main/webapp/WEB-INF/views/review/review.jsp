<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_review</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/script.js"></script>

    <link href="../../js/aos.css" rel="stylesheet">
    <script src="../../js/aos.js"></script>
    <script>

	/******************************************************************************************** 
	 1. 전역변수 선언                               						                              														  
	*********************************************************************************************/ 
	var g_menu = "${param.g_menu}" ;
	var l_menu = "${param.l_menu}" ;
	var m_menu = "${param.m_menu}" ;
	var s_menu = "${param.s_menu}" ;
	
	var boardType = "30"; //프로그램: 10, 공지:20, 리뷰:30
	
	/******************************************************************************************** 
	 2. 최초 실행 함수                               						                              														  
	*********************************************************************************************/ 
	$(document).ready(function() {
		
		init();
		
	});
	
	
	
	function init(){
		//리뷰 리스트 호출
		var sUrl = "${pageContext.request.contextPath}/review/review_01_list.ajax" ;
		var searchSelector = $("search-selector option:selected").val();
		var searchText = $("#search-text").text()
		var num = 1;
		fn_listType(sUrl, boardType, searchSelector, searchText,  num)
	}
	
	/******************************************************************************************** 
	 3. ajax 함수                                 						                              														  
	*********************************************************************************************/ 
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
	/******************************************************************************************** 
	 4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	*********************************************************************************************/ 
	function fn_list(){
		
		location.href="../review/review_write.do?g_menu=2&l_menu=0&m_menu=0&s_menu=0" ;
	}
	
// 	function fn_noData(programType){
// 		var str = "";
// 		var tmpStr = "";
// 	tmpStr += "<tr>";
// 	tmpStr += "	<td colspan='6' style='text-align:center'>조회된 데이터가 없습니다.</td>";
// 	tmpStr += "</tr>";
	
// 		$("#tbl_list tbody").html(tmpStr);
		
// 	}

	//프로그램 타입에 따른 바인딩 함수
	function fn_listType_bind(params){
		//$(".totalCnt").eq(0).text(params.totalcnt) //총갯수 바인딩
		
		$(".cardBox:eq(0) li:gt(0)").remove();
		
		var tmpStr = "";
		
		
			for (var i=0, j=params.result.length ; i < j ; i++ ) {
					
				tmpStr += "<li class='item'><div class='cardArea'>";
				tmpStr += "	<a href='../review/review_view.do?'" + "seqno="+params.result[i].SEQ_NO;
				tmpStr += "<p class='tp_txt'><span class='group starting_date'>"+"41일차 수강생"+"</span>";
				tmpStr += "<span class='author 	review_nm'>"+params.result[i].REGNT_NM+"</span>";
				tmpStr += "<span>"+params.result[i].REGNT_DTM+"</span>";
				tmpStr += "<i class='arrow'><img src='../../img/icon_arrow.svg' alt='자세히 보기'></i></p>";
				tmpStr += "<h5>" + params.result[i].TITLE + "</h5>"
				tmpStr += "<p class='cont'>"+params.result[i].CONTENTS+"</p></a>"
				tmpStr += "<p class='goodArea'>좋아요 <button class='good hideTxt'>좋아요</button> <strong>"+params.result[i].LIKE_CNT+"</strong></p></div>"
				tmpStr += "</li>"
				
			}
		
		$(".cardBox").append(tmpStr);
		
		//페이징 처리가 필요할 만큼 데이터가 있다면
		//pagingView(params); //페이징  호출
					
	}
	
	/******************************************************************************************** 
	 5. 기타 함수                            						                              														  
	*********************************************************************************************/ 
	
	
	/******************************************************************************************** 
	 6. 이벤트 함수                            						                              														  
	*********************************************************************************************/ 
	
</script>
</head>

<body>
    <div class="wrap review">
	<%@include file="../include/header.jsp" %>
        <div class="main">
            <div class="inner" style="position: relative;">
                <div class="tit">
                    <h2>REVIEW</h2>
                    <p>리뷰를 작성해주세요.</p>
                </div>
                <div class="baord" data-aos="fade-up" data-aos-duration="1000">
                    <div class="tb_top clear">
                        <div class="left">
                            <!--<select id="schCd" class="sch_sel" style="margin-right: 4px;">
                                <option value="*" selected>범위/All</option>
                                <option value="title">제목</option>
                                <option value="contents">내용</option>
                            </select>-->
                            <select id="schCd" class="sch_sel" style="margin-right: 4px; width: 200px;">
                                <option value="" selected>분류/All</option>
                                <option value="">제목</option>
                                <option value="">내용</option>
                            </select>
                            <input type="text" class="search" placeholder="search">
                            <button class="btn_search"><span class="hide">search</span></button>
                            <!--<span>Total <em>110</em></span>-->
                        </div>
                        <div class="right btn_area">
                            <button class="btn_blue" onclick = "location.href = 'review_write.do' ">작성하기</button>
                        </div>
                    </div>
                    <div class="card">
                        <ul class="cardBox">

                        </ul>
                    </div>

                    <!--<div class="tac">
                        <button class="btn_more">더보기</button>
                    </div>-->

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
</body>

</html>
