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
		query = "SELECT dt.deptno, MAX(dname), TO_CHAR(SUM(pay*12+bonus), '999,999'), TO_CHAR(AVG(pay*12+bonus), '999,999'), RANK() OVER(ORDER BY SUM(pay*12+bonus) DESC)" +
				" FROM professor_table pt, department_table dt" + 
				" WHERE pt.deptno = dt.deptno" +
				" GROUP BY dt.deptno";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	<h1>학과별 교수 정보조회</h1>
	<table border="1">
		<tr>
			<th>학과번호</th>
			<th>학과명</th>
			<th>연봉합계</th>
			<th>평균연봉</th>
			<th>순위</th>
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
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>