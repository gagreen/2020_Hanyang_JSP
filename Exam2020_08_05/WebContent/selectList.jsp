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
		query = "SELECT artistid, artistNm, TO_CHAR(TO_DATE(birth), 'YYYY\"년\"MM\"월\"DD\"일\"'), DECODE(gender, 'M', '남자', 'F', '여자'), DECODE(specialty, 1, '보컬', 2, '댄스', 3, '랩'), office" + 
				" FROM tbl_artist_01";
	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	<h1>참가자목록조회</h1>
	<table border="1">
		<tr>
			<th>참가자ID</th>
			<th>참가자이름</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>특기</th>
			<th>소속사</th>
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
			</tr>
	<%
		}
	%>
	</table>
</body>
</html>