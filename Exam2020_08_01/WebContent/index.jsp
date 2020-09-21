<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<style>
		h1 {
			text-align: center;
		}
	
		table{
			border: "1";
			margin: auto;
			
		}
	</style>
</head>
<body>
	<%
		String empno;
		String empname;
		String depname;
		String hiredate;
		String positionname;
	
		query = "SELECT * FROM db_emp_table ORDER BY 1";
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, pw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
	%>
	
	<h1>사원정보조회</h1>
	
	<table border="1">
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>부서명</th>
			<th>입사년도</th>
			<th>직급</th>
		</tr>
	<%
		while(rs.next()){
			empno = rs.getString(1);
			empname = rs.getString(2);
			depname = rs.getString(3);
			hiredate = rs.getString(4);
			positionname = rs.getString(5);
	%>
			<tr>
				<td><%= empno %></td>
				<td><%= empname %></td>
				<td><%= depname %></td>
				<td><%= hiredate %></td>
				<td><%= positionname %></td>
			</tr>
	<%
		}
	%>
	</table>
</body>
</html>