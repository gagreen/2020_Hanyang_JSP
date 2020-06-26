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
	<%
		String query = "SELECT MAX(custno)+1 now FROM member_tbl_02";
		
		Class.forName(driver);
		conn = DriverManager.getConnection(db_url, db_user, db_pw);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
		rs.next();
		int nowCustno = rs.getInt("now");
	%>

	<h1>홈쇼핑 회원 등록</h1>
	<form name="member_form" method="post" action="create_action_member.jsp" onsubmit="return check_form();">
		<table border=1>
			<tr>
				<td>회원 번호 (자동발생)</td>
				<td><input type="text" name="custno" value=<%= nowCustno %> readonly></td>
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
					<input type="submit" value="등록">
					<input type="button" onclick="location.href = 'index.jsp?section=read_member.jsp'" value="조회">
				</td>
			</tr>
		</table>
	</form>
	<script>
		function check_form() {	
			if(member_form.custname.value == ""){
				alert('회원 성명이 입력되지 않았습니다.')
				member_form.custno.focus();
				return false;
			}
			if(member_form.phone.value == ""){
				alert('회원 전화가 입력되지 않았습니다.')
				member_form.custno.focus();
				return false;
			}
			if(member_form.address.value == ""){
				alert('회원 주소가 입력되지 않았습니다.')
				member_form.custno.focus();
				return false;
			}
			if(member_form.joindate.value == ""){
				alert('가입 일자가  입력되지 않았습니다.')
				member_form.custno.focus();
				return false;
			}
			if(member_form.grade.value == ""){
				alert('고객 등급이 입력되지 않았습니다.')
				member_form.custno.focus();
				return false;
			}
			if(member_form.city.value == ""){
				alert('도시 코드가 입력되지 않았습니다.')
				member_form.custno.focus();
				return false;
			}
			
			
			alert('회원 등록 완료');
			member_form.submit();
		}
	</script>
</body>
</html>