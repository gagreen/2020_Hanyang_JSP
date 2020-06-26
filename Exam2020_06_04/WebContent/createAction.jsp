<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/module/db_conn.jsp" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		query = "INSERT INTO professor VALUES(prof_seq.nextval,?,?,?,?,TO_DATE(?),?,?)";
		String req_name 	= request.getParameter("name");
		String req_id 		= request.getParameter("id");
		String req_position = request.getParameter("position");
		String req_pay 		= request.getParameter("pay");
		String req_hiredate	= request.getParameter("hiredate");
		String req_bonus 	= request.getParameter("bonus");
		String req_deptno 	= request.getParameter("deptno");
	%>
	
	
	<%
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(db_url, db_user, db_pw);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, req_name);
			pstmt.setString(2, req_id);
			pstmt.setString(3, req_position);
			pstmt.setString(4, req_pay);
			pstmt.setString(5, req_hiredate);
			pstmt.setString(6, req_bonus);
			pstmt.setString(7, req_deptno);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
		
	%>
	<script>
		location.href='index.jsp?sec=prof_read.jsp';
	</script>
</body>
</html>
