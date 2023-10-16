<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/signup.css">
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
		function fn_login(){
		var sUrl = "${pageContext.request.contextPath}/login/findMemberId.ajax"
		
		var m_id = $(".m_id").val();
		var m_hp = $(".m_hp").val();
		
		var params = {
				m_id:m_id,
				m_hp:m_hp
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
					alert(msg);
					location.href="../main/intro.do";
				} 
			},
			error: function(xhr, status, error){
				alert("아이디 찾기 실패");
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
		if ($(".m_id").val() === "") {
			alert("아이디를 입력해주세요.");
			$(".m_id").focus();
			return ;
		}
		if ($(".m_hp").val() === "") {
			alert("휴대폰 번호를 입력해주세요.");
			$(".m_hp").focus();
			return ;
		}
		fn_find_id();
	});
	
	$(document).on("keypress",".m_id, .m_hp", function(){
		if (event.keyCode == 13){
			$(".btn_find_id").click();	
		}
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
     <div class="wrap index">
            </div>
            <div class="main">
                <h2>회원탈퇴</h2>
                <div class="signup_FindId withdraw">
                    <p> 
                        <i class="essR">
                        </i>
                        "필수입력"
                    </p>
                    <div class="signup_wrapper">
                        <table>
                            <caption>
                                <strong>웹 회원 아이디 찾기위한 정보 입력</strong>
                                <p>웹 회원 정보입력으로 이름, 휴대폰, 이메일 정보를 입력</p>
                            </caption>
                            <colgroup>
                                <col style="width:160px">
                                <col style="width:280px">
                                <col style="width:100px">
                                <col class="sm-wd">
                            </colgroup>
                            <tbody>
                                <tr class="id">
                                    <th scope="row">
                                        아이디
                                        <span class="essR">
                                        </span>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" class="m_id inTxt rs-w100 id_input" id="m_szId" placeholder="6~12자리" maxlength="20" title="아이디 입력">
                                    </td>
                                </tr>
                                <tr class="name">
                                    <th scope="row">
                                        성명
                                        <span class="essR">
											::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" class="m_nm inTxt rs-w100" id="m_szName" value maxlength="50" style="width: 180px;" title="이름 입력">
                                    </td>
                                </tr>
                                <tr class="pswd">
                                    <th scope="row">
                                        비밀번호
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3">
                                    	<input type="password" class="m_pwd inTxt rs-w100" id="m_szPwd" placeholder="8~14자리" maxlength="14" style="width:180px;ime-mode:disabled;" title="비밀번호">
                                        <span class="cau05 pw_info pwd_message">8~14자리 (영문 대소문자, 숫자, 특수문자 조합)</span>
                                    </td>
                                </tr>
                                <tr class="repswd">
                                    <th scope="row">
                                        비밀번호 확인
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3" class="line2">
                                        <input type="password" class="m_pwd_chk inTxt rs-w100" id="m_szPwdChk" placeholder="비밀번호 재입력" maxlength="14" style="width:180px;ime-mode:disabled;" title="비밀번호 확인">
                                        <span class="cau05 pw_info pwd_message_chk"></span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="right btn_area">
                        <button class="tb_top right btn_blue btn_signup btn_withdraw">회원탈퇴</button>
                    </div>
                </div>            
            </div>
</body>
</html>