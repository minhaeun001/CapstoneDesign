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
		fn_program_info();
	}

	//******************************************************************************************** 
	//3. ajax 함수                                 						                              														  
	//*********************************************************************************************/
	function fn_program_info() {

		var sUrl = "${pageContext.request.contextPath}/mypage/program_info.ajax";
		var params = {
			m_id : ""
		};

		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				fn_listType_bind(response);
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
	function fn_listType_bind(params) {

		$(".tb_type1:eq(0) tr:gt(0)").remove();

		var tmpStr = "";

		if (params.result.length > 0) {

			for (var i = 0, j = params.result.length; i < j; i++) {

				tmpStr += "<tr class='training' data-seqno='"+params.result[i].SEQ_NO+"'>";
				tmpStr += "<td class='td_overflow'>" + params.result[i].PROGRAM_TITLE
						+ "</td>";
				tmpStr += "<td class='td_overflow'>"
						+ params.result[i].M_NM + "</td>";
				tmpStr += "<td>" + params.result[i].REGNT_DTM + "</td>";
				tmpStr += "</tr>";

			}

		} else {

			tmpStr += "<tr>";
			tmpStr += "	<td colspan='3' style='text-align:center;'> 등록된 프로그램이 없습니다. </td>";
			tmpStr += "</tr>";
		}

		$(".tb_type1 tbody").append(tmpStr);

	}
	//******************************************************************************************** 
	// 5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 

	//******************************************************************************************** 
	//6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/
	$(document).on("click", ".training", function() {
		seqno = $(this).data("seqno");
		
		location.href = "../mypage/training.do?seqno="+seqno;
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
								<h2 class="mypage_h2">MY PAGE</h2>
								<p class="mypage_h2">현재 수강중인 강좌</p>
								<div class="baord aos-init aos-animate" data-aos="fade-up"
									data-aos-duration="1000">
									<table class="tb_type1">
										<colgroup>
										<col style="width: 30%">
										<col style="width: 40%">
										<col style="width: 30%">
										</colgroup>
										<tbody class="mypage_tbody">
											<tr>
												<th scope="col" id="lectureTitl">강좌 이름</th>
												<th scope="col" id="trainer">트레이너</th>
												<th scope="col" id="deadline">기한</th>
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
					</div>
				</section>
			</div>
		</div>
	</div>
</body>

</html>
