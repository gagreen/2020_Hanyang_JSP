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
		query = "SELECT ts.scoreNo, ts.artistId, ta.artistNm, TO_CHAR(TO_DATE(ta.birth), 'YYYY\"년\"MM\"월\"DD\"일\"'), ts.score, " + 
				" CASE WHEN ts.score >= 90 THEN 'A'" + 
				"  WHEN ts.score >= 80 THEN 'B'" +
				"  WHEN ts.score >= 70 THEN 'C'" +
				"  WHEN ts.score >= 60 THEN 'D'" +
				"  WHEN ts.score >= 50 THEN 'F'" +
				" END, tm.mentorNm" +
				" FROM tbl_score_01 ts, tbl_artist_01 ta, tbl_mentor_01 tm" + 
				" WHERE ts.artistId = ta.artistId AND tm.mentorId = ts.mentorId" +
				" ORDER BY 1";
				
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	
	<h1>참가자점수조회</h1>
	<table border="1">
		<tr>
			<th>채점번호</th>
			<th>참가자ID</th>
			<th>참가자이름</th>
			<th>생년월일</th>
			<th>점수</th>
			<th>등급</th>
			<th>멘토이름</th>
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