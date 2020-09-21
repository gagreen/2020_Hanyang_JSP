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
		query = "SELECT id, name, SUBSTR(id, 1,1), SUBSTR(id, 2,2), SUBSTR(id, 4,2), gender" + 
				" FROM member_tbl";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	
	<h1>학생 조회</h1>
	<table border="1">
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>
			<th>성별</th>
		</tr>
	<% 
		while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
			<td><%= rs.getString(6) %></td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>