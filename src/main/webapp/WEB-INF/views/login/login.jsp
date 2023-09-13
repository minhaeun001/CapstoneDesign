<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/login.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/script.js"></script>

    <link href="../../js/aos.css" rel="stylesheet">
    <script src="../../js/aos.js"></script>
    
    <script>

	//******************************************************************************************** 
	// 1. 전역변수 선언                               						                              														  
	//*********************************************************************************************/ 
	
	
	//******************************************************************************************** 
	//2. 최초 실행 함수                               						                              														  
	//*********************************************************************************************/ 
	$(document).ready(function() {
		
		init();
		
	});
	
	
	
	function init(){
		
	}
	
	//******************************************************************************************** 
	//3. ajax 함수                                 						                              														  
	//*********************************************************************************************/ 
	function fn_login(){
		var sUrl = "${pageContext.request.contextPath}/login/checkLoginLogic.ajax"
		
		var m_id = $(".m_id").val();
		var m_pwd = $(".m_pwd").val();
		
		var params = {
				m_id:m_id,
				m_pwd:m_pwd
		};
		
		$.ajax({
			url:sUrl,
			data:params,
			method:"post",
			dataType:"json",
			success: function(response){
				var msg = response.result.checkLoginResult[0].msg;
				var flag = response.result.checkLoginResult[0].flag;
				
				alert(msg);
				
				if (flag == "T") {
					location.href="../main/intro.do";
				} 
			},
			error: function(xhr, status, error){
				
			},
			complete: function(){
				
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
	$(document).on("click", ".btn_login", function(){
		if ($(".m_id").val() === "") {
			alert("아이디를 입력해주세요.");
			$(".m_id").focus();
			return ;
		}
		if ($(".m_pwd").val() === "") {
			alert("비밀번호를 입력해주세요.");
			$(".m_pwd").focus();
			return ;
		}
		fn_login();
	});
	
	$(document).on("keypress",".m_id, .m_pwd", function(){
		if (event.keyCode == 13){
			$(".btn_search").click();	
			}
		})
	
	$(document).on("keypress",".m_id, .m_pwd", function(){
		if (event.keyCode == 13){
			$(".btn_login").click();	
		}
	});
	
	$(document).on("click", ".remember_check", function(){
		var checkbox = $(this).val();
		$("#remember_check").prop("checked", function(i, checked) {
	        return !checked; // 체크 상태를 반전시킵니다.
	    });
	});
	
	$(document).on("click", ".btn_find_id", function(){
		location.href="../login/find_id.do";
	});
	
	$(document).on("click", ".btn_find_pwd", function(){
		location.href="../login/find_pwd.do";
	});
</script>
</head>

<body class="bg_black">
    
    <!-- 배경 동영상 -->
    <video muted autoplay loop class="index_video">
        <source src="../../img/clip2_640.mp4" type="video/mp4">
    </video>

    <div class="wrap index">
	<%@include file="../include/header.jsp" %>
        </div>
        <div class="main">
            <div class="login-wrapper">
                <h2>로그인</h2>
                <div class="login-div">
                    <input type="text" class="login_icon m_id" placeholder="아이디를 입력하세요">
                    <input type="password" class="pw_icon m_pwd" placeholder="비밀번호를 입력하세요">
                    <div class="remember-check">
                        <input type="checkbox" class="remember_check" id="remember_check">
                        <span class="remember_check"> 아이디 저장 </span>
                    </div>
                    <button class="btn_login">로그인</button>
                    <a class="go_signup" href="../login/signup.do">회원가입</a>
                    <div class="links">
                        <span class="btn_find btn_find_id">아이디 찾기</span> <span class="btn_find">|</span> <span class="btn_find btn_find_pwd">비밀번호 찾기</span>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</body>
</html>