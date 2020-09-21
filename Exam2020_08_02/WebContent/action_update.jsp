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
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		String name = request.getParameter("name");
	
		query = "UPDATE db_memberid_table SET db_member_password = ?, db_member_name = ?"+
			" WHERE db_member_id = ?";
	
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, pw);
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, password);
		pstmt.setString(2, name);
		pstmt.setString(3, id);
		
		pstmt.executeUpdate();
	%>
</body>
</html>