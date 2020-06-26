<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/module/db_conn.jsp" %>

<%
	query = "UPDATE professor SET profno=?, name=?, id=?, position=?, pay=?, hiredate=?, bonus=?, deptno=? WHERE profno=?";
	request.setCharacterEncoding("UTF-8");

	String req_cur		= request.getParameter("cur_profno");
	String req_profno	= request.getParameter("profno");
	String req_name 	= request.getParameter("name");
	String req_id 		= request.getParameter("id");
	String req_position = request.getParameter("position");
	String req_pay 		= request.getParameter("pay");
	String req_hiredate	= request.getParameter("hiredate");
	String req_bonus 	= request.getParameter("bonus");
	String req_deptno 	= request.getParameter("deptno");
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(db_url, db_user, db_pw);
		pstmt = conn.prepareStatement(query);
		
		pstmt.setString(1, req_profno);
		pstmt.setString(2, req_name);
		pstmt.setString(3, req_id);
		pstmt.setString(4, req_position);
		pstmt.setString(5, req_pay);
		pstmt.setString(6, req_hiredate);
		pstmt.setString(7, req_bonus);
		pstmt.setString(8, req_deptno);
		pstmt.setString(9, req_cur);
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