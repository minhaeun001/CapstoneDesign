<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>MAKEGYM</title>
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/style.css">
<link rel="stylesheet" href="../../css/mypage.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script src="../../js/jquery-1.7.2.min.js"></script>
<script src="../../js/jquery-ui.min.js"></script>
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

	function init() {
		$(document).on("keyup", ".m_pwd", function(){
			pwd_check();
		});
		
		$(document).on("keyup", ".m_pwd, .m_pwd_chk", function(){
			pwd_compare();
		});
	}

	//******************************************************************************************** 
	//3. ajax 함수                                 						                              														  
	//*********************************************************************************************/
	function fn_mod_pwd(){
	    
		var sUrl = "${pageContext.request.contextPath}/login/fn_mod_pwd.ajax"
		
		var m_opwd  = $("#m_oPwd").val();
		var m_szpwd = $(".m_pwd").val();
		
		var params = {
				m_opwd:m_opwd,
				m_szpwd:m_szpwd
		};
		
		$.ajax({
			url:sUrl,
			data:params,
			method:"post",
			dataType:"json",
			success: function(response){
				var flag = response.result.flag;
				var msg = response.result.msg;
				
				alert(msg);
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
    function pwd_check(){
        var m_pwd = $(".m_pwd").val();
        $("#pwd_tf").val("false");//비밀번호 사용 불가능
        
        if (m_pwd == ""){
            $(".pwd_message").html("8~14자리 (영문 대소문자, 숫자, 특수문자 조합)").css("color", "#555");
            return ;
        } else if (m_pwd.length <=7) {
            if (validatePassword(m_pwd)){
                $(".pwd_message").html("비밀번호가 너무 짧습니다.").css("color", "red");
            } else {
                $(".pwd_message").html("영문 대소문자, 숫자, 특수문자를 섞어주세요.").css("color", "red");
            }
            return ;
        } else if (m_pwd.length >=7 && m_pwd.length<=13){
            if (validatePassword(m_pwd)){
                $(".pwd_message").html('<i class="fas fa-check-circle"></i>').css("color", "green");
                $("#pwd_tf").val("true");//비밀번호 사용 가능
                $(".fa-check-circle").addClass("show"); // 아이콘을 나타나게 함
            } else {
                $(".pwd_message").html("영문 대소문자, 숫자, 특수문자를 섞어주세요.").css("color", "red");
                $("#pwd_tf").val("false");//비밀번호 사용 불가능
                $(".fa-times-circle").addClass("show"); // 아이콘을 나타나게 함
            }
            return ;
        } else if (m_pwd.length>=14){
            $(".pwd_message").html("비밀번호가 너무 깁니다.").css("color", "red");
            return ;
        }
    }

    function pwd_compare(){
        var m_pwd = $(".m_pwd").val();
        var m_pwd_chk = $(".m_pwd_chk").val();
        $("#pwd_chk_check").val("false");//비밀번호 사용 불가능

        if (m_pwd_chk === ""){
            $(".pwd_message_chk").html("");
        } else if (m_pwd === m_pwd_chk) {
            $(".pwd_message_chk").html('<i class="fas fa-check-circle"></i>').css("color", "green");
            $("#pwd_chk_check").val("true");//비밀번호 사용 불가능
            $(".fa-check-circle").addClass("show"); // 아이콘을 나타나게 함
        } else {
            $(".pwd_message_chk").html('<i class="fas fa-times-circle"></i>').css("color", "red");
            $(".fa-times-circle").addClass("show"); // 아이콘을 나타나게 함
        }
    }

    function validatePassword(password) {
        // 비밀번호에 대문자, 소문자, 특수문자가 각각 하나 이상 포함되어야 합니다.
        var uppercaseRegex = /[A-Z]/;
        var lowercaseRegex = /[a-z]/;
        var specialCharRegex = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]/;

        if (
            uppercaseRegex.test(password) &&
            lowercaseRegex.test(password) &&
            specialCharRegex.test(password)
        ) {
            return true; // 조건을 충족하는 경우
        } else {
            return false; // 조건을 충족하지 않는 경우
        }
    }
	//******************************************************************************************** 
	// 5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 

	//******************************************************************************************** 
	//6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/
	$(document).on("click", ".btn_change", function() {
		var pwd_tf = $("#pwd_tf").val();
		var pwd_chk_check = $("#pwd_chk_check").val();
		
		if ($(".m_pwd").val() === "") {
			alert("비밀번호를 입력해주세요.");
			$(".m_pwd").focus();
			return ;
		}
		if ($(".m_pwd_chk").val() === "") {
			alert("비밀번호를 확인해주세요.");
			$(".m_pwd_chk").focus();
			return ;
		}
		if ($(".m_pwd").val() != $(".m_pwd_chk").val()) {
			alert("비밀번호를 확인해주세요.");
			$(".m_pwd_chk").focus();
			return ;
		}
		if (pwd_tf == "true" && pwd_chk_check =="true"){
		} else {
			alert("비밀번호를 확인해주세요.")
			$(".m_pwd").focus();
			return ;
		}
		fn_mod_pwd();
	});
</script>
</head>

<body class="bg_black">

	<!-- 배경 동영상 -->
	<video muted autoplay loop class="sub_video">
		<source src="../../img/clip2_640.mp4" type="video/mp4">
	</video>

	<div class="wrap">
		<%@include file="../include/header.jsp"%>
		<div class="main mypage_main" style="position: relative;">
			<div class="inner" style="width: 1300px;">
				<section class="introduce" style="margin-top: 0px;">
					<div class="exTab_sub" data-aos="fade-up" data-aos-duration="1000">
						<div class="group clear" style="display: block;">
							<div class="mypage_left">
								<%@include file="../include/mypage_left_area.jsp"%>
							</div>
							<div class="mypage_right">
								<!-- 마이페이지 우측 콘텐츠 -->
								<h2>비밀번호 수정</h2>
								<p>
									<i class="essR"> </i> "필수입력"
								</p>
								<div class="signup_wrapper">
									<table>
										<colgroup>
											<col style="width: 300px">
											<col style="width: 420px">
										</colgroup>
										<tbody>
											<tr class="id">
												<th scope="row">기존 비밀번호 <span class="essR"> </span>
												</th>
												<td colspan="3"><input type="password"
													class="m_opwd inTxt rs-w100" id="m_oPwd"
													placeholder="8~14자리" maxlength="14"
													style="width: 180px; ime-mode: disabled;" title="비밀번호"></td>
											</tr>
											<tr class="name">
												<th scope="row">새 비밀번호 <span class="essR"> </span>
												</th>
												<td colspan="3"><input type="password"
													class="m_pwd inTxt rs-w100" id="m_szPwd"
													placeholder="8~14자리" maxlength="14"
													style="width: 180px; ime-mode: disabled;" title="비밀번호">
													<span class="cau05 pw_info pwd_message">8~14자리 (영문
														대소문자, 숫자, 특수문자 조합)</span> <input type="hidden" id="pwd_tf"
													value="false">
											</tr>
											<tr class="name">
												<th scope="row">새 비밀번호 확인 <span class="essR"> </span>
												</th>
												<td colspan="3"><input type="password"
													class="m_pwd_chk inTxt rs-w100" id="m_szPwdChk"
													placeholder="비밀번호 재입력" maxlength="14"
													style="width: 180px; ime-mode: disabled;" title="비밀번호 확인">
													<span class="cau05 pw_info pwd_message_chk"></span> <input
													type="hidden" id="pwd_chk_check" value="false">
											</tr>
										</tbody>
									</table>
								</div>
								<div class="btn_area">
									<button class="btn_change">변경하기</button>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>

</html>
