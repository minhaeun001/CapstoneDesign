<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_event</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/script.js"></script>

    <link href="../../js/aos.css" rel="stylesheet">
    <script src="../../js/aos.js"></script>
</head>
<body class="bg_black">
       
        <!-- 배경 동영상 -->
        <video muted autoplay loop class="sub_video">
            <source src="../../img/clip2_640.mp4" type="video/mp4">
        </video>
       
        <%@include file="../include/header.jsp" %>
        
        <div class="main">
            <div class="inner">
                <!--<div class="bg_opacity"></div>-->
                <img src="../../img/bg_glow.svg" alt="" class="bg_glow">
                <div class="tit" data-aos="fade-down" data-aos-duration="1000">
                    <h2>Event</h2>
                    <p>MAKEGYM 오픈 기념 이벤트 진행중!</p>
                </div>
                <section class="inner_sec" style="margin-top: 30px; position: relative;">
                    <!-- data-aos="fade-up" data-aos-duration="2000"-->
                    <!--zoom-in-down-->
                    <ul class="boxUi clear">
                        <li data-aos="fade-up" data-aos-duration="2500">
                            <a href="#">
                                <strong>"리뷰"남기고 3개월 수강권 받자!</strong>
                                <span>(~2023.12.31, 상황에 따라 조기 종료될 수 있습니다.)</span>
                            </a>
                        </li>
                        <li data-aos="fade-up" data-aos-duration="3000">
                            <a href="#">
                                <strong>SNS에 MAKEGYM을 홍보해주세요!</strong>
                                <span>(~2023.12.31, 상황에 따라 조기 종료될 수 있습니다.)</span>
                            </a>
                        </li>
                        <li data-aos="fade-up" data-aos-duration="4000">
                            <a href="#">
                                <strong>매일 퀴즈풀고 선물 팡팡!!!</strong>
                                <span>(~2023.12.31, 상황에 따라 조기 종료될 수 있습니다.)</span>
                            </a>
                        </li>
                    </ul>
                    <div class="buttonWrap">
            <button class="button button--surtur" style="position: relative; color:#fff;">
                <svg class="textcircle" viewBox="0 0 500 500">
                    <title>OPEN EVENT!</title>
                    <defs>
                        <path id="textcircle" d="M250,400 a150,150 0 0,1 0,-300a150,150 0 0,1 0,300Z" />
                    </defs>
                    <text>
                        <textPath xlink:href="#textcircle" aria-label="makegym open event" textLength="900">OPEN EVENT!</textPath>
                    </text>
                </svg>
            </button>
        </div>
                </section>
            </div>
        </div>

        <script>
            var myAOS = function() {
                AOS.init({
                    easing: 'ease-out-back',
                    duration: 1500
                });
            }
            myAOS();
        </script>
</body></html>