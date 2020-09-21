<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<h1>학생 성적 등록</h1>
	<form action="action_create.jsp" method="post">
	<table>
		<tr>
			<td>학번</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>국어</td>
			<td><input type="text" name="korean"></td>
		</tr>
		<tr>
			<td>수학</td>
			<td><input type="text" name="math"></td>
		</tr>
		<tr>
			<td>영어</td>
			<td><input type="text" name="english"></td>
		</tr>
		<tr>
			<td>역사</td>
			<td><input type="text" name="history"></td>
		</tr>
	</table>
	<input type="submit" value="등록">
	</form>
</body>
</html>