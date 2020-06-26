<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="WEB-INF/db_conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String custno	 = null;
		String custname	 = null;
		String grade	 = null;
		String sell		 = null;
	
		String query = "SELECT member.custno, MAX(member.custname) custname, DECODE(MAX(member.grade), 'A', 'VIP', 'B', '일반', 'C', '직원') grade, SUM(money.price) sell" +
			" FROM member_tbl_02 member, money_tbl_02 money WHERE money.custno = member.custno" + 
			" GROUP BY member.custno ORDER BY 4 desc";
		
		Class.forName(driver);
		conn = DriverManager.getConnection(db_url, db_user, db_pw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
	%>

	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
	<%
		while(rs.next()) {
			custno = rs.getString("custno");
			custname = rs.getString("custname");
			grade = rs.getString("grade");
			sell = rs.getString("sell");
	%>
		<tr>
			<td><%= custname %></td>
			<td><%= custname %></td>
			<td><%= grade %></td>
			<td><%= sell %></td>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>