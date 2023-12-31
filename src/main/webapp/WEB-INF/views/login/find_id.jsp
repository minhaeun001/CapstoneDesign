﻿﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MAKEGYM</title>
<link rel="stylesheet" href="../../../css/common.css">
<link rel="stylesheet" href="../../../css/style.css">
<link rel="stylesheet" href="../../../css/signup.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script src="../../js/jquery-1.7.2.min.js"></script>
<script src="../../js/script.js"></script>

<link href="../../js/aos.css" rel="stylesheet">
<script src="../../js/aos.js"></script>

<script>

	//******************************************************************************************** 
	// 1. 전역변수 선언                               						                              														  
	//*********************************************************************************************/ 
	
	
	//******************************************************************************************** 
	// 2. 최초 실행 함수                               						                              														  
	//*********************************************************************************************/ 
	
	$(document).ready(function() {
		
		init();
		
	});
	
	
	
	function init(){

	}
	
	//******************************************************************************************** 
	//3. ajax 함수                                 						                              														  
	//*********************************************************************************************/
	function fn_find_id(){
	    var m_nm = $(".m_nm").val();
	    var m_hp = $(".m_hp").val();

	    // 이름과 휴대폰 번호가 입력되었는지 확인
	    if (m_nm === "") {
	        alert("이름을 입력해주세요.");
	        $(".m_nm").focus();
	        return;
	    }

	    if (m_hp === "") {
	        alert("휴대폰 번호를 입력해주세요.");
	        $(".m_hp").focus();
	        return;
	    }
	    
		var sUrl = "${pageContext.request.contextPath}/login/find_my_id.ajax"
		
		var m_nm  = $(".m_nm").val();
		var m_hp = $(".m_hp").val();
		
		var params = {
				m_nm:m_nm,
				m_hp:m_hp
		};
		
		$.ajax({
			url:sUrl,
			data:params,
			method:"post",
			dataType:"json",
			success: function(response){
				var msg = response.result.FindMyId[0].msg;
				var flag = response.result.FindMyId[0].flag;
				var m_id = response.result.FindMyId[0].m_id;
				
				$(".check_info").empty();
			
				if (flag == "T") {
					var str = "";
					str += "<div class='close-button'>X</div><div class='text'>";
					str += "가입하신 아이디는 <span class='nickname'> \""+m_id+"\" </span>입니다.<br>";
					str += "</div><div class='btn_area'>";
					str += "<button class='tb_top btn_blue btn_login'>로그인</button></div>";
					
					$(".check_info").append(str);
					
				} else {
					var str = "";
					str += "<div class='close-button'>X</div><div class='text'>";
					str += "등록된 정보가 없습니다.";
					str += "</div>";
					
					$(".check_info").append(str);
				}
				
				$(".popup.success").removeClass("hidden").addClass("show");
			},
			error: function(xhr, status, error){
				alert("error");

			},
			complete: function(){
				
			}
		});
	}
	//******************************************************************************************** 
	//4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	//*********************************************************************************************/ 
    	
	//******************************************************************************************** 
	// 5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 
	
	
	//******************************************************************************************** 
	//6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/ 
	$(document).on("click", ".btn_find_id", function(){
	    fn_find_id();
	});
	
	$(document).on("keypress",".m_nm, .m_hp", function(){
		if (event.keyCode == 13){
			$(".btn_find_id").click();	
		}
	});
	
	$(document).on("click",".btn_login", function(){
		location.href="../login/login.do";
	});
	
	$(document).on("click",".close-button", function(){
		$(".popup.success").removeClass("show").addClass("hidden");
		$(".btn_area").css("display","block");
	});
</script>

</head>

<body class="bg_black">
	<!-- 팝업창 시작 -->
	<div class="popup success hidden">
		<div class="check_info"></div>
	</div>
	<!-- 팝업창 종료 -->
	<!-- 배경 동영상 -->
	<video muted autoplay loop class="index_video">
		<source src="../../img/clip2_640.mp4" type="video/mp4">
	</video>

	<div class="wrap index">
		<%@include file="../include/header.jsp"%>
	</div>
	<div class="main">
		<h2>아이디 찾기</h2>
		<div class=signup_find_id>
			<p>
				<i class="essR"> </i> "필수입력"
			</p>
			<div class="signup_wrapper">
				<table>
					<caption>
						<strong>웹 회원 아이디 찾기위한 정보 입력</strong>
						<p>웹 회원 정보입력으로 이름, 휴대폰, 이메일 정보를 입력</p>
					</caption>
					<colgroup>
						<col style="width: 160px">
						<col style="width: 280px">
						<col style="width: 100px">
						<col class="sm-wd">
					</colgroup>
					<tbody>
						<tr class="id">
							<th scope="row">이름 <span class="essR"> ::before "필수"
							</span>
							</th>
							<td colspan="3"><input type="text"
								class="m_nm inTxt rs-w100" id="m_szName" value maxlength="50"
								style="width: 180px;" title="이름 입력"></td>
						</tr>
						<tr class="phone">
							<th scope="row">전화번호 <span class="essR"> ::before
									"필수" </span>
							</th>
							<td colspan="3" class="hp"><input type="text"
								class="m_hp inTxt rs-w150" id="phone1" maxlength="11"
								placeholder="휴대폰 번호 입력 (‘-’ 제외 11자리 입력)" style="width: 80px"
								title="휴대폰 번호 입력"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="right btn_area">
				<button class="tb_top right btn_blue btn_find_id" id="btn_find_id">아이디
					찾기</button>
			</div>
		</div>
	</div>
	</div>
</body>
</html>