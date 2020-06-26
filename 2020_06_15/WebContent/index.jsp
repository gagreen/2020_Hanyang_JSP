<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리 ver 1.0</title>
</head>
<body>
	<%
		String client_section = request.getParameter("section");
		if (client_section == null){
			client_section = "main.html";
		}
	%>
	<header>
		<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>
	<nav>
		<a href="index.jsp?section=create_member.jsp">회원등록</a>
		<a href="index.jsp?section=read_member.jsp">회원목록조회/수정</a>
		<a href="index.jsp?section=read_sell.jsp">회원매출조회</a>
		<a href="index.jsp">홈으로</a>
	</nav>
	<section>
		<jsp:include page="<%=client_section %>"></jsp:include>
	</section>
	<footer>
		footer임 저작궈 저작권 푸터임
	</footer>
</body>
</html>