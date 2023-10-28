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

		init_();

	});

	function init_() {
		fn_InfoDetail();
	}

	//******************************************************************************************** 
	//3. ajax 함수                                 						                              														  
	//*********************************************************************************************/
	//게시글 상세 페이지 호출
	function fn_InfoDetail() {

		var sUrl = "${pageContext.request.contextPath}/mypage/mypage_view.ajax";
		var params = {
			m_id : "i"
		};

		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				fn_Bind(response);
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

	function fn_Bind(response) {

		var m_id = response.result[0].M_ID;
		var m_nm = response.result[0].M_NM;
		var m_hp = response.result[0].M_HP;
		var m_email = response.result[0].M_EMAIL;
		var m_birth = response.result[0].M_BIRTH;

		var atIndex = m_email.indexOf('@'); // '@' 기준으로 인덱스 찾기
		var m_email_01 = m_email.slice(0, atIndex); // '@' 이전 부분을 추출
		var m_email_02 = m_email.slice(atIndex + 1); // '@' 이후 부분을 추출

		// 연도, 월, 일 부분을 추출
		var year = m_birth.slice(0, 4);
		var month = m_birth.slice(4, 5);
		var day = m_birth.slice(5, 7);

		// 월이나 일이 한 자리 수일 경우 앞에 0을 붙이기
		month = month.charAt(0) === "0" ? month.charAt(1) : month;
		day = day.charAt(0) === "0" ? day.charAt(1) : day;

		console.log($("#m_id").html());

		// 변환된 날짜 문자열 생성
		var formattedDate = year + "년 " + month + "월 " + day + "일";

		$("#m_id").html(m_id);
		$("#m_nm").html(m_nm);
		$("#m_hp").val(m_hp);
		$("#m_email_01").val(m_email_01);
		$("#m_email_02").val(m_email_02);
		$("#m_birth").html(formattedDate);
	}
	//******************************************************************************************** 
	// 5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 

	//******************************************************************************************** 
	//6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/
	$(document).on("change", "#m_email_03", function() {
		var m_email_03 = $(this).val();
		$("#m_email_02").eq(0).val(m_email_03);
	});

	//"저장" 버튼 클릭 시 수정 내용 서버로 전송
$(document).on("click", ".btn_modify", function() {
    var m_hp = $("#m_hp").val();
    var m_email_01 = $("#m_email_01").val();
    var m_email_02 = $("#m_email_02").val();
    var m_email_03 = $("#m_email_03").val();
    var email = m_email_01 + "@" + m_email_02;

    if (!validatePhoneNumber(m_hp)) {
        alert("전화번호를 확인해주세요.");
        $("#m_hp").focus();
        return;
    }

    if (m_hp === "") {
        alert("휴대폰 번호는 필수항목입니다.");
        $("#m_hp").focus();
        return;
    }

    if (m_email_01 === "") {
        alert("이메일은 필수항목입니다.");
        $("#m_email_01").focus();
        return;
    }

    if (m_email_02 === "") {
        alert("이메일은 필수항목입니다.");
        $("#m_email_02").focus();
        return;
    }

    if (!validateEmail(email)) {
        alert("유효하지 않은 이메일 주소입니다.");
        $("#m_email_02").focus();
        return;
    }
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
								<h2>회원정보 수정</h2>
								<p>
									<i class="essR"> </i> "필수입력"
								</p>
								<div class="signup_wrapper">
									<table>
										<colgroup>
											<col style="width: 160px">
											<col style="width: 280px">
											<col style="width: 100px">
											<col class="sm-wd">
										</colgroup>
										<tbody>
											<tr class="id">
												<th scope="row">아이디</th>
												<td colspan="3"><span id="m_id"></span></td>
											</tr>
											<tr class="name">
												<th scope="row">성명</th>
												<td colspan="3"><span span id="m_nm">이름</span></td>
											</tr>
											<tr class="phone">
												<th scope="row">전화번호 <span class="essR">
														::before "필수" </span>
												</th>
												<td colspan="3" class="hp"><input type="text"
													class="m_hp inTxt rs-w150" id="m_hp" maxlength="11"
													placeholder="휴대폰 번호 입력 (‘-’ 제외 11자리 입력)"
													style="width: 80px" title="휴대폰 번호 입력"></td>
											</tr>
											<tr class="eml">
												<th scope="row">이메일 주소 <span class="essR">
														::before "필수" </span>
												</th>
												<td colspan="3" class="email"><input type="text"
													class="m_email_01 inTxt rs-w40" id="m_email_01"
													placeholder="이메일 주소"
													style="width: 120px; ime-mode: disabled;"
													title="이메일 아이디 입력"> <span class="dash"> @ </span> <label
													class="disn ">이메일 입력</label> <input type="text"
													class="m_email_02 inTxt rs-w45" id="m_email_02"
													style="width: 120px; ime-mode: disabled;" title="이메일 입력">
													<span class="selectboxWrap" style="width: 180px"> <label
														class="disn">이메일 선택</label> <select
														class="m_email_03 select selectBg" id="m_email_03"
														title="이메일 선택">
															<option value="">직접입력</option>
															<option value="naver.com">naver.com</option>
															<option value="gmail.com">gmail.com</option>
															<option value="hanmail.net">hanmail.net</option>
													</select>
												</span></td>
											</tr>
											<tr class="birth">
												<th scope="row">생년 월일</th>
												<td><span id="m_birth">생일</span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="btn_area">
									<button class="tb_top btn_blue btn_mp btn_modify">정보수정</button>
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
