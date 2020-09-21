<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>매장별 커피 판매관리 프로그램</title>
</head>
<body>
	<header>
		<h1>매장별 커피 판매관리 프로그램</h1>
	</header>
	
	<nav>
		<ul>
			<li><a href="index.jsp?section=create">판매등록</a></li>
			<li><a href="index.jsp?section=read_sale">판매현황</a></li>
			<li><a href="index.jsp?section=read_shop">매장별판매액</a></li>
			<li><a href="index.jsp?section=read_product">상품별판매액</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	
	<section>
		<%
			if(request.getParameter("section") != null){
				String section = request.getParameter("section") + ".jsp";
		%>
				<jsp:include page="<%= section %>"></jsp:include>
		<%
			}else {
		%>
				<p>매장별 커피 판매를 관리하기 위한 프로그램이다.</p>
		<%
			}
		%>
	</section>
	
	<footer>
		Copyright @ 2018 All right reserved Hanyang High School
	</footer>
</body>
</html>