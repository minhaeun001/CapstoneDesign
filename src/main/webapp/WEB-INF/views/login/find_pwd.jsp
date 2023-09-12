<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM</title>
    <link rel="stylesheet" href="../../../css/common.css">
    <link rel="stylesheet" href="../../../css/style.css">
    <link rel="stylesheet" href="../../../css/signup.css">
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
	
	//******************************************************************************************** 
	//4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	//*********************************************************************************************/ 
    	
	//******************************************************************************************** 
	// 5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 
	
	
	//******************************************************************************************** 
	//6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/ 

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
                <h2>비밀번호 찾기</h2>
                <div class="signup_find_pwd">
                    <p> 
                        <i class="essR">
                        </i>
                        "필수입력"
                    </p>
                    <div class="signup_wrapper">
                        <table>
                            <caption>
                                <strong>웹 회원 정보입력 표</strong>
                                <p>웹 회원 정보입력으로 이름, 아이디, 비밀번호, 비밀번호 확인, 생년월일, 휴대폰, 이메일 정보를 입력</p>
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
                                        이름
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" class="m_nm inTxt rs-w100" id="m_szName" value maxlength="50" style="width: 180px;" title="이름 입력">
                                    </td>
                                </tr>
                                <tr class="phone">
                                    <th scope="row">
                                        전화번호
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3" class="hp">
                                        <input type="text" class="m_hp inTxt rs-w150" id="phone1" maxlength="11" placeholder="휴대폰 번호 입력 (‘-’ 제외 11자리 입력)" style="width:80px" title="휴대폰 번호 입력">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="right btn_area">
                        <button class="tb_top right btn_blue btn_signup">비밀번호 찾기</button>
                    </div>
                </div>            
            </div>
    </div>
</body>
</html>