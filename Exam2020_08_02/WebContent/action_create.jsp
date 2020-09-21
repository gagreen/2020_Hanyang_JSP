<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		query = "INSERT INTO db_memberid_table VALUES (?, ?, ?)";	
	
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, pw);
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("id"));
		pstmt.setString(2, request.getParameter("pw"));
		pstmt.setString(3, request.getParameter("name"));
		
		pstmt.executeUpdate();
	%>
</body>
</html>