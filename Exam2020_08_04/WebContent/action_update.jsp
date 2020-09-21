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
	
		query = "UPDATE professor_table SET name = ?, id = ?, position = ?, pay = ?, hiredate = TO_DATE(?), bonus = ?, deptno = ?" + 
				" WHERE profno = ?";
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("id"));
		pstmt.setString(3, request.getParameter("position"));
		pstmt.setString(4, request.getParameter("pay"));
		pstmt.setString(5, request.getParameter("hiredate"));
		pstmt.setString(6, request.getParameter("bonus"));
		pstmt.setString(7, request.getParameter("deptno"));
		pstmt.setString(8, request.getParameter("profno"));
		
		if(pstmt.executeUpdate() == 0) {
	%>
		<script type="text/javascript">
			alert('오류 발생');
		</script>
	<%
		} 
	%>
</body>
</html>