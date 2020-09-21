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
		query = "SELECT profno, name, id, pay*12+bonus, pt.deptno, dt.dname, DECODE(position, '정교수', 'A', '조교수', 'B', '전임강사', 'C')" + 
				" FROM professor_table pt, department_table dt" + 
				" WHERE pt.deptno = dt.deptno";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	<h1>교수조회/수정</h1>
	<table border="1">
		<tr>
			<th>교수번호</th>
			<th>교수성명</th>
			<th>ID</th>
			<th>연봉</th>
			<th>학과코드</th>
			<th>학과명</th>
			<th>등급</th>
		</tr>
	<%
		while(rs.next()) {
	%>
		<tr>
			<td><a href="#" onclick="moveUpdate('<%= rs.getString(1) %>')"><%= rs.getString(1) %></a></td>
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
	<script type="text/javascript">
		function moveUpdate(id) {
			const form = document.createElement('form');
			const input = document.createElement('input');
			
			input.setAttribute('type', 'hidden');
			input.setAttribute('name', 'id');
			input.setAttribute('value', id);
			
			form.setAttribute('action', 'index.jsp?section=update.jsp');
			form.setAttribute('method', 'post');
			form.appendChild(input);
			
			document.body.appendChild(form);
			form.submit();
		}
	</script>
</body>
</html>