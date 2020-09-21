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
		query = "SELECT db_custmer_custno, MIN(db_custmer_custname), DECODE(MIN(db_custmer_gradecode), 'A', 'VIP', 'B', '일반', 'C', '직원')," +
				" SUM(db_sale_price)" +
				" FROM db_custmer_table, db_sale_table" +
				" WHERE db_custmer_custno = db_sale_custno" +
				" GROUP BY db_custmer_custno" +
				" ORDER BY 4 desc";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	
	<h1>회원매출조회</h1>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
	<% 
		while(rs.next()) {
	%>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
		</tr>
	<%
		}
	%>
	</table>

</body>
</html>