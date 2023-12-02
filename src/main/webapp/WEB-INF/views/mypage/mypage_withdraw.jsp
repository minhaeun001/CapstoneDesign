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
	}

	//******************************************************************************************** 
	//3. ajax 함수                                 						                              														  
	//*********************************************************************************************/
	function fn_with_draw() {
		var sUrl = "${pageContext.request.contextPath}/mypage/with_draw_ajax.ajax"
		var m_nm = $(".m_nm").val();
		var m_pwd = $(".m_pwd").val();

		var params = {
			m_nm : m_nm,
			m_pwd : m_pwd
		};

		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				var msg = response.result.msg;
				var flag = response.result.flag;

				alert(msg);

				if (flag == "T") {
					location.href = "../login/logout.do";
				}

			},
			error : function(xhr, error, status) {
				alert("실패했습니다. 다시 시도해주세요.");
			},
			complete : function() {
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
	$(document).on("click", ".btn_withdraw", function() {
		var confirmLogout = confirm("탈퇴하시겠습니까?");

		if (confirmLogout) {
			fn_with_draw();
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
								<h2>회원탈퇴</h2>
								<div class="signup_FindId withdraw">
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
												<tr class="name">
													<th scope="row">성명 <span class="essR"> ::before
															"필수" </span>
													</th>
													<td colspan="3"><input type="text"
														class="m_nm inTxt rs-w100" id="m_szName" value
														maxlength="50" style="width: 180px;" title="이름 입력"></td>
												</tr>
												<tr class="pswd">
													<th scope="row">비밀번호 <span class="essR">
															::before "필수" </span>
													</th>
													<td colspan="3"><input type="password"
														class="m_pwd inTxt rs-w100" id="m_szPwd"
														placeholder="8~14자리" maxlength="14"
														style="width: 180px; ime-mode: disabled;" title="비밀번호">
														<span class="cau05 pw_info pwd_message">8~14자리 (영문
															대소문자, 숫자, 특수문자 조합)</span></td>
												</tr>
												<tr class="repswd">
													<th scope="row">비밀번호 확인 <span class="essR">
															::before "필수" </span>
													</th>
													<td colspan="3" class="line2"><input type="password"
														class="m_pwd_chk inTxt rs-w100" id="m_szPwdChk"
														placeholder="비밀번호 재입력" maxlength="14"
														style="width: 180px; ime-mode: disabled;" title="비밀번호 확인">
														<span class="cau05 pw_info pwd_message_chk"></span></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="btn_area">
										<button class="tb_top btn_blue btn_mp btn_withdraw">회원탈퇴</button>
									</div>
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
