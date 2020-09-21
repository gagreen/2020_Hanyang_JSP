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
		query = "SELECT m.id, m.name, SUBSTR(m.id, 1,1), SUBSTR(m.id, 2,2), SUBSTR(m.id, 4,2), m.gender, s.korean, s.math, s.english, s.history, (s.korean+s.math+s.english+s.history), (s.korean+s.math+s.english+s.history)/4, RANK() OVER(ORDER BY (s.korean+s.math+s.english+s.history))" +
				" FROM member_tbl m, score_tbl s" + 
				" WHERE m.id = s.id";
	
		 
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	
	<h1>학생 성적 조회</h1>
	<table border="1">
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>
			<th>성별</th>
			<th>국어</th>
			<th>수학</th>
			<th>영어</th>
			<th>역사</th>
			<th>합계</th>
			<th>평균</th>
			<th>순위</th>
		</tr>
	<%
		while(rs.next()) {
	%>
		<tr>
			<td> <%= rs.getString(1) %></td>
			<td> <%= rs.getString(2) %></td>
			<td> <%= rs.getString(3) %></td>
			<td> <%= rs.getString(4) %></td>
			<td> <%= rs.getString(5) %></td>
			<td> <%= rs.getString(6) %></td>
			<td> <%= rs.getString(7) %></td>
			<td> <%= rs.getString(8) %></td>
			<td> <%= rs.getString(9) %></td>
			<td> <%= rs.getString(10) %></td>
			<td> <%= rs.getString(11) %></td>
			<td> <%= rs.getString(12) %></td>
			<td> <%= rs.getString(13) %></td>
		</tr>
	<%
		}
	
		query = "SELECT SUM(korean), SUM(math), SUM(english), SUM(history), SUM(korean+math+english+history), SUM((korean+math+english+history)/4)" + 
				" FROM score_tbl";
		rs = stmt.executeQuery(query);
		rs.next();
	%>
		<tr>
			<td colspan="6"></td>
			<td>국어 총합</td>
			<td>수학 총합</td>
			<td>영어 총합</td>
			<td>역사 총합</td>
			<td>총합</td>
			<td>총평균</td>
			<td>--------</td>
		</tr>
		
		<tr>
			<td colspan="6"></td>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
			<td><%= rs.getString(6) %></td>
			<td>--------</td>
		</tr>
	
	</table>
</body>
</html>
