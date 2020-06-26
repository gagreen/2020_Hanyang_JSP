<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>교수 및 학과 관리 프로그램</title>
</head>
<body>
	<header>
		<h1>교수 및 학과 관리 프로그램</h1>
	</header>
	
	<% String client_section = request.getParameter("sec"); %>
	
	<nav>
		<ul>
			<li><a href="index.jsp?sec=create.jsp">교수등록</a></li>
			<li><a href="index.jsp?sec=prof_read.jsp">교수조회/수정</a></li>
			<li><a href="index.jsp?sec=dept_read.jsp">학과별교수정보조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<%
		if(client_section != null){
	%>
			<section>
				<jsp:include page="<%= client_section %>"></jsp:include>
			</section>
	<%
		}else{
	%>
			<section>
				<h2>교수학과 관리 프로그램</h2>
				<p>교수와 학과에 관한 데이터베이스를 구축하고 관리하기 위한 프로그램이다.</p>
				<ol>
					<li>교수 및 학과 테이블을 생성하고 샘플데이터를 추가한다.</li>
					<li>교수학과 조회, 교수등록 프로그램을 작성한다.</li>
					<li>올바르게 구현되었는지 확인한다.</li>
				</ol>
			</section>
	<%
		}
	%>
	<footer>
		<b>Copyright @ 2019 All right reserved Hanyang High School</b>
	</footer>
</body>
</html>