<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>교수 및 학과 관리 프로그램</title>
</head>
<body>
	<header>
		교수학과 관리 프로그램
	</header>
	
	<nav>
		<ul>
			<li><a href="index.jsp?section=create.jsp">교수등록</a></li>
			<li><a href="index.jsp?section=selectProf.jsp">교수조회/수정</a></li>
			<li><a href="index.jsp?section=selectDept.jsp">학과별교수정보조회</a></li>
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
		}
		else {
	%>
			<p>교수와 학과에 관한 데이트베이스를 구축하고 관리하기 위한 프로그램이다.</p>
	<%
		}
	%>
	</section>
	
	<footer>
		<p>Copyright @ 2019 All right reserved Hanyang High School</p>
	</footer>
</body>
</html>