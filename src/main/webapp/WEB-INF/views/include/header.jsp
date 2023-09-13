<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<link rel="icon" href="../../img/favicon.ico" type="image/x-icon">
    <script>

	//******************************************************************************************** 
	// 1. 전역변수 선언                               						                              														  
	//*********************************************************************************************/ 
	
	
	//******************************************************************************************** 
	//2. 최초 실행 함수                               						                              														  
	//*********************************************************************************************/ 
	$(document).ready(function() {
		
		fn_init();
		
	});
	
	function fn_init(){
		
	}
	
	//******************************************************************************************** 
	//3. ajax 함수                                 						                              														  
	//*********************************************************************************************/ 

	//******************************************************************************************** 
	//4. 사용자 일반 함수 - ajax 함수 이외 정의 함수                               						                              														  
	//*********************************************************************************************/ 
	function fn_logout(){
		location.href="/login/logout.do";
	}
	
	//******************************************************************************************** 
	//5. 기타 함수                            						                              														  
	//*********************************************************************************************/ 
	
	
	//******************************************************************************************** 
	//6. 이벤트 함수                            						                              														  
	//*********************************************************************************************/ 
	$(document).on("click", ".logout", function(){
		var confirmLogout = confirm("로그아웃 하시겠습니까?");
		
		if (confirmLogout){
			fn_logout();
		}
	});
</script>

<header>
       <div class="top">
           <div class="logo">
               <h1><a href="../main/intro.do"><img src="../../img/logo.png" alt="MAKEGYM"></a></h1>
           </div>
           <nav class="gnb">
               <ul>
                   <li><a href="../main/introduce.do">INTRODUCE</a></li>
                   <li><a href="../program/program.do">PROGRAM</a></li>
                   <li><a href="../notice/notice.do">NOTICE</a></li>
                   <li><a href="../review/review.do">REVIEW</a></li>
               </ul>
           </nav>
           <div class="top_right">
			<%
			String m_id = (String) session.getAttribute("m_id");
			String m_nm = (String) session.getAttribute("m_nm");
			%>
			<%if (m_id != null && !m_id.equals("")) {
			%>
			    <span class="nm_header"> <%= m_nm %> (<%= m_id %>) </span>
			    <a href="../mypage/mypage.do" class="mypage">마이페이지</a>
			    <a class="logout"></a>
			<%} else { %>
			    <a href="../login/login.do" class="login">LOGIN</a>
			    <span class="login"> | </span>
			    <a href="../login/signup.do" class="login">JOIN</a>
			<%} %>
           </div>
       </div>
</header>