<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/signup.css">
    <script src="https://kit.fontawesome.com/cac80fd1df.js" crossorigin="anonymous"></script>
    
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
		$(document).on("keyup", ".m_pwd", function(){
			pwd_check();
		});
		
		$(document).on("keyup", ".m_pwd, .m_pwd_chk", function(){
			pwd_compare();
		});
		
		make_birth();
	}
	
	//******************************************************************************************** 
	//3. ajax 함수                                 						                              														  
	//*********************************************************************************************/ 
	//가입 함수
	function fn_signup(){
		
		var sUrl = "${pageContext.request.contextPath}/login/member_signup.ajax";
		
		var m_id = $("#m_szId").val();
		var m_pwd = $(".m_pwd").val();
		var m_pwd_chk = $(".m_pwd_chk").val();
		var m_nm = $(".m_nm").val();
		var m_hp = $(".m_hp").val();
		var use_yn = 'N';
		if ($("#use_yn").prop("checked")){
			var use_yn = 'Y';
		}
		 
		var m_email_01 = $(".m_email_01").val();
		var m_email_02 = $(".m_email_02").val();
		var m_email_03 = $(".m_email_03 option:selected").val();
		var m_email = m_email_01 + "@" + m_email_02 ;
		
		var m_birth_01 = $(".m_birth_01 option:selected").val();
		var m_birth_02 = $(".m_birth_02 option:selected").val();
		var m_birth_03 = $(".m_birth_03 option:selected").val();
		var m_birth = String(m_birth_01) + String(m_birth_02) + String(m_birth_03);
		
		
		//파라미터
		var params = {
			m_id:m_id,
			m_pwd:m_pwd,
			m_pwd_chk:m_pwd_chk,
			m_nm:m_nm,
			m_hp:m_hp,
			m_email:m_email,
			m_birth:m_birth,
			use_yn:use_yn
		};
		
		$.ajax({
			url:sUrl,
			data:params,
			method: "post",
			dataType: "json",
			success: function(response){
				alert("회원가입 되었습니다.");
				location.href="../main/intro.do";
			},
			error: function(xhr, status, error){
				alert("error");
			},
			complete: function(){
				//콜백함수
			},
			
		});
	}
	
	//id 중복확인
	function fn_check(){
		
		$("#m_szId").val( $.trim( $("#m_szId").val() ));
		
		if ( $("#m_szId").val() == ""){
			
			alert("아이디를 입력해주세요.");
			
			return;
			
		}
		
		var sUrl = "${pageContext.request.contextPath}/login/member_signupcheck.ajax";
		
		
		
		var m_id = $("#m_szId").val();

		//파라미터
		var params = {
			m_id:m_id
		};
		
		$.ajax({
			url:sUrl,
			data:params,
			method: "post",
			dataType: "json",
			success: function(response){
				var dblCheckFlag = response.result.SignupCheck[0].dblCheckFlag;
				
	            var id = $(".id_input").val();
	            $(".nickname").html("'"+id+"'");

	            if(dblCheckFlag == "true"){
	            	$("#chk_img").html("<img src='../../../img/able.png' alt=''>");
	            	$("#chk_msg").text("사용할수 있는 아이디 입니다.");
	            	$("#id_check").val("true");//중복체크 성공
	            } else if (dblCheckFlag == "false"){
	            	$("#chk_img").html("<img src='../../../img/disable.png' alt=''>");
	            	$("#chk_msg").text("이미 사용중인 아이디 입니다.");
	            	$("#id_check").val("false");//중복체크 실패
				}
				
				$(".popup.fail").show();
				
			},
			error: function(xhr, status, error){
				alert("error");
			},
			complete: function(){
				//콜백함수
			}
			
		});
	}
	//******************************************************************************************** 
	//4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	//*********************************************************************************************/ 
    function hide_popup(){
        $(".popup").hide();
        
    }
	
    function validateUsername(username) {
        // 길이 제한 검사
        if (username.length < 6 || username.length > 12) {
            return false;
        }

        // 허용 문자 검사 (영문 소문자, 대문자, 숫자, 밑줄)
        var pattern = /^[a-zA-Z0-9_]+$/;
        if (!pattern.test(username)) {
            return false;
        }

        return true;
    }
	
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
    
    function validatePhoneNumber(phoneNumber) {
        // 숫자 이외의 문자 제거
        var cleanedPhoneNumber = phoneNumber.replace(/\D/g, '');

        // 정확히 10자리인지 확인 (일반적인 국내 휴대폰 번호 길이)
        if (cleanedPhoneNumber.length !== 11) {
            return false;
        }

        // 숫자만으로 이루어져 있는지 확인
        if (!/^\d+$/.test(cleanedPhoneNumber)) {
            return false;
        }

        return true;
    }
   
    
    function validateEmail(email) {
        // 이메일 주소의 유효성을 검사하는 정규 표현식
        var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

        return emailRegex.test(email);
    }
    
    function validateDate(year, month, day) {
        // 연도, 월, 일을 정수로 변환
        year = parseInt(year, 10);
        month = parseInt(month, 10);
        day = parseInt(day, 10);

        // 연도 범위 확인 (예: 1923년부터 현재 년도까지)
        var currentYear = new Date().getFullYear();
        var startYear = 1923;
        if (year < startYear || year > currentYear) {
            return false; // 연도가 유효 범위를 벗어남
        }

        // 월 범위 확인 (1부터 12까지)
        if (month < 1 || month > 12) {
            return false; // 월이 유효 범위를 벗어남
        }

        // 일 범위 확인
        var daysInMonth;
        if (month === 2) {
            // 2월은 윤년 여부에 따라 다르게 처리
            if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0) {
                daysInMonth = 29; // 윤년
            } else {
                daysInMonth = 28; // 평년
            }
        } else if ([4, 6, 9, 11].includes(month)) {
            // 4, 6, 9, 11월은 30일까지
            daysInMonth = 30;
        } else {
            // 나머지 월은 31일까지
            daysInMonth = 31;
        }

        if (day < 1 || day > daysInMonth) {
            return false; // 일이 유효 범위를 벗어남
        }

        return true; // 모든 유효성 검사를 통과함
    }

    function make_birth(){
    	  var birthYearSelect = $("#birthyy");
     	  var monthSelect = $(".m_birth_02");
     	  var daySelect = $(".m_birth_03");

   	    // 시작 연도와 끝 연도 설정 (예: 1900부터 현재 연도까지)
   	    var currentYear = new Date().getFullYear();
   	    var startYear = 1923;

   	    // option 요소를 동적으로 추가
   	    for (var year = startYear; year <= currentYear; year++) {
   	        var option = $("<option>").val(year).text(year);
   	        birthYearSelect.append(option);
   	    }
   	    
   	    for (var month = 1; month <= 12; month++) {
   	        var option = $("<option>").val(month).text(month);
   	        monthSelect.append(option);
   	    }
   	   
   	    for (var day = 1; day <= 31; day++) {
   	        var option = $("<option>").val(day).text(day);
   	        daySelect.append(option);
   	    }
   	 
    }
	//******************************************************************************************** 
	// 5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 
	
	
	//******************************************************************************************** 
	//6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/ 
	$(document).on("click", ".btn_signup", function() {
		var pwd_tf = $("#pwd_tf").val();
		var pwd_chk_check = $("#pwd_chk_check").val();
		var email = $(".m_email_01").val() + "@" + $(".m_email_02").val();
		var m_hp = $(".m_hp").val();
		
		if ($("#m_szId").val() === "") {
			alert("아이디를 입력해주세요.");
			$("#m_szId").focus();
			return ;
		}
		
		if ($("#id_check").val() === "false") {
			alert("아이디 중복체크를 해주세요.");
			$("#m_szId").focus();
			return ;
		}
		
		
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
		if ($(".m_nm").val() === "") {
			alert("이름을 입력해주세요.");
			$(".m_nm").focus();
			return ;
		}
		if (validatePhoneNumber(m_hp)) {
		    // 전화 번호가 유효하다면
		} else {
		    alert("전화번호를 확인해주세요.");
		    $(".m_hp").focus();
		    return;
		}
		if ($(".m_email_01").val() === "") {
			alert("이메일을 입력해주세요.");
			$(".m_email_01").focus();
			return ;
		}
		if ($(".m_email_02").val() === "") {
			alert("이메일을 입력해주세요.");
			$(".m_email_02").focus();
			return ;
		}
		if (validateEmail(email)) {
			
		} else {
			alert("유효하지 않은 이메일 주소입니다.");
			$(".m_email_02").focus();
			return ;
		}
		
		var year = $(".m_birth_01").val();
		var month = $(".m_birth_02").val();
		var day = $(".m_birth_03").val();
		
		if (year === "") {
			alert("생년을 입력해주세요.");
			$(".m_birth_01").focus();
			return ;
		}
		if (month === "") {
			alert("생월을 입력해주세요.");
			$(".m_birth_02").focus();
			return ;
		}
		if (day === "") {
			alert("생일을 입력해주세요.");
			$(".m_birth_01").focus();
			return ;
		}
		
	    if (validateDate(year, month, day)) {
	        // 날짜가 유효한 경우
	        // 원하는 동작 수행
	    } else {
	        alert("유효하지 않은 날짜입니다.");
	        return;
	        // 유효하지 않은 날짜에 대한 처리
	    }
		if ($("#use_yn").prop("checked")) {
		    // 체크박스가 체크된 경우, 원하는 동작을 수행하거나 넘어갈 수 있습니다.
		} else {
		    alert("개인정보 사용에 동의해주세요.");
		    return;
		}
		if (pwd_tf == "true" && pwd_chk_check =="true"){
		} else {
			alert("비밀번호를 확인해주세요.")
			$(".m_pwd").focus();
			return ;
		}
		
		
		fn_signup();
	});
	
    $(function(){
        $(".id_input").on('keyup', function(){
            str = $(".id_input").val();
            if(str != ""){
                $(".btn_check").addClass('btn_check_active');
            }else{
                $(".btn_check").removeClass('btn_check_active');
            }
        });
        
        // '중복확인' 클릭시 작동
        $(".btn_check").on('click', function(){
        	 var username = $("#m_szId").val();
        	 if (validateUsername(username)) {
        		 fn_check();
        	    } else {
        	        alert("유효하지 않은 아이디입니다.");
        	    }    	
        });

        //아이디 수정시 무조건 체크했는지 플래그를 false로 변경
        $(document).on("change", "#m_szId", function(){
        	
        	$("#id_check").val("false");//체크 안한 상태로 만듬
        	
        });
        
        // 팝업에서 다시 중복체크 클릭 시
        $(".re_check").on('click', function(){
        	$("#m_szId").val($("#m_szId2").val());
        	var username = $("#m_szId").val();
       	 if (validateUsername(username)) {
    		 fn_check();
    	    } else {
    	        alert("유효하지 않은 아이디입니다.");
    	    }
        });
        
        // 팝업에서 취소버튼 클릭시
        $(".cancel").on('click', function(){
        	$("#id_check").val("false");
        	$(".popup").hide();
        });

        // 팝업에서 확인버튼 클릭시
        $(".confirm").on('click', function(){
        	$(".popup").hide();
        	
        });

        // 팝업 내의 '사용하기' 클릭시 작동
        $(".use").on('click', function(){ 
        	$(".popup").hide();
        })
    });    
	
	$(document).on("keypress",".id_input", function(){
		if (event.keyCode == 13){
			$(".btn_check").click();	
		}
	});
    
	$(document).on("change", ".m_email_03", function(){
		var m_email_03 = $(this).val();
		$(".m_email_02").eq(0).val(m_email_03);
	});
