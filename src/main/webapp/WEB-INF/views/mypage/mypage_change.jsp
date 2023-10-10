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
	<%@include file="../include/header.jsp" %>
  <div class="wrap index">
            <div class="main">
                <h2>회원정보변경</h2>
                <div class="signup">
                    <p> 
                        <i class="essR">
                        </i>
                        "필수입력"
                    </p>
                    <div class="signup_wrapper">
                        <table>
                            <caption>
                                <strong>웹 회원 정보입력 표</strong>
                                <p>웹 회원 정보입력으로 이름, 아이디, 비밀번호, 비밀번호 확인, 생년월일, 휴대폰, 이메일 정보를 입력</p>
                            </caption>
                            <colgroup>
                                <col style="width:160px">
                                <col style="width:280px">
                                <col style="width:100px">
                                <col class="sm-wd">
                            </colgroup>
                            <tbody>
                                <tr class="id">
                                    <th scope="row">
                                        아이디
                                        <span class="essR">
                                        </span>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" class="m_id inTxt rs-w100 id_input" id="m_szId" placeholder="qpalzm1226" maxlength="20" title="아이디 입력" disabled>
                                    </td>
                                </tr>
                                <tr class="pswd">
                                    <th scope="row">
                                        비밀번호
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3">
                                    	<input type="password" class="m_pwd inTxt rs-w100" id="m_szPwd" placeholder="8~14자리" maxlength="14" style="width:180px;ime-mode:disabled;" title="비밀번호">
                                        <span class="cau05 pw_info pwd_message">8~14자리 (영문 대소문자, 숫자, 특수문자 조합)</span>
                                    </td>
                                </tr>
                                <tr class="repswd">
                                    <th scope="row">
                                        비밀번호 확인
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3" class="line2">
                                        <input type="password" class="m_pwd_chk inTxt rs-w100" id="m_szPwdChk" placeholder="비밀번호 재입력" maxlength="14" style="width:180px;ime-mode:disabled;" title="비밀번호 확인">
                                        <span class="cau05 pw_info pwd_message_chk"></span>
                                    </td>
                                </tr>
                                <tr class="name">
                                    <th scope="row">
                                        성명
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" class="m_nm inTxt rs-w100" id="m_szName" placeholder="민하은" value maxlength="50" style="width: 180px;" title="이름 입력" disabled>
                                    </td>
                                </tr>
                                <tr class="phone">
                                    <th scope="row">
                                        전화번호
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3" class="hp">
                                        <input type="text" class="m_hp inTxt rs-w150" id="phone1" maxlength="11" placeholder="휴대폰 번호 입력 (‘-’ 제외 11자리 입력)" style="width:80px" title="휴대폰 번호 입력">
                                    </td>
                                </tr>
                                <tr class="eml">
                                    <th scope="row">
                                        이메일 주소
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3" class="email">
                                        <input type="text" class="m_email_01 inTxt rs-w40" id="email_01" placeholder="이메일 주소" style="width:120px;ime-mode:disabled;" title="이메일 아이디 입력">
                                        <span class="dash"> @ </span>
                                        <label class="disn ">이메일 입력</label>
                                        <input type="text" class="m_email_02 inTxt rs-w45" id="email_02" style="width:120px; ime-mode:disabled;" title="이메일 입력">
                                        <span class="selectboxWrap" style="width:180px">
                                            <label class="disn">이메일 선택</label>
                                            <select class="m_email_03 select selectBg" id="email_03"  title="이메일 선택">
                                                <option value="">직접입력</option>

                                                <option value="naver.com">naver.com</option>

                                                <option value="gmail.com">gmail.com</option>

                                                <option value="hanmail.net">hanmail.net</option>

                                            </select>
                                        </span>
                                    </td>
                                </tr>
                                <tr class="birth">
                                    <th scope="row">
                                        <label >생년 월일</label>
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td>
                                        <span class="selectboxWrap" style="width:32%">
                                            <select class="m_birth_01 select selectBg" id="birthyy" title="년도 선택" disabled>
                                                <option value="">1999</option><option value="2023">2023</option><option value="2022">2022</option><option value="2021">2021</option><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option>
                                            </select>
                                        </span>
                                        <span class="selectboxWrap" style="width:32%">
                                            <select class="m_birth_02 select selectBg" id="birthmm" title="월 선택" disabled>
                                                <option value="">12월</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
                                            </select>
                                        </span>
                                        <label  class="disn">월</label>
                                        <span class="selectboxWrap" style="width:32%">
                                            <select class="m_birth_03 select selectBg" id="birthdd" title="일 선택" disabled>
                                                <option value="">26일</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
                                            </select>
                                        </span>
                                        <label  class="disn">일</label>
                                    </td>
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

    <script>
        var myAOS = function() {
            AOS.init({
                easing: 'ease-out-back',
                duration: 1500
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
