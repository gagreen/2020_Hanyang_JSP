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
	
		query = "SELECT * FROM v_sale";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
	%>
	<h1>판매현황</h1>
	<table border="1">
		<tr>
			<th>비번호</th>
			<th>상품코드</th>
			<th>판매날짜</th>
			<th>매장코드</th>
			<th>상품명</th>
			<th>판매등록</th>
			<th>총판매액</th>
		</tr>
	<%
		while(rs.next()) {
	%>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
			<td><%= rs.getString(6) %></td>
			<td><%= rs.getString(7) %></td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>