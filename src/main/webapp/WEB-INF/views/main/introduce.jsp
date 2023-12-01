<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_introduce</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/name_card.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/script.js"></script>
    <script src="../../js/name_card.js"></script>
    
    <link href="../../js/aos.css" rel="stylesheet"> 
    <script src="../../js/aos.js"></script> 
</head>
<body class="bg_black">
    <div class="wrap intro">
	<%@include file="../include/header.jsp" %>
        <video muted autoplay loop style="position: fixed; right: 0; left: 0; width: 100%;">
            <source  src="../../img/clip2_640.mp4" type="video/mp4">
        </video>
        <div data-aos="fade-up" data-aos-duration="9000">
            <div class="intro_wrap">
                <div>
                    <em>INTRODUCE</em>
                    <div class="title">
                        <span class="block"></span>
                        <h2>함께 움직이는 즐거움</h2>
                    </div>
                    <div class="role">
                        <span class="block"></span>
                        <p class="point">MAKE:GYM</p>
                    </div>
                    <div class="bom_txt">
                        <p class="date">MAKEGYM은 체계적인 운동 프로그램과 1:1 코칭으로 당신의 건강한 라이프스타일을 지원합니다.</p>
                        <p class="date">언제 어디서나 MAKEGYM과 함께라면, 당신은 건강하고 행복한 삶을 쉽게 이뤄낼 수 있습니다.</p>
                    </div>
                        <p class="contact">Contact us</p>
                        <div class="container">
                          <table class="card_wrapper">
                            <tr>
                              <td>
                                <div class="card">
                                  <div class="content">
                                    <div class="details">
                                      <div>
                                        <h3>민하은</h3>
                                      </div>
                                      <div>
                                        <h5>웹 디자인 및 개발 담당</h5>
                                      </div>
                                      <div>
                                        <ion-icon name="call-outline"></ion-icon>
                                        <span>+82 010-1111-2222</span>
                                      </div>
                                      <div>
                                        <ion-icon name="globe-outline"></ion-icon>
                                        <span>testme.com</span>
                                      </div>
                                      <div>
                                        <ion-icon name="mail-outline"></ion-icon>
                                        <span>test@testme.com</span>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <th>
                                </th>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <th>
                                  <div class="card">
                                    <div class="content">
                                      <div class="details">
                                        <div>
                                          <h3>박윤선</h3>
                                        </div>
                                        <div>
                                            <h5>웹 디자인 및 개발 담당</h5>
                                          </div>
                                        <div>
                                          <ion-icon name="call-outline"></ion-icon>
                                          <span>+82 010-1111-2222</span>
                                        </div>
                                        <div>
                                          <ion-icon name="globe-outline"></ion-icon>
                                          <span>testme.com</span>
                                        </div>
                                        <div>
                                          <ion-icon name="mail-outline"></ion-icon>
                                          <span>test@testme.com</span>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </th>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div class="card">
                                  <div class="content">
                                    <div class="details">
                                      <div>
                                        <h3>박정윤</h3>
                                      </div>
                                      <div>
                                          <h5>웹 디자인 및 개발 담당</h5>
                                        </div>
                                      <div>
                                        <ion-icon name="call-outline"></ion-icon>
                                        <span>+82 010-1111-2222</span>
                                      </div>
                                      <div>
                                        <ion-icon name="globe-outline"></ion-icon>
                                        <span>testme.com</span>
                                      </div>
                                      <div>
                                        <ion-icon name="mail-outline"></ion-icon>
                                        <span>test@testme.com</span>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </td>
                              <th></th>
                            </tr>
                          </table>
                        </div>
                  </div>

                  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
                  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

                </div>
                  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
                  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

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