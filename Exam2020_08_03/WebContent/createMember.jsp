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
		query = "SELECT MAX(db_custmer_custno)+1 FROM db_custmer_table";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		rs.next();
	
	%>
	<div>
		<h1>홈쇼핑 회원 등록</h1>
		<form action="action_create.jsp" method="post">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno" value="<%= rs.getString(1) %>" readonly/></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="name"/></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"/></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"/></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="date"/></td>
				</tr>
				<tr>
					<td>고객등급</td>
					<td><input type="text" name="grade"/></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"/></td>
				</tr>
			</table>
			<input type="submit" value="제출">
			<input type="reset" value="입력 초기화">
		</form>
	</div>
</body>
</html>