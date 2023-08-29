<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MAKEGYM_program_write</title>
    <link rel="stylesheet" href="../../css/common.css">
    <link rel="stylesheet" href="../../css/style.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script src="../../js/script.js"></script>
</head>
<body>
    <div class="wrap">
	<%@include file="../include/header.jsp" %>
        <div class="main">
            <div class="inner">
                <div class="tit">
                    <h2>PROGRAM</h2>
					<p>제목을 입력해주세요</p>
                </div>
                <div class="baord bd_write">
                    <table class="tb_type2">
                        <colgroup>
                            <col style="width: 18%">
                            <col style="width: *;">
                        </colgroup>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                        <tr>
                            <th>CATEGORY&nbsp;&nbsp;<span class="require">*</span></th>
                            <td>
                                <select id="progress" class="sch_sel" style="margin-right: 4px;">
                                    <option value="" selected>분류</option>
                                    <option value="" >디지털</option><!--DIGITA-->
                                    <option value="">모듈</option><!--MODULE-->
                                    <option value="">자동화</option><!--AUTOMATION-->
                                    <option value="">안전/품질</option><!--AUTOMATION-->
                                    <option value="">친환경</option><!--GREEN-->
                                </select>
                                <select id="progress" class="sch_sel" style="margin-right: 4px;">
                                    <option value="" selected>상품</option>
                                    <option value="" >하이테크</option>
                                    <option value="">건축</option>
                                    <option value="">토목</option>
                                    <option value="">플랜트</option>
                                    <option value="">주택</option>
                                </select>
                                <select id="progress" class="sch_sel" style="margin-right: 4px;">
                                    <option value="" selected>상태</option>
                                    <option value="">진행중</option>
                                    <option value="">완료</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                            <th>TITLE&nbsp;&nbsp;<span class="require">*</span></th>
                            <td><input type="text" style="width: 100%"></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                            <th>CONTENTS&nbsp;&nbsp;<span class="require">*</span></th>
                            <td><textarea name="" id=""></textarea></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                        <tr>
                            <th>FILE</th>
                            <td><input type="file" style="width: 100%"></td>
                        </tr>
                        <tr>
                            <th colspan="2" style="height: 20px;"></th>
                        </tr>
                    </table>
                    <div class="navigation clear">
                        <!-- <a href="#" class="fl nv_prev">PREV</a>-->
                        <a href="sub02_contest.jsp">LIST</a>
                        <!-- <a href="#" class="fr nv_next">NEXT</a>-->
                    </div>
                    <div class="btn_area mt70">
                        <button class="btn_gray">Delete</button>
                        <button class="btn_green">Modify</button>
                        <button class="btn_blue">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body></html>