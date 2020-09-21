<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/db_conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		Class.forName(driver);
		conn = DriverManager.getConnection(db_url, db_user, db_pw);
	%>
	<h1>학생 조회</h1>
	
</body>
</html>