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
		query = "SELECT ts.scode, MIN(ts.sname) sname, TO_CHAR(SUM(tp.cost * tsa.amount), '999,999') shop_sale" +
				" FROM tbl_shop_01 ts, tbl_salelist_01 tsa, tbl_product_01 tp" + 
				" WHERE ts.scode = tsa.scode AND tp.pcode = tsa.pcode" + 
				" GROUP BY ts.scode";
	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	<h1>매장별 판매액</h1>
	<table border="1">
		<tr>
			<th>매장코드</th>
			<th>매장명</th>
			<th>매장별 판매액</th>
		</tr>
	<%
		while(rs.next()) {
	%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
			</tr>
	<%
		}
	%>
	</table>
</body>
</html>