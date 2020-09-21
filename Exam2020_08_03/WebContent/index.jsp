<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>쇼핑몰 회원관리</title>
</head>
<body>
	<header>
		<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>
	
	<nav>
		<ul>
			<li><a href="index.jsp?section=createMember.jsp">회원정보등록</a></li>
			<li><a href="index.jsp?section=selectMember.jsp">회원목록조회</a></li>
			<li><a href="index.jsp?section=selectSales.jsp">회원매출조회</a></li>
			<li><a href="index.jsp?section=updateMember.jsp">회원정보수정</a></li>
		</ul>
	</nav>
	
	<section>
	<% 
		if(request.getParameter("section") != null) {
			String section = request.getParameter("section");
	%>
			<jsp:include page="<%= section %>"></jsp:include>
	<%
		}else{
	%>
			<p> 홈 페이지 </p>
	<%
		}
	%>
	</section>
</body>
</html>