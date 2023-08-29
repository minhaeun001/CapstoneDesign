$(document).ready(function () {
    /*상단 메뉴*/
    /* $('.gnb .sub').hover(function() {
         $('.depth2_bg').css('display','block');
         $(this).find('.depth2').css('display','block');
     }, function(){
       $('.depth2_bg').css('display','none');
         $(this).find('.depth2').css('display','none');
     });*/


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


    /* 탭 - 전시관 첫화면 */
    var tabList = $('.exTab_menu');
    var tabLi = tabList.children('li');
    var exTab_content = $('.exTab_content > .group');

    tabLi.on('click', function () {
        var thisI = $(this).index();
    });
    $('.exTab_menu li').on('click', function () {
        var thisI = $(this).index();
        var contEq = exTab_content.eq(thisI);
        contEq.css('display', 'block');
        contEq.siblings().css('display', 'none');
    });
    $('.exTab_menu li').on('click', function () {
        $('.exTab_menu li').removeClass('click');
        $(this).addClass('click');
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
