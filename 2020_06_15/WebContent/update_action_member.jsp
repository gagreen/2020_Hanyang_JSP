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
		request.setCharacterEncoding("UTF-8");
		String preCustno = request.getParameter("preCustno");
		String custno = request.getParameter("custno");
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		String query = "UPDATE member_tbl_02 SET " + 
				"custno=?, custname=?, phone=?, address=?, joindate=TO_DATE(?), grade=?, city=?"+
				"WHERE custno = ?";
	
		Class.forName(driver);
		conn = DriverManager.getConnection(db_url, db_user, db_pw);
		pstmt = conn.prepareStatement(query);
		
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		pstmt.setString(8, preCustno);
		
		pstmt.executeUpdate();
	%>
	<script>
		location.href="index.jsp?section=read_member.jsp";
	</script>
</body>
</html>