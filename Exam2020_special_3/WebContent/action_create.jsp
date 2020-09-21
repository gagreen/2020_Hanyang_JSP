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
		query = "INSERT INTO tbl_salelist_01 VALUES (?, ?, TO_DATE(?), ?, ?)";
	
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, request.getParameter("saleno"));
		pstmt.setString(2, request.getParameter("scode"));
		pstmt.setString(3, request.getParameter("date"));
		pstmt.setString(4, request.getParameter("pcode"));
		pstmt.setString(5, request.getParameter("amount"));
		
		if(pstmt.executeUpdate() == 0) {
			out.print("오류 발생");
		}
	%>
	<script type="text/javascript">
		alert('매출전표가 정상적으로 등록되었습니다!');
		location.href="index.jsp";
	</script>
</body>
</html>