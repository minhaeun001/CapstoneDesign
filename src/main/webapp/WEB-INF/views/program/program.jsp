<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>MAKEGYM_program</title>
<link rel="stylesheet" href="../../css/common.css">
<link rel="stylesheet" href="../../css/style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
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

	function init() {
		fn_getProgram();
	}

	//******************************************************************************************** 
	//3. ajax 함수                                 						                              														  
	//*********************************************************************************************/ 
	function fn_getProgram() {
		var sUrl = "${pageContext.request.contextPath}/program/get_program.ajax";
		var params = {};

		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				fn_program_bind(response.result)
			}

		})
	}

	function fn_register(p_id) {
		var sUrl = "${pageContext.request.contextPath}/program/buy_program.ajax";

		var params = {
			m_id : "",
			program_id : JSON.stringify(p_id)
		};

		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				if(response.flag){
					if (response.result > 0){
						alert("등록되었습니다.");
					}
				}else{
					alert("이미 구매한 강좌가 포함되어 있습니다.")
				}
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
	//*********************************************************************************************/ .
	function fn_program_bind(params) {
		$(".program_box div").remove();
		for (var i = 0; i < params.length; i++) {
			var tmp_str = "";
			tmp_str += '<div class="thumb">';
			tmp_str += '<input type="checkbox" name="btn_checked" class="btn_checked" value="'+params[i].PROGRAM_ID+'">';
			tmp_str += '<span class="thumb_imgBox" href="#">';
			tmp_str += '<img scr="'+params[i].PROGRAM_THUMBNAIL+'" />';
			tmp_str += '</span>';
			tmp_str += '<div class="thumb_textBox">';
			tmp_str += '<div class="thumb_eyebrow">';
			tmp_str += '<span class="thumb_category">트레이너 ' + params[i].M_NM
					+ '</span><span class="thumb_date">' + params[i].MOD_DTM
					+ '</span>';
			tmp_str += '</div>';
			tmp_str += '<a href="#" class="article_link">';
			tmp_str += '<strong class="thumb_tit">' + params[i].PROGRAM_TITLE
					+ '</strong>';
			tmp_str += '<p class="desc">' + params[i].PROGRAM_CONTENTS + '</p>';
			tmp_str += '</a>';
			tmp_str += '</div>';
			tmp_str += '</div>';

			$(".program_box").append(tmp_str);
		}
	}

	function fn_check() {
		var p_id = [];
		$("input:checkbox[name='btn_checked']").each(function() {
			if ($(this).is(":checked") == true) {
				p_id.push($(this).val());
			}

		});
		fn_register(p_id);
	}

	//******************************************************************************************** 
	//5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 

	//******************************************************************************************** 
	//6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/ 
	$(document).on("click", ".register_btn", function() {
		fn_check();
	});
</script>
<style>
.split:before {
	display: inline-block;
	content: "";
	width: 1px;
	height: 11px;
	margin: 0 7px;
	background-color: #333;
	vertical-align: middle;
}
</style>
</head>

<body>
	<div class="wrap">
		<%@include file="../include/header.jsp"%>
		<div class="main">
			<div class="inner">
				<div>
					<div class="tit">
						<h2>PROGRAM</h2>
					</div>
					<div class="board_search"
						style="text-align: center; line-height: 28px">원하는 트레이너를
						선택해보세요.</div>
					<div class="subscript">
						<div class="in">
							<button class="register_btn">
								등록하기<img src="../../img/icon_arrow.svg">
							</button>
						</div>
					</div>
				</div>
				<div class="news clear" data-aos="fade-up" data-aos-duration="2000">
					<section>
						<div class="program_box">
							<div class="tac">
								<button class="btn_more">더보기</button>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
