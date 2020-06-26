<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="WEB-INF/db_conn.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String custno 	= null;
		String custname	= null;
		String phone 	= null;
		String address 	= null;
		String joindate	= null;
		String grade 	= null;
		String city 	= null;
		
		String query = "SELECT custno, custname, phone, address, TO_CHAR(joindate, 'YYYY-MM-DD') joindate, DECODE(grade, 'A', 'VIP', 'B', '일반', 'C', '직원')grade, city FROM member_tbl_02";
	
		Class.forName(driver);
		conn = DriverManager.getConnection(db_url, db_user, db_pw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
	
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원섬명</th>
			<th>전화번호</th>
			<th>주호</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
		
	<%
		while(rs.next()){
			custno 		= rs.getString("custno");
			custname	= rs.getString("custname");
			phone 		= rs.getString("phone");
			address 	= rs.getString("address");
			joindate	= rs.getString("joindate");
			grade		= rs.getString("grade");
			city		= rs.getString("city");
	%>
		<tr>
			<td onclick="post_send('update_member.jsp', '<%=custno%>')"><%= custno %></td>
			<td><%= custname %></td>
			<td><%= phone %></td>
			<td><%= address %></td>
			<td><%= joindate %></td>
			<td><%= grade %></td>
			<td><%= city %></td>
		</tr>
	<%
		}
	%>
	</table>
	<script>
		function post_send(path, value){
			let form = document.createElement('form');
			let input = document.createElement('input')
			
			form.name = "move_update";
			form.method = "post";
			form.action = 'index.jsp?section=' + path;
			
			input.name = 'custno';
			input.type = 'hidden';
			input.value = value;
			form.appendChild(input);
						
			document.body.appendChild(form);
			move_update.submit();
		}
	</script>
</body>
</html>