<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String name = "";
		String id = "";
		String password = "";
		
	
		if(request.getParameter("id") != null){
			id = request.getParameter("id");
			password = request.getParameter("pw");
			
			query = "SELECT db_member_name FROM db_memberid_table WHERE db_member_id = ? AND db_member_password = ? ";
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()){
				name = rs.getString(1);	
			}else{
	%>
				<script>
					alert('로그인 실패')
				</script>
	<%
			}
		}
	%>
	<div>
		<h1> 회 원 정 보 등 록</h1>
		<form action="#" method="post">
		<table>
			<tr>
				<td>회원ID</td>
				<td><input type="text" name="id" value="<%= id %>"/></td>
			</tr>
			<tr>
				<td>회원비밀번호</td>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td>회원이름</td>
				<td><input type="text" name="name" value="<%= name %>" readonly/></td>
			</tr>
		</table>
		<input type="submit" value="회원정보등록" />
		<input type="reset" value="화면입력지우기" />
		</form>
	</div>

	<% %>
</body>
</html>