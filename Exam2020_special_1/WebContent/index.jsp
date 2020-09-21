<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1>학생 성적 조회 프로그램 ver 1.0</h1>
	</header>
	
	<nav>
		<ul>
			<li><a href="index.jsp?section=selectStud">학생조회</a></li>
			<li><a href="index.jsp?section=create">학생성적등록</a></li>
			<li><a href="index.jsp?section=selectScore">학생성적조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	
	<section>
		<%
			if(request.getParameter("section") != null) {
				String section = request.getParameter("section") + ".jsp";
		%>
				<jsp:include page="<%= section %>"></jsp:include>
		<%
			}
			else {
		%>
				<h1>학생성적 관리 프로그램</h1>
				<p> 학생 정보 조회 프로그램이다.</p>
		<%
			}
		
		%>
	</section>
	
	<footer>
	</footer>
</body>
</html>