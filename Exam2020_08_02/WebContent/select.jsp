<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		query = "SELECT db_member_id, db_member_name FROM db_memberid_table";
		String id, name;
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, pw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
	%>
	<div>
		<h1>회 원 목 록 조 회</h1>
		<table border="">
			<tr>
				<th>회원ID</th>
				<th>회원명</th>
			</tr>
	<%
		while(rs.next()) {
			id = rs.getString(1);
			name = rs.getString(2);
	%>
			<tr>
				<td onClick="moveUpdate('<%= id %>')"><%= id %></td>
				<td><%= name  %></td>
			</tr>
	<%
		}
	%>
		</table>
	</div>
	
	<script>
		function moveUpdate(id) {			
			const form = document.createElement('form');
			const input = document.createElement('input');
			
			input.setAttribute("type", "hidden");
			input.setAttribute("name", "preId");
			input.setAttribute("value", id);
			
			form.setAttribute("action", 'update.jsp');
			form.setAttribute("method", 'post');
			form.appendChild(input);
			
			document.body.appendChild(form);
			form.submit();
		}
	</script>
</body>
</html>