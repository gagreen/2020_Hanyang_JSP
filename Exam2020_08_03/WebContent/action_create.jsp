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
	
		query = "INSERT INTO db_custmer_table VALUES (seqno.nextval, ?, ?, ?, ? ,?, ?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("phone"));
		pstmt.setString(3, request.getParameter("address"));
		pstmt.setString(4, request.getParameter("date"));
		pstmt.setString(5, request.getParameter("grade"));
		pstmt.setString(6, request.getParameter("city"));
		
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