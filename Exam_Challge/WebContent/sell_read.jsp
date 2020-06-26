<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/WEB-INF/db_conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%
		String seqno 	= null;
		String name 	= null;
		String cardSell = null;
		String cashSell = null;
		String totSell 	= null;
		String cardAvg 	= null;
		String cashAvg 	= null;
	%>
</head>
<body>
	<%
		try{
			query = "SELECT db_goodssale_seqno, db_branchcode_name, SUM(DECODE(db_goodssale_settlement, 'card', db_goodssale_cost*db_goodssale_amount)) cardSell, " +
						"SUM(DECODE(db_goodssale_settlement, 'cash', db_goodssale_cost*db_goodssale_amount)) cashSell, SUM(db_goodssale_cost*db_goodssale_amount) totalSell, " +
						"ROUND(AVG(DECODE(db_goodssale_settlement, 'card', db_goodssale_cost*db_goodssale_amount))) cardAvg, ROUND(AVG(DECODE(db_goodssale_settlement, 'cash', db_goodssale_cost*db_goodssale_amount))) cashAvg" + 
					" FROM db_goodssale_table, db_branchcode_table" + 
					" GROUP BY db_goodssale_seqno, db_branchcode_name";
			Class.forName(driver);
			conn = DriverManager.getConnection(db_url, db_user, db_pw);
			stmt = conn.createStatement();
			stmt.executeQuery(query);
			
	%>
		<table>
			<tr>
				<th>상품판매지점코드</th>
				<th>상품판매지점명</th>
				<th>카드판매금액</th>
				<th>현금판매금액</th>
				<th>총판매금액</th>
				<th>평균카드판매금액</th>
				<th>평균현금판매금액</th>
			</tr>
	<%
		while(rs.next()) {
			seqno 		= rs.getString("seqno");
			name 		= rs.getString("name");
			cardSell	= rs.getString("cardSell");
			cashSell	= rs.getString("cashSell");
			totSell 	= rs.getString("totSell");
			cardAvg 	= rs.getString("cardAvg");
			cashAvg 	= rs.getString("cashAvg");
	%>
			<tr>
				<td><%= seqno %></td>
				<td><%= name %></td>
				<td><%= cardSell %></td>
				<td><%= cashSell %></td>
				<td><%= totSell %></td>
				<td><%= cardAvg %></td>
				<td><%= cashAvg %></td>
			</tr>
	<%
		}
	%>
		</table>
	
	
	<%
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