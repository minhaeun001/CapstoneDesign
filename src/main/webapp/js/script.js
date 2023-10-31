$(document).ready(function () {

    /* 페이징 */
    $('.paging a').click(function (e) {
        e.preventDefault();
        $('.paging a').removeClass('on');
        $(this).addClass('on');
    });


    /* 탭 - TOP5 부분 */
    var tabList = $('.tab_menu');
    var tabLi = tabList.children('li');
    var tabContent = $('.content');

    tabLi.on('click', function () {
        var thisI = $(this).index();
    });
    $('.tab_menu li').on('click', function () {
        var thisI = $(this).index();
        var contEq = tabContent.eq(thisI);
        contEq.css('display', 'block');
        contEq.siblings().css('display', 'none');
    });
    $('.tab_menu li').on('click', function () {
        $('.tab_menu li').removeClass('active');
        $(this).addClass('active');
    });


    /* 페이징 */
    $('.ac_top li').click(function (e) {
        e.preventDefault();
        $('.ac_top li').removeClass('check');
        $(this).addClass('check');

    });
//
//
//    /* 애니메이션 플러그인AOS */
//    var myAOS = function () {
//        AOS.init({
//            easing: 'ease-out-back',
//            duration: 1500
//        });
//    }
//    myAOS();




});
