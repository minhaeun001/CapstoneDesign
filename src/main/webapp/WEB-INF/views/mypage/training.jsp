<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String seqno = request.getParameter("seqno");
%>

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

<script>
	//******************************************************************************************** 
	// 1. 전역변수 선언                               						                              														  
	//*********************************************************************************************/ 
	var seqno = "<%=seqno%>";
	//******************************************************************************************** 
	// 2. 최초 실행 함수                               						                              														  
	//*********************************************************************************************/ 

	$(document).ready(function() {

		init();

	});

	function init() {
		fn_running_program_info();
	}

	//******************************************************************************************** 
	//3. ajax 함수                                 						                              														  
	//*********************************************************************************************/
	function fn_running_program_info() {

		var sUrl = "${pageContext.request.contextPath}/mypage/get_program_info.ajax";
		var params = {
			seq_no : seqno
		};
		$.ajax({
			url : sUrl,
			data : params,
			method : 'post',
			dataType : 'json',
			success : function(response) {
				fn_member_bind(response.result[0]);
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
	function fn_member_bind(params){
		var tmpStr = params.M_NM + " / 만 " + params.AGE+"세";
		$(".member_info").html(tmpStr);
		var height = "-";
		var weight = "-";
		var day = params.REGNT_DTM;
		if(params.M_HEIGHT != null){
			height = params.M_HEIGHT;
		}
		if(params.M_WEIGHT != null){
			weight = params.M_WEIGHT;
		}
		var tmpStr = height+"cm/ " + weight+"kg/ " + day +"일차";
		$(".en").html(tmpStr);
		
		var trainer = "-";
		if(params.TRAINER != null){
			trainer = params.TRAINER;
		}
		$(".name").append(trainer);
		
	}
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
	<video muted autoplay loop class="sub_video">
		<source src="../../img/clip2_640.mp4" type="video/mp4">
	</video>

	<div class="wrap">
		<%@include file="../include/header.jsp"%>
		<div class="main training" style="position: relative;">
			<div class="inner" style="width: 1450px;">
				<div class="tit">
					<h2>나의 강좌</h2>
				</div>
				<section class="introduce" style="margin-top: 30px;">
					<div class="exTab_sub" data-aos="fade-up" data-aos-duration="1000">
						<div class="group clear" style="display: block;">
							<div class="left">
								<div class="titTxt">
									<strong class="member_info"></strong>
									<p class="en"></p>
								</div>
								<div class="teamTxt">
									<p>
										<span class="team">2023.04.23</span><span class="name">트레이너
											</span>
									</p>
								</div>
								<div class="video">
									<img src="../../img/meeting.png" width="100%">
								</div>
								<div class="comment_area">
									<p class="cm_info">
										1:1 QnA
										<mark>개인적인 질문</mark>
										을
										<mark>트레이너</mark>
										에게 해보세요!
									</p>
									<p class="en_qna">*트레이너에 대한 비방이나 모욕적인 내용은 예고 없이 삭제될 수 있습니다.</p>
									<textarea name="" id="" cols="30" rows="10"
										style="background: #393b45;"></textarea>
									<div class="clear">
										<span class="sm">200자 이내</span>
										<button class="btn_cmSave">Save</button>
									</div>
								</div>
								<div class="comment_list">
									<!--<div class="cm_top">
                                        <p>Total<em>1220</em></p>
                                    </div>-->
									<button class="btn_viewAll">
										전체 댓글창 보기<span>Open all the comments.</span>
									</button>
									<ul class="cm_list">
										<li>
											<p>
												<i>질문</i><em>민하은</em><span>답변완료</span>
											</p>
											<div class="cm_txt">운동은 매일 하는 것이 좋을까요?</div>
											<div class="btnRight">
												<button>Delete</button>
											</div>
											<p><span>한 부위에서 근육통이 느껴진다면 다른 부위의 운동을 진행하는 것이 좋습니다.</span></p>
										</li>
																				<li>
											<p>
												<i>질문</i><em>민하은</em><span>답변완료</span>
											</p>
											<div class="cm_txt">단백질은 어느정도 먹는 게 좋아요?</div>
											<div class="btnRight">
												<button>Delete</button>
											</div>
											<p><span>운동이 끝난 후 자신의 체중정도를 먹는 것이 좋습니다. 예를 들어 50kg이라면 50g 정도의 섭취가 좋아요.</span></p>
										</li>
																				<li>
											<p>
												<i>질문</i><em>민하은</em><span>답변중</span>
											</p>
											<div class="cm_txt">.</div>
											<div class="btnRight">
												<button>Delete</button>
											</div>
										</li>
									</ul>
								</div>
							</div>
							<div class="right">
								<div class="pdf_img" style="width: 100%;">
									<video controls width="100%" src="../../img/exercise_-_32937 (720p).mp4"></video>
								</div>
								<div class="video_list">
									<ul>
										<li>
											<img src="../../../img/ackeem.jpg" alt="" />
											<span>1. 재활을 위한 스트레칭의 정석</span>
										</li>
										<li>
											<img src="../../../img/jade.jpg" alt="" />
											<span>2. 튼튼한 신체를 위한 코어 운동</span>
										</li>
										<li>
											<img src="../../../img/john.jpg" alt="" />
											<span>3. 일상생활에서 가능한 교정 운동</span>
										</li>
										<li>
											<img src="../../../img/rochelle.jpg" alt="" />
											<span>4. 집에서 쉽게 배우는 맨몸운동</span>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="group">내용2</div>
						<div class="group">내용3</div>
						<div class="group">내용4</div>
						<div class="group">내용5</div>
						<div class="group">내용6</div>
					</div>



					<!-- PDF 레이어 팝업 -->
					<div class="pop_pdf">
						<div class="in">
							<div class="pdf_img" style="width: 100%;">
								<img src="../../img/test.jpg" alt="">
							</div>
							<div class="side_link">
								<ul>
									<li class="btn on"><button title="Korean">KO</button></li>
									<li class="btn"><button title="English">EN</button></li>
									<li><button title="download" class="down">
											<img src="../../img/icon_down.svg" alt="PDF 다운받기">
										</button></li>
									<li class="btn close"><a href="javascript://"
										title="close" onClick="pdf_close();">close</a></li>
								</ul>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>


		<!-- 레이어 팝업 전체 댓글창 -->
		<div class="all_comments" style="display: none;">
			<button class="btn_popClose">
				<img src="../../img/cmAll_pop_close.svg" alt="창닫기">
			</button>
			<div class="ac_top">
				<h2>전체 댓글창</h2>
				<ul>
					<li class="check"><a href="#">All</a></li>
					<li><a href="#">Support</a></li>
					<li><a href="#">Opinion</a></li>
					<li><a href="#">Inquery</a></li>
					<li><a href="#">etc</a></li>
				</ul>
			</div>
			<div class="cm_list">
				<ul>
					<li>
						<p>
							<i>기타</i><em>민하은</em><span>2021.10.01 </span>
						</p>
						<div class="cm_txt">제목을 입력해주세요.</div>
						<button class="btn_reply">Reply</button>
						<div class="btnRight">
							<button>Delete</button>
						</div>
					</li>
					<li>
						<p>
							<i>기타</i><em>민하은</em><span>2021.10.01 </span>
						</p>
						<div class="cm_txt">제목을 입력해주세요.</div>
						<button class="btn_reply">Reply</button>
					<li>
						<div class="reply_view">
							<p>
								<em>김삼성</em><span>2021.10.01 </span>
							</p>
							<div class="re_reply">
								<em>홍길동</em>
								<p>사용된 예제는 다음 압축 파일을 다운로드 받아서 확인할 수 있습니다.</p>
							</div>
							<button class="btn_reply">Reply</button>
							<div class="reply_write clear">
								<textarea name="" id="" cols="120" rows="2" placeholder="댓글입력"></textarea>
								<div class="rp_btn">
									<button>Modify</button>
									<button>Delete</button>
								</div>
							</div>
						</div>
						<div class="btnRight">
							<button>Delete</button>
						</div>
					</li>
					<li>
						<p>
							<i>기타</i><em>민하은</em><span>2021.10.01 </span>
						</p>
						<div class="cm_txt">제목을 입력해주세요.</div>
						<button class="btn_reply">Reply</button>
						<div class="btnRight">
							<button>Delete</button>
						</div>
					</li>
					<li>
						<p>
							<i>기타</i><em>민하은</em><span>2021.10.01 </span>
						</p>
						<div class="cm_txt">제목을 입력해주세요.</div>
						<button class="btn_reply">Reply</button>
						<div class="btnRight">
							<button>Delete</button>
						</div>
					</li>
					<li>
						<p>
							<i>기타</i><em>민하은</em><span>2021.10.01 </span>
						</p>
						<div class="cm_txt">제목을 입력해주세요.</div>
						<button class="btn_reply">Reply</button>
						<div class="btnRight">
							<button>Delete</button>
						</div>
					</li>
				</ul>
			</div>
			<div class="paging page_sm">
				<a href="#" class="prev_end"></a> <a href="#" class="prev"></a> <a
					href="#" class="on">1</a> <a href="#">2</a> <a href="#">3</a> <a
					href="#">4</a> <a href="#">5</a> <a href="#" class="next"></a> <a
					href="#" class="next_end"></a>
			</div>
		</div>
	</div>
	<script>
		var myAOS = function() {
			AOS.init({
				easing : 'ease-out-back',
				duration : 1500
			});
		}
		myAOS();

		$('.btn_viewAll, btn_popClose').click(function() {
			$('.all_comments').toggleClass('display', 'block');
		});

		/* $(".go_top").click(function() {
		     $('html, body').animate({
		         scrollTop : 0
		     }, 400);
		     return false;
		 });*/

		$(".side_link .btn").click(function() {
			$(".side_link .btn").toggleClass('on');
		});

		//PDF 레이어 팝업
		function popWindowOpen() {
			$(".pop_pdf").css("display", "block");
			$(".pop_pdf").draggable();
		}
		function pdf_close() {
			$(".pop_pdf").css("display", "none");
		}
	</script>
</body>

</html>
