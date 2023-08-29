<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_program</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/script.js"></script>


    <link href="../../js/aos.css" rel="stylesheet">
    <script src="../../js/aos.js"></script>
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
	<%@include file="../include/header.jsp" %>
        <div class="main">
            <div class="inner">
                <div>
                    <div class="tit">
                        <h2>PROGRAM</h2>
                    </div>
                    <div class="board_search" style="text-align:center;line-height:28px">
                        원하는 트레이너를 선택해보세요.
                    </div>
                    <div class="subscript">
                        <div class="in">
                            <button onclick="alert('결제창으로 이동합니다.');">
                                결제하기<img src="../../img/icon_arrow.svg">
                            </button>
                        </div>
                    </div>
                </div>
                <div class="news clear" data-aos="fade-up" data-aos-duration="2000">
                    <section>
                        <div>
                            <div class="thumb">
                                <span class="thumb_imgBox" href="#"></span>
                                <div class="thumb_textBox">
                                    <div class="thumb_eyebrow">
                                        <span class="thumb_category">트레이너 김과기</span><span class="thumb_date">2023-06-01</span>
                                    </div>
                                    <a href="#" class="article_link">
                                        <strong class="thumb_tit">최고의 결과를 위한 맞춤형 코칭, 전문 트레이너와 함께하세요!</strong>
                                        <p class="desc">
                                            안녕하세요.
                                            트레이너 김과기 입니다.
                                            제 커리큘럼에 대해 소개해드리겠습니다.
                                        </p>
                                    </a>
                                </div>
                            </div>
                            <div class="thumb">
                                <span class="thumb_imgBox" href="#"></span>
                                <div class="thumb_textBox">
                                    <div class="thumb_eyebrow">
                                        <span class="thumb_category">트레이너 김과기</span><span class="thumb_date">2023-06-01</span>
                                    </div>
                                    <a href="#" class="article_link">
                                        <strong class="thumb_tit">최고의 결과를 위한 맞춤형 코칭, 전문 트레이너와 함께하세요!</strong>
                                        <p class="desc">
                                            안녕하세요.
                                            트레이너 김과기 입니다.
                                            제 커리큘럼에 대해 소개해드리겠습니다.
                                        </p>
                                    </a>
                                </div>
                            </div>
                            <div class="thumb">
                                <span class="thumb_imgBox" href="#"></span>
                                <div class="thumb_textBox">
                                    <div class="thumb_eyebrow">
                                        <span class="thumb_category">트레이너 김과기</span><span class="thumb_date">2023-06-01</span>
                                    </div>
                                    <a href="#" class="article_link">
                                        <strong class="thumb_tit">최고의 결과를 위한 맞춤형 코칭, 전문 트레이너와 함께하세요!</strong>
                                        <p class="desc">
                                            안녕하세요.
                                            트레이너 김과기 입니다.
                                            제 커리큘럼에 대해 소개해드리겠습니다.
                                        </p>
                                    </a>
                                </div>
                            </div>
                            <div class="thumb">
                                <span class="thumb_imgBox" href="#"></span>
                                <div class="thumb_textBox">
                                    <div class="thumb_eyebrow">
                                        <span class="thumb_category">트레이너 김과기</span><span class="thumb_date">2023-06-01</span>
                                    </div>
                                    <a href="#" class="article_link">
                                        <strong class="thumb_tit">최고의 결과를 위한 맞춤형 코칭, 전문 트레이너와 함께하세요!</strong>
                                        <p class="desc">
                                            안녕하세요.
                                            트레이너 김과기 입니다.
                                            제 커리큘럼에 대해 소개해드리겠습니다.
                                        </p>
                                    </a>
                                </div>
                            </div>
                            <div class="tac">
                                <button class="btn_more">더보기</button>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>

    <div class="news_popWarp" data-aos="fade-up" data-aos-duration="3000">
        <div class="nwpop_cont">
            <div class="btn_closeWrap"><button class="btn_nwpop_close"><img src="../../img/icon_close.png" alt="창닫기" title="창닫기"></button></div>
            <div class="tit">
                <h2>식품 안전 관리 인증(HACCP)</h2>
            </div>
            <div class="cont">
                한 식품업체가 만든 순대가 비위생적인 환경에서 제조되고 있다는 폭로가 나왔다.<br>
                이 업체가 만든 제품은 여러 대형마트나 급식업체에 납품되고 있지만,<br>
                그간 별다른 문제 없이 식품 안전 관리 인증(HACCP)을 받은 것으로 나타났다.<br>
                식품의약품안전처는 뒤늦게 해당 공장에 대해 불시 위생 점검에 착수했다.<br>
                2일 KBS가 보도 영상 등에 따르면 한 순대업체가 운영하고 있는 공장에서는 천장에서 떨어지는 물이 순대 속에 들어가는 양념 당면과 섞이고 있었다. 해당 영상은 올해 초 촬영된 것이다. 업체 전(前) 직원은 인터뷰에서 “(천장에서 떨어지는 물은) 꽝꽝 얼었던 배관 어딘가가 녹아서 떨어지는 것”이라고 전했다.<br>
                영상에는 순대를 찌는 대형 찜기 아래 까만 얼룩이 관측됐는데, 가까이서 보니 이는 벌레들이 다닥다닥 붙어있는 것이었다. 공장에서 순대 껍질에 쓰이는 냉동 돼지 내장을 맨바닥에 깔아놓고 해동하는 모습도 영상에 담겼다.
                해당 업체 관계자는 천장에서 누수가 있었다는 사실과 공장 내부에 벌레가 있었다는 점은 인정했다. 그러면서도 “당시 만든 순대는 모두 폐기했고 벌레는 전문 업체를 불러 모두 제거했다”고 했다. 물이 떨어지거나 벌레가 나타난 것에 대해서는 시설을 보수해 시정 조치했다고 밝혔다.<br>
                그러나 영상 제보자는 “업체가 판매하기 곤란한 제품을 새 순대의 재료로 사용해 재포장한다”고 주장했다.
                이 같은 행위는 식품 등의 표시광고에 관한 법률 위반 소지가 있다. 업체 측은 이에 대해 “유통기한이 임박한 순대가 아니며 당일 만든 순대 가운데 터진 순대나 포장이 훼손된 제품만 갈아서 쓴 것”이라고 했다.
                이런 제조 공정에도, 이 업체 제품은 그간 모두 HACCP을 통과해 대형마트와 분식집, 급식업체에 납품돼 왔다고 한다. 이 업체 한 해 매출은 400억원에 이르렀다.
                한 식품업체가 만든 순대가 비위생적인 환경에서 제조되고 있다는 폭로가 나왔다.<br>
                이 업체가 만든 제품은 여러 대형마트나 급식업체에 납품되고 있지만,<br>
                그간 별다른 문제 없이 식품 안전 관리 인증(HACCP)을 받은 것으로 나타났다.<br>
                식품의약품안전처는 뒤늦게 해당 공장에 대해 불시 위생 점검에 착수했다.<br>
                2일 KBS가 보도 영상 등에 따르면 한 순대업체가 운영하고 있는 공장에서는 천장에서 떨어지는 물이 순대 속에 들어가는 양념 당면과 섞이고 있었다. 해당 영상은 올해 초 촬영된 것이다. 업체 전(前) 직원은 인터뷰에서 “(천장에서 떨어지는 물은) 꽝꽝 얼었던 배관 어딘가가 녹아서 떨어지는 것”이라고 전했다.<br>
                영상에는 순대를 찌는 대형 찜기 아래 까만 얼룩이 관측됐는데, 가까이서 보니 이는 벌레들이 다닥다닥 붙어있는 것이었다. 공장에서 순대 껍질에 쓰이는 냉동 돼지 내장을 맨바닥에 깔아놓고 해동하는 모습도 영상에 담겼다.
                해당 업체 관계자는 천장에서 누수가 있었다는 사실과 공장 내부에 벌레가 있었다는 점은 인정했다. 그러면서도 “당시 만든 순대는 모두 폐기했고 벌레는 전문 업체를 불러 모두 제거했다”고 했다. 물이 떨어지거나 벌레가 나타난 것에 대해서는 시설을 보수해 시정 조치했다고 밝혔다.<br>
                그러나 영상 제보자는 “업체가 판매하기 곤란한 제품을 새 순대의 재료로 사용해 재포장한다”고 주장했다.
                이 같은 행위는 식품 등의 표시광고에 관한 법률 위반 소지가 있다. 업체 측은 이에 대해 “유통기한이 임박한 순대가 아니며 당일 만든 순대 가운데 터진 순대나 포장이 훼손된 제품만 갈아서 쓴 것”이라고 했다.
                이런 제조 공정에도, 이 업체 제품은 그간 모두 HACCP을 통과해 대형마트와 분식집, 급식업체에 납품돼 왔다고 한다. 이 업체 한 해 매출은 400억원에 이르렀다.
                2일 KBS가 보도 영상 등에 따르면 한 순대업체가 운영하고 있는 공장에서는 천장에서 떨어지는 물이 순대 속에 들어가는 양념 당면과 섞이고 있었다. 해당 영상은 올해 초 촬영된 것이다. 업체 전(前) 직원은 인터뷰에서 “(천장에서 떨어지는 물은) 꽝꽝 얼었던 배관 어딘가가 녹아서 떨어지는 것”이라고 전했다.<br>
                영상에는 순대를 찌는 대형 찜기 아래 까만 얼룩이 관측됐는데, 가까이서 보니 이는 벌레들이 다닥다닥 붙어있는 것이었다. 공장에서 순대 껍질에 쓰이는 냉동 돼지 내장을 맨바닥에 깔아놓고 해동하는 모습도 영상에 담겼다.
                해당 업체 관계자는 천장에서 누수가 있었다는 사실과 공장 내부에 벌레가 있었다는 점은 인정했다. 그러면서도 “당시 만든 순대는 모두 폐기했고 벌레는 전문 업체를 불러 모두 제거했다”고 했다. 물이 떨어지거나 벌레가 나타난 것에 대해서는 시설을 보수해 시정 조치했다고 밝혔다.<br>
                그러나 영상 제보자는 “업체가 판매하기 곤란한 제품을 새 순대의 재료로 사용해 재포장한다”고 주장했다.
                이 같은 행위는 식품 등의 표시광고에 관한 법률 위반 소지가 있다. 업체 측은 이에 대해 “유통기한이 임박한 순대가 아니며 당일 만든 순대 가운데 터진 순대나 포장이 훼손된 제품만 갈아서 쓴 것”이라고 했다.
                이런 제조 공정에도, 이 업체 제품은 그간 모두 HACCP을 통과해 대형마트와 분식집, 급식업체에 납품돼 왔다고 한다. 이 업체 한 해 매출은 400억원에 이르렀다.
            </div>
        </div>
    </div>
    <script>
        /* 레이어 팝업창 */
        $('.btn_link,.btn_nwpop_close').click(function(e) {
            e.preventDefault();
            $('.news_popWarp').toggle();
        });

        var myAOS = function() {
            AOS.init({
                easing: 'ease-out-back',
                duration: 1500
            });
        }
        myAOS();
    </script>
</body></html>
