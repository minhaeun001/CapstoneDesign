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
            </div>
            <div class="main">
                <h2>회원가입</h2>
                <div class="signup">
                    <p> 
                        <i class="essR">
                            ::before
                            "[필수입력]"
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
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td colspan="3">
                                        <input type="text" class="inTxt rs-w100" id="m_szId" name="m_szId" placeholder="6~12자리" maxlength="20" title="아이디 입력">
                                        <label for="m_szId" class="check">
                                            <a href="javascript:DupWebIdCheck();" class="tbtns rs-mt5" title="중복확인">중복확인</a>
                                        </label>
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
                                    <td colspan="3"><input type="password" class="inTxt rs-w100" id="m_szPwd" name="m_szPwd" placeholder="8~14자리" maxlength="14" style="width:180px;ime-mode:disabled;" title="비밀번호">
                                        <span class="cau05">8~14자리 (영문 대소문자, 숫자, 특수문자 조합)</span>
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
                                        <input type="password" class="inTxt rs-w100" id="m_szPwdChk" name="m_szPwdChk" placeholder="비밀번호 재입력" maxlength="14" style="width:180px;ime-mode:disabled;" title="비밀번호 확인">
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
                                        <input type="text" class="inTxt rs-w100" id="m_szName" name="m_szName" placeholder="이름을 입력해주세요." value maxlength="50" style="width: 180px;" title="이름 입력">
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
                                        <input type="text" class="inTxt rs-w150" id="phone1" name="phone1" maxlength="11" placeholder="휴대폰 번호 입력 (‘-’ 제외 11자리 입력)" onkeydown="only_number(this)" style="width:80px" title="휴대폰 번호 입력">
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
                                        <input type="text" class="inTxt rs-w40" id="email_01" name="email_01" placeholder="이메일 주소" onfocus="checkLen(this.value);" onblur="checkMail(this.value);" style="width:120px;ime-mode:disabled;" title="이메일 아이디 입력">
                                        <span class="dash"> @ </span>
                                        <label for="email_02" class="disn">이메일 입력</label>
                                        <input type="text" class="inTxt rs-w45" id="email_02" name="email_02" onfocus="checkLen(this.value);" onblur="checkMail(this.value);" style="width:120px;ime-mode:disabled;" title="이메일 입력">
                                        <span class="selectboxWrap" style="width:180px">
                                            <label for="email_03" class="disn">이메일 선택</label>
                                            <select class="select selectBg" id="email_03" name="email_03" onchange="chgEmail(this.value, this.selectedIndex);" title="이메일 선택">
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
                                        <label for="birthyy">생년 월일</label>
                                        <span class="essR">
                                            ::before
                                            "필수"
                                        </span>
                                    </th>
                                    <td>
                                        <span class="selectboxWrap" style="width:32%">
                                            <select class="select selectBg" id="birthyy" name="birthyy" title="년도 선택">
                                                <option value="">년도</option><option value="2023">2023</option><option value="2022">2022</option><option value="2021">2021</option><option value="2020">2020</option><option value="2019">2019</option><option value="2018">2018</option><option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option>
                                            </select>
                                        </span>
                                        <span class="selectboxWrap" style="width:32%">
                                            <select class="select selectBg" id="birthmm" name="birthmm" title="월 선택">
                                                <option value="">월</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
                                            </select>
                                        </span>
                                        <label for="birthmm" class="disn">월</label>
                                        <span class="selectboxWrap" style="width:32%">
                                            <select class="select selectBg" id="birthdd" name="birthdd" title="일 선택">
                                                <option value="">일</option><option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
                                            </select>
                                        </span>
                                        <label for="birthdd" class="disn">일</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea">
                        <a id="sign" href="">가입</a>
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
        
        function openIdChk(){
            window.name = "parentForm";
            window.open("member/IdCheckForm.jsp",
            "chkForm", "width=500, height=300, resizable =no, scrollbars = no");
        }

        function inputIdChk(){
            document.userInfo.idDuplication.value ="idUncheck"
        }
        
    </script>
</body></html>