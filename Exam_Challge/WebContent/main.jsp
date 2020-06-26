<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>상품판매관리</title>
</head>
<body>
	<header>
		<h1>상품판매관리메인</h1>
	</header>
	<nav>
		<%
			String section = request.getParameter("sec");
		%>
		<ul>
			<li><a href="main.jsp?sec=sell_create.jsp">상품판매내역등록</a></li>
			<li><a href="main.jsp?sec=sell_read.jsp">상품판매집계조회</a></li>
			<li><a href="main.jsp?sec=inven_create.jsp">상품재고내역등록</a></li>
			<li><a href="main.jsp?sec=inven_read.jsp">상품재고내역조회</a></li>
			<li><a href="main.jsp?sec=inven_update.jsp">상품재고내역변경</a></li>
			<li><a href="main.jsp">홈으로</a></li>
		</ul>
	</nav>
	<%
		if(section != null) {
	%>
			<section>
				<jsp:include page="<%= section %>"></jsp:include>
			</section>
	<%
		}
	%>
	<footer>
		<p>Copy right(c) 2020 by 한양공업고등학교 all rights reserved</p>
	</footer>
</body>
</html>