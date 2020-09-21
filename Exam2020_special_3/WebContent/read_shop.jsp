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
		query = "SELECT ts.scode, MIN(ts.sname), TO_CHAR(SUM(tsa.amount*tp.cost), 'L999,999,999')" +
				" FROM tbl_salelist_01 tsa, tbl_shop_01 ts, tbl_pizza_01 tp" + 
				" WHERE tsa.pcode = tp.pcode AND tsa.scode = ts.scode" + 
				" GROUP BY ts.scode" +
				" ORDER BY 1";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	
	<h1>지점별 매출 현황</h1>
	<table>
		<tr>
			<th>지점 코드</th>
			<th>지점 명</th>
			<th>총매출액</th>
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