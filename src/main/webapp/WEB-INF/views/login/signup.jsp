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
		$(document).on("keyup", ".m_pwd", function(){
	        var m_pwd = $(".m_pwd").val();
			if (m_pwd == ""){
				$(".pwd_message").html("8~14자리 (영문 대소문자, 숫자, 특수문자 조합)").css("color", "#555");
				return ;
			} else if (m_pwd.length <=7) {
				$(".pwd_message").html("비밀번호가 너무 짧습니다.").css("color", "red");
				return ;
			} else if (m_pwd.length >=7 && m_pwd.length<=13){
				$(".pwd_message").html("가능한 비밀번호입니다.").css("color", "green");
				return ;
			} else if (m_pwd.length>=14){
				$(".pwd_message").html("비밀번호가 너무 깁니다.").css("color", "red");
				return ;
			}
		});
		
		$(document).on("keyup", ".m_pwd, .m_pwd_chk", function(){
	        var m_pwd = $(".m_pwd").val();
	        var m_pwd_chk = $(".m_pwd_chk").val();

	        if (m_pwd_chk === ""){
	        	$(".pwd_message_chk").html("").css("color", "black");
	        } else if (m_pwd === m_pwd_chk) {
	            $(".pwd_message_chk").html("비밀번호 일치").css("color", "green");
	        } else {
	            $(".pwd_message_chk").html("비밀번호 불일치").css("color", "red");
	        }
		});
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
			m_birth:m_birth
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
    	
	//******************************************************************************************** 
	// 5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 
	
	
	//******************************************************************************************** 
	//6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/ 
	$(document).on("click", ".btn_signup", function() {		

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
		if ($(".m_hp").val() === "") {
			alert("전화번호를 입력해주세요.");
			$(".m_hp").focus();
			return ;
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
		if ($(".m_birth_01").val() === "") {
			alert("생년을 입력해주세요.");
			$(".m_birth_01").focus();
			return ;
		}
		if ($(".m_birth_01").val() === "") {
			alert("생월을 입력해주세요.");
			$(".m_birth_01").focus();
			return ;
		}
		if ($(".m_birth_01").val  () === "") {
			alert("생일을 입력해주세요.");
			$(".m_birth_01").focus();
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
        	
        	fn_check();
        	
        });

        //아이디 수정시 무조건 체크했는지 플래그를 false로 변경
        $(document).on("change", "#m_szId", function(){
        	
        	$("#id_check").val("false");//체크 안한 상태로 만듬
        	
        });
        
        // 팝업에서 다시 중복체크 클릭 시
        $(".re_check").on('click', function(){
        	$("#m_szId").val($("#m_szId2").val());
        	fn_check();
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
                                                <option value="">년도</option><option value="2023">2023</option><option value="2022">2022</option><option value="2021">2021</option><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option>
                                            </select>
                                        </span>
                                        <span class="selectboxWrap" style="width:32%">
                                            <select class="m_birth_02 select selectBg" id="birthmm" title="월 선택">
                                                <option value="">월</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
                                            </select>
                                        </span>
                                        <label  class="disn">월</label>
                                        <span class="selectboxWrap" style="width:32%">
                                            <select class="m_birth_03 select selectBg" id="birthdd" title="일 선택">
                                                <option value="">일</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
                                            </select>
                                        </span>
                                        <label  class="disn">일</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="right btn_area">
                        <button class="tb_top right btn_blue btn_signup">가입</button>
                    </div>
                </div>            
            </div>
    </div>
</body>
</html>