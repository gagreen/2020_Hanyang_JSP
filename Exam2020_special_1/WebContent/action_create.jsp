<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		query = "INSERT INTO score_tbl VALUES (?, ?, ?, ?, ?)";
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("id"));
		pstmt.setString(2, request.getParameter("korean"));
		pstmt.setString(3, request.getParameter("math"));
		pstmt.setString(4, request.getParameter("english"));
		pstmt.setString(5, request.getParameter("history"));
		
		pstmt.executeUpdate();
		
	%>
</body>
</html>