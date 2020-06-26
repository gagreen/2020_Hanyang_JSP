<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
		String req_cur = request.getParameter("cur_prof");
	%>
	<h1>교수 수정</h1>
	<form name="updateForm" method="post" action="updateAction.jsp">
		<input type="hidden" name="cur_profno" value="<%=req_cur%>">
		<table>
			<tr>
				<td>교수번호</td>
				<td><input type="text" name="profno"></td>
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
		<input type="submit" value="수정">
		<input type="button" value="조회" onclick="location.href='index.jsp?sec=prof_read.jsp'">
	</form>
</body>
</html>