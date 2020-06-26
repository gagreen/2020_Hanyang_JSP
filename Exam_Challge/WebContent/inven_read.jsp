<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/db_conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%
		String branchcode 	= null;
		String branchname 	= null;
		String invencode 	= null;
		String invenname 	= null;
		String cost			= null;
		String productcost 	= null;
	%>
</head>
<body>
	<%
		try{
			query = "SELECT db_goodsstock_branchcode, db_branchcode_name, db_goodsstock_productcode, db_productcode_name, db_goodsstock_stockcost, db_goodsstock_productionconst" +
					" FROM db_goodsstock_table, db_branchcode_table, db_productcode_table" +  
					" WHERE db_goodsstock_branchcode = db_branchcode_code AND db_goodsstock_productcode = db_productcode_code";
			
			Class.forName(driver);
			conn = DriverManager.getConnection(db_url, db_user, db_pw);
			stmt = conn.createStatement();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null){
				rs.close();
			}
			if(stmt != null){
				stmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>