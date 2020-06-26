<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 회원정보관리 </title> 
</head>
<body>
    <header>       
    	<h2> 회원정보관리메인 </h2>
    </header>
    <nav>
     	<ul> <!-- GET방식으로 section 받기 -->
     		<li><a href= "client_member_main.jsp?client_section=client_member_create.jsp">     회원정보등록 </a></li>
     		<li><a href= "client_member_main.jsp?client_section=client_member_retrieve1.jsp">  회원정보조회 </a></li>
     		<li><a href= "client_member_main.jsp?client_section=client_member_retrieve2.jsp">  회원취미조회 </a></li>
     		<li><a href= "client_member_main.jsp?client_section=client_member_update.jsp">     회원정보변경 </a></li>
     		<li><a href= "client_member_main.jsp?client_section=client_member_delete.jsp">     회원정보삭제 </a></li>
     		<li><a href= "client_member_main.jsp">                                             홈으로이동    </a></li>
     	</ul>
    </nav>
    <%
    	String client_section = request.getParameter("client_section");
    	
    	if(client_section != null){ // section이 null이 아니라면 (곧, '홈으로 이동'이 아니라면)
    %>
    <section>
    	<jsp:include page="<%= client_section %>"></jsp:include> <!-- jsp:include태그로 페이지 가져오기 -->
    </section>
    <%
    	}
    %>
    <footer>
     	<b>[04566] 서울중구 을지로 299 신당동 한양공업고등학교 </b><br/>
     	<b>[대표전화] 02-2238-5181   [팩스번호] 02-2235-3154</b><br/>
     	<b> Copyrightⓒ2020 All rights reserved</b><br/>
	</footer>
 
</body>
</html>