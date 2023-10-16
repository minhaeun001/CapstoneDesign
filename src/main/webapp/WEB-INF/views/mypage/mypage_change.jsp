<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>MAKEGYM</title>
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script src="../../js/jquery-1.7.2.min.js"></script>
<script src="../../js/jquery-ui.min.js"></script>
<script src="../../js/script.js"></script>

<link href="../../js/aos.css" rel="stylesheet">
<script src="../../js/aos.js"></script>
</head>

<body class="bg_black">

	<!-- 배경 동영상 -->
	<video muted autoplay loop class="sub_video">
		<source src="../../img/clip2_640.mp4" type="video/mp4">
	</video>

	<div class="wrap">
		<%@include file="../include/header.jsp"%>
		<div class="wrap index">
			<div class="main">
				<h2>회원정보 수정</h2>
				<div class="signup">
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
									<td colspan="3"><span id="m_id">아이디</span></td>
								</tr>
								<tr class="name">
									<th scope="row">성명</th>
									<td colspan="3"><span>이름</span></td>
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
								<tr class="eml">
									<th scope="row">이메일 주소 <span class="essR"> ::before
											"필수" </span>
									</th>
									<td colspan="3" class="email"><input type="text"
										class="m_email_01 inTxt rs-w40" id="email_01"
										placeholder="이메일 주소" style="width: 120px; ime-mode: disabled;"
										title="이메일 아이디 입력"> <span class="dash"> @ </span> <label
										class="disn ">이메일 입력</label> <input type="text"
										class="m_email_02 inTxt rs-w45" id="email_02"
										style="width: 120px; ime-mode: disabled;" title="이메일 입력">
										<span class="selectboxWrap" style="width: 180px"> <label
											class="disn">이메일 선택</label> <select
											class="m_email_03 select selectBg" id="email_03"
											title="이메일 선택">
												<option value="">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hanmail.net">hanmail.net</option>
										</select>
									</span></td>
								</tr>
								<tr class="birth">
									<th scope="row"><label>생년 월일</label></th>
									<td><span>생일</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="right btn_area">
						<button class="tb_top right btn_blue btn_signup">정보수정</button>
					</div>
				</div>
			</div>
		</div>
</body>

</html>
