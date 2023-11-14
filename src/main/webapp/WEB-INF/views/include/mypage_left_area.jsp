<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	//******************************************************************************************** 
	// 1. 전역변수 선언                               						                              														  
	//*********************************************************************************************/ 

	//******************************************************************************************** 
	//2. 최초 실행 함수                               						                              														  
	//*********************************************************************************************/ 
	$(document).ready(function() {

		fn_init_mp();

	});

	function fn_init_mp() {
		fn_program_cnt();
	}

	//******************************************************************************************** 
	//3. ajax 함수                                 						                              														  
	//*********************************************************************************************/ 
	function fn_program_cnt() {

		var sUrl = "${pageContext.request.contextPath}/mypage/program_cnt.ajax";
		var params = {
			m_id : ""
		};

		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				$(".cnt").html(response.result.length);
			},
			error : function(xhr, status, error) {
				alert("error");
			},
			complete : function() {
			}
		});
	}
	//******************************************************************************************** 
	//4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	//*********************************************************************************************/ 
	
	//******************************************************************************************** 
	//5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 

	//******************************************************************************************** 
	//6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/
	$(document).on("click", ".mypage_running", function() {
		location.href = "../mypage/mypage_running.do";
	});
	
	$(document).on("click", ".mypage_review", function() {
		location.href = "../mypage/mypage_review.do";
	});
	
	$(document).on("click", ".mypage_change", function() {
		location.href = "../mypage/mypage_change.do";
	});
	
	$(document).on("click", ".mypage_password_change", function() {
		location.href = "../mypage/mypage_password_change.do";
	});
	
	$(document).on("click", ".mypage_withdraw", function() {
		location.href = "../mypage/mypage_withdraw.do";
	});
</script>
<div class="mypage_left_top">
	<h> 마이페이지 </h>
</div>
<div class="mypage_left_middle1">
	<div class="middle1_list">
		<li class="middle1_list_top">예약관리</li>
		<li class="mypage_running li_style">수강중인 강좌(<span class="cnt"></span>)</li>
		<li class="mypage_review li_style">리뷰 관리</li>
	</div>
</div>
<div class="mypage_left_middle2">
	<div class="middle2_list">

		<li class="middle2_list_top">회원정보</li>
		<li class="mypage_change li_style">회원정보 수정</li>
		<li class="mypage_password_change li_style">비밀번호 수정</li>
		<li class="mypage_withdraw li_style">회원 탈퇴</li>
	</div>
</div>
<div class="mypage_left_bottom">
	<li>서비스 문의</li>
	<li>02-1111-2222</li>
</div>