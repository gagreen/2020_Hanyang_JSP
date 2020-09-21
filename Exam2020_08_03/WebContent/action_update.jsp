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
		request.setCharacterEncoding("UTF-8");
	
		query = "UPDATE db_custmer_table SET db_custmer_custname=?, db_custmer_phone=?, db_custmer_address=?, db_custmer_joindate=? , db_custmer_gradecode=?, db_custmer_city=?"
				+" WHERE db_custmer_custno=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("phone"));
		pstmt.setString(3, request.getParameter("address"));
		pstmt.setString(4, request.getParameter("date"));
		pstmt.setString(5, request.getParameter("grade"));
		pstmt.setString(6, request.getParameter("city"));
		pstmt.setString(7, request.getParameter("custno"));
		
		if(pstmt.executeUpdate() == 0) {
	%>
			<script type="text/javascript">
				alert('오류발생')
			</script>
	<%
		}
	%>
</body>
</html>