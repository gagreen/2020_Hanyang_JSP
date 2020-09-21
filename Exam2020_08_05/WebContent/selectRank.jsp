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
		query = "SELECT ta.artistId, MAX(ta.artistNm), SUM(ts.score), TRUNC(AVG(ts.score), 2), RANK() OVER(ORDER BY AVG(ts.score) DESC)" +
				" FROM tbl_artist_01 ta, tbl_score_01 ts" +
				" WHERE ta.artistId = ts.artistId" +
				" GROUP BY ta.artistId";
	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	
	<h1>참가자등수조회</h1>
	<table>
		<tr>
			<th>참가자ID</th>
			<th>참가자이름</th>
			<th>총합점수</th>
			<th>평균점수</th>
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