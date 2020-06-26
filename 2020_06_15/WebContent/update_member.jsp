<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="WEB-INF/db_conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<h1>홈쇼핑 회원 정보 수정</h1>
	<form name="member_update" method="post" action="update_action_member.jsp">
		<input type="hidden" name="preCustno" value="<%= request.getParameter("custno") %>">
		<table>
			<tr>
				<td>회원 번호 (자동발생)</td>
				<td><input type="text" name="custno"></td>
			</tr>
			<tr>
				<td>회원 성명</td>
				<td><input type="text" name="custname"></td>
			</tr>
			<tr>
				<td>회원 전화</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>회원 주소</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" name="joindate"></td>
			</tr>
			<tr>
				<td>고객등급(A:VIP, B:일반, C:직원)</td>
				<td><input type="text" name="grade"></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" name="city"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="button" onclick="location.href='index.jsp?section=read_member.jsp'" value="조회">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>