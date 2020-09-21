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
		query = "SELECT tp.pcode, MIN(tp.name) pname, TO_CHAR(SUM(tp.cost * tsa.amount), '999,999') product_sale" + 
				" FROM tbl_salelist_01 tsa, tbl_product_01 tp" +
				" WHERE tp.pcode = tsa.pcode" + 
				" GROUP BY tp.pcode" + 
				" ORDER BY tp.pcode";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
		<h1>상품별 판매액</h1>
		<table border="1">
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>상품별 판매액</th>
			</tr>
	<%
		while(rs.next()) {
	%>	
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
			<tr>
	<%
		}
	%>
		</table>
</body>
</html>