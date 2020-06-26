<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	Connection conn 		= null;
	PreparedStatement pstmt = null; 
	Statement stmt			= null;
	ResultSet rs 			= null;
	
	String driver 	= "oracle.jdbc.OracleDriver";
	String db_url	= "jdbc:oracle:thin:@//localhost:1521/xe";
	String db_user 	= "system";
	String db_pw 	= "1234";
	String query 	= null;
	
%>