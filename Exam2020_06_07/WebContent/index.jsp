<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>학생 성적 조회 프로그램 ver 1.0</title>
</head>
<body>
	<header>
		<h1>학생 성적 조회 프로그램 ver 1.0</h1>
	</header>
	<nav>
		<ul>
			<li><a href="index.jsp?sec=student_read.jsp">학생조회</a></li>
			<li><a href="index.jsp?sec=student_create.jsp">학생성적등록</a></li>
			<li><a href="index.jsp?sec=grade_read.jsp">학생성적조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<% 
		String client_section = request.getParameter("sec");
		if(client_section != null){
	%>
			<section>
				<jsp:include page="<%=client_section %>"></jsp:include>
			</section>
	<%
		}else{
	%>
			<section>
				!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!설명!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			</section>
	<%
		}
	%>
	
	<footer>
		<p>Copyright @ 2018 All right reserved Hanyang High School</p>
	</footer>
</body>
</html>