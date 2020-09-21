<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<div>
		<h1>회 원 정 보 변 경</h1>
		<form action="action_update.jsp" method="post">
		<table>
			<tr>
			<td>회원ID</td>
			<td><input type="text" name="id" value="<%= request.getParameter("preId") %>" readonly/></td>
		</tr>
		<tr>
			<td>회원비밀번호</td>
			<td><input type="password" name="pw"/></td>
		</tr>
		<tr>
			<td>회원이름</td>
			<td><input type="text" name="name"/></td>
		</tr>
		</table>
		<input type="submit" value="회원정보변경" />
		<input type="reset" value="화면입력지우기" />	
		</form>
	</div>
</body>
</html>