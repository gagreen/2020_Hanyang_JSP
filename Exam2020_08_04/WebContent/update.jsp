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
		String profno = request.getParameter("id");
	%>
	<form action="action_update.jsp" method="post">
		<table>
			<tr>
				<td>교수번호</td>
				<td><input type="text" name="profno" value="<%= profno %>" readonly></td>
			</tr>
			<tr>
				<td>교수성명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>직급</td>
				<td><select name="position">
					<option value="정교수">정교수</option>
					<option value="조교수">조교수</option>
					<option value="전임강사">전임강사</option>
				</select></td>
			</tr>
			<tr>
				<td>월급</td>
				<td><input type="text" name="pay"></td>
			</tr>
			<tr>
				<td>입사일</td>
				<td><input type="text" name="hiredate"></td>
			</tr>
			<tr>
				<td>보너스</td>
				<td><input type="text" name="bonus"></td>
			</tr>
			<tr>
				<td>학과번호</td>
				<td><input type="text" name="deptno"></td>
			</tr>
		</table>
		<input type="submit" value="등록">
		<input type="reset" value="초기화">
	</form>
</body>
</html>