</script>
    
</head>

<body class="bg_black">
    <!-- 팝업창 시작 -->
    <div class="popup success hidden">
        <div class="check_info">
            <img src="../../../img/able.png" alt="">
            <div class="text">
                입력하신<span class="nickname"></span>는
                <br>
                사용가능합니다.
            </div>
            <button class="use">사용하기</button>
        </div>
    </div>
    <div class="popup fail hidden">
	    <div class="check_info">
	        
	        <span id="chk_img"></span>
	        <div class="text">
	            <span>
	                입력하신<span class="nickname"></span>는
	                <br>
	                <span id="chk_msg"></span>
	            </span>
	        </div>
	        <div class="diff_id">
	            다른 아이디 입력
	            <br>
	            <input type="text" class="diff_id_input" id="m_szId2" placeholder="6~12자 아이디를 입력해주세요" >
	            <button class="re_check">중복확인</button>
	        </div>
	        <div class="button_area">
	            <button class="cancel">취소</button>
	            <button class="confirm">확인</button>
	        </div>
	    </div>
	</div>
    <!-- 팝업창 종료 -->
    <!-- 배경 동영상 -->
    <video muted autoplay loop class="index_video">
        <source src="../../img/clip2_640.mp4" type="video/mp4">
    </video>

    <div class="wrap index">
    	<%@include file="../include/header.jsp" %>
            </div>
            <div class="main">
                <h2>회원가입</h2>
                <div class="signup">
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
										<input type="hidden" id="id_check" value="false">
										<button class="tbtns rs-mt5 btn_check btn_blue" title="중복확인">중복확인</button>
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
                                        <input type="hidden" id="pwd_tf" value="false">
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
                                        <input type="hidden" id="pwd_chk_check" value="false">
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
                                        <input type="text" class="m_nm inTxt rs-w100" id="m_szName" placeholder="이름을 입력해주세요." value maxlength="50" style="width: 180px;" title="이름 입력">
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
                                <tr class="eml">
                                    <th scope="row">
                                        이메일 주소
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3" class="email">
                                        <input type="text" class="m_email_01 inTxt rs-w40" id="email_01" placeholder="이메일 주소" style="width:120px;ime-mode:disabled;" title="이메일 아이디 입력">
                                        <span class="dash"> @ </span>
                                        <label class="disn ">이메일 입력</label>
                                        <input type="text" class="m_email_02 inTxt rs-w45" id="email_02" style="width:120px; ime-mode:disabled;" title="이메일 입력">
                                        <span class="selectboxWrap" style="width:180px">
                                            <label class="disn">이메일 선택</label>
                                            <select class="m_email_03 select selectBg" id="email_03"  title="이메일 선택">
                                                <option value="">직접입력</option>
                                                
                                                <option value="naver.com">naver.com</option>
                                                
                                                <option value="gmail.com">gmail.com</option>

                                                <option value="hanmail.net">hanmail.net</option>
                                                
                                            </select>
                                        </span>
                                    </td>
                                </tr>
                                <tr class="birth">
                                    <th scope="row">
                                        <label >생년 월일</label>
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td>
                                        <span class="selectboxWrap" style="width:32%">
                                            <select class="m_birth_01 select selectBg" id="birthyy" title="년도 선택">
                                                <option value="">년도</option>
                                            </select>
                                        </span>
                                        <span class="selectboxWrap" style="width:32%">
                                            <select class="m_birth_02 select selectBg" id="birthmm" title="월 선택">
                                                <option value="">월</option>
                                            </select>
                                        </span>
                                        <label  class="disn">월</label>
                                        <span class="selectboxWrap" style="width:32%">
                                            <select class="m_birth_03 select selectBg" id="birthdd" title="일 선택">
                                                <option value="">일</option>
                                            </select>
                                        </span>
                                        <label  class="disn">일</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
					<p class="identify"><span class="essR">::before "필수"</span> 개인정보 사용에 동의합니다. <input type="checkbox" id="use_yn"></p>
                    <div class="right btn_area">
                        <button class="tb_top right btn_blue btn_signup">가입</button>
                    </div>
                </div>            
            </div>
    </div>
</body>
</html>