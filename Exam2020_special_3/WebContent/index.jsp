<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>피자전문점</title>
	<link rel="stylesheet" href="index.css">
</head>
<body>
	<header>
		<h1>(과정평가형 2018-12) 피자전문점 판매관리 프로그램 ver 1.0</h1>
	</header>
	
	<nav>
		<ul>
			<li><a href="index.jsp?section=create">매출전표등록</a></li>
			<li><a href="index.jsp?section=read_total">종합매출조회</a></li>
			<li><a href="index.jsp?section=read_shop">지점별매출현황</a></li>
			<li><a href="index.jsp?section=read_product">상품별매출현황</a></li>
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
				<p>피자전문점 판매관리 프로그램을 작성한다.
		<%
			}
		%>
	</section>
	
	<footer>
		<b>HRDKOREA Copyright@2018 All rights reserved. Human Resources Development Service of Korea</b>
	</footer>
</body>
</html>