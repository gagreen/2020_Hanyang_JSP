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
		query = "SELECT tsa.saleno, tsa.scode ||'-'|| ts.sname, TO_CHAR(tsa.saledate, 'YYYY-MM-DD'), tsa.pcode, tp.pname, tsa.amount, TO_CHAR(tsa.amount*tp.cost, '999,999,999')" + 
				" FROM tbl_salelist_01 tsa, tbl_shop_01 ts, tbl_pizza_01 tp" + 
				" WHERE tsa.pcode = tp.pcode AND tsa.scode = ts.scode" + 
				" ORDER BY 1";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	
	<h1>통합매출현황조회</h1>
	<table>
		<tr>
			<th>매출전표번호</th>
			<th>지점</th>
			<th>판매일자</th>
			<th>피자코드</th>
			<th>피자명</th>
			<th>판매수량</th>
			<th>매출액</th>
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
			<td><%= "\\" + rs.getString(7) %></td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>