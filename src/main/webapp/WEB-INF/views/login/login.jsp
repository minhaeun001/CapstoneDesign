<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM</title>
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
    <video muted autoplay loop class="index_video">
        <source src="../../img/clip2_640.mp4" type="video/mp4">
    </video>

    <div class="wrap index">
	<%@include file="../include/header.jsp" %>
            <div class="logo">
                <h1><a href="intro.jsp"><img src="../../img/logo.png" alt="MAKEGYM"></a></h1>
            </div>
            <nav class="gnb">
                <ul>
                    <li><a href="introduce.jsp">INTRODUCE</a></li>
                    <li><a href="program.jsp">PROGRAM</a></li>
                    <li><a href="notice.jsp">NOTICE</a></li>
                    <li><a href="review.jsp">REVIEW</a></li>
                </ul>
            </nav>
            <div class="top_right">
                <a href="mypage.jsp" >LOGIN | </a>
                <a href="mypage.jsp" >JOIN</a>
            </div>
        </div>
        <div class="main">
            <div class="login-wrapper">
                <h2>로그인</h2>
                <form method="post" action="서버의url" id="login-form">
                    <input type="text" name="userName" placeholder="아이디를 입력하세요">
                    <input type="password" name="userPassword" placeholder="비밀번호를 입력하세요">
                    <label for="remember-check">
                        <input type="checkbox" id="remember-check">아이디 저장
                    </label>
                    <input type="submit" value="로그인">
                    <a id="go_signup" href ="signup.jsp">회원가입</a>
                    <div class="links">
                        <a href="memberId">아이디 찾기</a> | <a href="memberPw">비밀번호 찾기</a>
                    </div>
                </form>
            </div>
        </div>
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

        var myAOS = function() {
            AOS.init({
                easing: 'ease-out-back',
                duration: 1500
            });
        }
        
    </script>
</body></html>