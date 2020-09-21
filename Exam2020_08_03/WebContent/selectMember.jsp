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
	
		query = "SELECT db_custmer_custno, db_custmer_custname, db_custmer_phone, db_custmer_address, db_custmer_joindate," + 
				" DECODE(db_custmer_gradecode, 'A', 'VIP', 'B', '일반', 'C', '직원'), db_custmer_city" + 
				" FROM db_custmer_table ORDER BY 1";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	
	<h1>회원목록조회/수정</h1>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
	
	<%
		
		while(rs.next()) {
	%>
			<tr>
				<td onclick="moveUpdate('<%= rs.getString(1) %>')"><%= rs.getString(1) %></td>
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
			
			form.setAttribute('action', 'index.jsp?section=updateMember.jsp');
			form.setAttribute('method', 'post');
			form.appendChild(input);
			
			document.body.appendChild(form);
			form.submit();
		}
	</script>
</body>
</html>