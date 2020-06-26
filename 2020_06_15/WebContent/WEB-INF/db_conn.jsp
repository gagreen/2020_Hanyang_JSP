<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	String driver 	= "oracle.jdbc.OracleDriver";
	String db_url 	= "jdbc:oracle:thin:@localhost:1521:orcl";
	String db_user 	= "scott";
	String db_pw 	= "tiger";
	
	Connection conn 		= null;
	Statement stmt 			= null; 
	PreparedStatement pstmt	= null;
	ResultSet rs 			= null;
%>