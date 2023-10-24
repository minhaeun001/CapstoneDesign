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
</head>

<body class="bg_black">

	<!-- 배경 동영상 -->
	<video muted autoplay loop class="sub_video">
		<source src="../../img/clip2_640.mp4" type="video/mp4">
	</video>

	<div class="wrap">
		<%@include file="../include/header.jsp"%>
		<div class="main admin_main" style="position: relative;">
			<div class="inner" style="width: 1300px;">
				<section class="introduce" style="margin-top: 0px;">
					<div class="exTab_sub" data-aos="fade-up" data-aos-duration="1000">
						<div class="group clear" style="display: block;">
							<div class="admin_left">
								<div class="admin_left_top">
									<h> 관리자페이지 </h>
								</div>
								<div class="admin_left_middle1">
									<div class="middle1_list">
										<li class="middle1_list_top">회원관리</li>
									</div>
								</div>
							</div>
							<div class="admin_right">
								<div class="tit">
									<h2 class="admin_h2">회원 관리</h2>
								</div>
								<div class="baord aos-init aos-animate" data-aos="fade-up"
									data-aos-duration="1000">
									<table class="tb_type1 notice">
										<colgroup>
											<col style="width: 5%;">
											<col style="width: 10%">
											<col style="width: 15%">
											<col style="width: 20%">
											<col style="width: 20%">
											<col style="width: 15%">
											<col style="width: 15%">
										</colgroup>
										<tbody class="admin_tbody">
											<tr>
												<th scope="col"><input type="checkbox" id="chkRowAll"></th>
												<th scope="col">성명</th>
												<th scope="col">아이디</th>
												<th scope="col">전화번호</th>
												<th scope="col">이메일 주소</th>
												<th scope="col">회원 상태</th>
												<th scope="col">상태 변경</th>
											</tr>
											<tr>
												<td class="chkBox"><input type="checkbox"></td>
												<td>민하은</td>
												<td>qpalzm1226</td>
												<td>010-1234-5678</td>
												<td>abcdefg1234@naver.com</td>
												<td>사용중</td>
												<td><select class="m_email_03 select selectBg"
													title="이메일 선택">
														<option value="naver.com">사용중</option>
														<option value="gmail.com">사용정지</option>
														<option value="hanmail.net">보류중</option>
												</select></td>
											</tr>
											<tr>
												<td class="chkBox"><input type="checkbox"></td>
												<td>박정윤</td>
												<td>qpalzm0922</td>
												<td>010-1234-5678</td>
												<td>abcdefg1234@naver.com</td>
												<td>사용중</td>
												<td><select class="m_email_03 select selectBg"
													title="이메일 선택">
														<option value="naver.com">사용중</option>
														<option value="gmail.com">사용정지</option>
														<option value="hanmail.net">보류중</option>
												</select></td>
											</tr>
											<tr>
												<td class="chkBox"><input type="checkbox"></td>
												<td>박윤선</td>
												<td>qpalzm0911</td>
												<td>010-1234-5678</td>
												<td>abcdefg1234@naver.com</td>
												<td>사용중</td>
												<td><select class="m_email_03 select selectBg"
													title="이메일 선택">
														<option value="naver.com">사용중</option>
														<option value="gmail.com">사용정지</option>
														<option value="hanmail.net">보류중</option>
												</select></td>
											</tr>
											<tr>
												<td class="chkBox"><input type="checkbox"></td>
												<td>양승빈</td>
												<td>qpalzm1122</td>
												<td>010-1234-5678</td>
												<td>abcdefg1234@naver.com</td>
												<td>사용정지</td>
												<td><select class="m_email_03 select selectBg"
													title="이메일 선택">
														<option value="naver.com">사용중</option>
														<option value="gmail.com">사용정지</option>
														<option value="hanmail.net">보류중</option>
												</select></td>
											</tr>
											<tr>
												<td class="chkBox"><input type="checkbox"></td>
												<td>김태림</td>
												<td>qpalzm0929</td>
												<td>010-1234-5678</td>
												<td>abcdefg1234@naver.com</td>
												<td>사용중</td>
												<td><select class="m_email_03 select selectBg"
													title="이메일 선택">
														<option value="naver.com">사용중</option>
														<option value="gmail.com">사용정지</option>
														<option value="hanmail.net">보류중</option>
												</select></td>
											</tr>
											<tr>
												<td class="chkBox"><input type="checkbox"></td>
												<td>김민아</td>
												<td>qpalzm1234</td>
												<td>010-1234-5678</td>
												<td>abcdefg1234@naver.com</td>
												<td>사용정지</td>
												<td><select class="m_email_03 select selectBg"
													title="이메일 선택">
														<option value="naver.com">사용중</option>
														<option value="gmail.com">사용정지</option>
														<option value="hanmail.net">보류중</option>
												</select></td>
											</tr>
											<tr>
												<td class="chkBox"><input type="checkbox"></td>
												<td>전준우</td>
												<td>qpalzm5678</td>
												<td>010-1234-5678</td>
												<td>abcdefg1234@naver.com</td>
												<td>사용중</td>
												<td><select class="m_email_03 select selectBg"
													title="이메일 선택">
														<option value="naver.com">사용중</option>
														<option value="gmail.com">사용정지</option>
														<option value="hanmail.net">보류중</option>
												</select></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="paging">
									<a href="#" class="prev_end"></a> <a href="#" class="prev"></a>
									<a href="#" class="on">1</a> <a href="#">2</a> <a href="#">3</a>
									<a href="#">4</a> <a href="#">5</a> <a href="#" class="next"></a>
									<a href="#" class="next_end"></a>
								</div>
							</div>
						</div>
						<div class="group">내용2</div>
						<div class="group">내용3</div>
						<div class="group">내용4</div>
						<div class="group">내용5</div>
						<div class="group">내용6</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>

</html>
