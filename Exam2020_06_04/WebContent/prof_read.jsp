<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/module/db_conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%
		request.setCharacterEncoding("UTF-8");	
		
		query = "SELECT p.profno, p.name, REPLACE(p.id, SUBSTR(p.id, 0, 3), '***') id, TO_CHAR((p.pay*12+ NVL(p.bonus,0)), '999,999') salary, p.deptno, d.dname, DECODE(p.position, '정교수', 'A', '조교수', 'B', '전임강사', 'C') grade"+
				" FROM professor p, department d WHERE p.deptno = d.deptno";
		
		String jsp_profno 	= null;
		String jsp_name 	= null;
		String jsp_id 		= null;
		String jsp_salary 	= null;
		String jsp_deptno 	= null;
		String jsp_dname 	= null;
		String jsp_grade 	= null;
	%>
</head>
<body>
	<h1>교수조회/수정</h1>
	<%
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(db_url, db_user, db_pw);
			stmt = conn.createStatement();
			rs 	 = stmt.executeQuery(query);
	%>
			<table border=1>
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
					while(rs.next()){
						jsp_profno = rs.getString("profno");
						jsp_name = rs.getString("name");
						jsp_id = rs.getString("id");
						jsp_salary = rs.getString("salary");
						jsp_deptno = rs.getString("deptno");
						jsp_dname = rs.getString("dname");
						jsp_grade = rs.getString("grade");
				%>
				<tr>
					<td><a href="#" onclick="post_send('update.jsp', '<%=jsp_profno%>')"><%= jsp_profno %></a></td>
					<td><%= jsp_name %></td>
					<td><%= jsp_id %></td>
					<td><%= jsp_salary %></td>
					<td><%= jsp_deptno %></td>
					<td><%= jsp_dname %></td>
					<td><%= jsp_grade %></td>
				</tr>
				<%
					}
				%>
			</table>
	<%
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null){
				rs.close();
			}
			if(stmt != null){
				stmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
	%>
	<script>
		function post_send(url, data){
			let form = document.createElement('form');
			form.action = url;
			form.method = 'post';
			
			input = document.createElement('input');
			input.setAttribute('type', 'hidden');
			input.setAttribute('name', 'cur_prof');
			input.setAttribute('value', data);
			form.appendChild(input);
			
			document.body.appendChild(form);
			form.submit();
		}
	</script>
</body>
</html>

