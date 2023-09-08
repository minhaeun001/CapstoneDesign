<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
			
			if (m_id != null && !m_id.equals("")) {
			%>
			    <%= m_nm %> (<%= m_id %>)
			    <a href="../mypage/mypage.do" class="mypage">마이페이지</a>
			    <a href="/login/logout.do" class="logout">로그아웃</a>
			<%} else { %>
			    <a href="../login/login.do" class="logout">LOGIN</a>
			    <span class="login"> | </span>
			    <a href="../login/signup.do" class="login">JOIN</a>
			<%} %>
           </div>
       </div>
</header>


<script>

	
</script>