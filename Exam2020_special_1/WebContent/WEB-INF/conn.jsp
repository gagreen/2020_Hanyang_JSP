<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String pw = "tiger";
	String query;

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, pw);
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
%>