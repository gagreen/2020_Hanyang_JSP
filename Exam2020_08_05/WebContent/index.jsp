<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>오디션 관리 프로그램</title>
</head>
<body>
	<header>
		<h1>오디션 관리 프로그램</h1>
	</header>

	<nav>
		<ul>
			<li><a href="index.jsp?section=create.jsp">참가자등록</a></li>
			<li><a href="index.jsp?section=selectList.jsp">참가자목록조회</a></li>
			<li><a href="index.jsp?section=selectScore.jsp">참가자점수조회</a></li>
			<li><a href="index.jsp?section=selectRank.jsp">참가자등수조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	
	<section>
	<%
		if(request.getParameter("section") != null) {
			String section = request.getParameter("section");
	%>
			<jsp:include page="<%= section %>"></jsp:include>
	<%
		}else {
	%>
			<p>오디션 점수 관리 프로그램</p>
	<%
		}
	%>
	</section>
	
	<footer>
		<p>HANYANG Copyright@2019 All rights reserved</p>
	</footer>
</body>
</html>