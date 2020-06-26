<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/module/db_conn.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
		request.setCharacterEncoding("UTF-8");	
		
		query = "SELECT deptno, dname, salSum, salAvg, RANK() OVER(ORDER BY salSum desc) salRank" + 
				" FROM (SELECT d.deptno, MAX(d.dname) dname, TO_CHAR(SUM(p.pay*12+NVL(p.bonus,0)), '999,999') salSum, TO_CHAR(AVG(p.pay*12+NVL(p.bonus,0)), '999,999') salAvg " +
						" FROM department d,professor p WHERE d.deptno = p.deptno GROUP BY d.deptno)";
		
		String jsp_deptno 	= null;
		String jsp_dname 	= null;
		String jsp_salSum	= null;
		String jsp_salAvg 	= null;
		String jsp_salRank 	= null;
	%>
</head>
<body>
	<h1>교수조회/수정</h1>
	<%
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(db_url, db_user, db_pw);
			stmt = conn.createStatement();
			rs 	 = stmt.executeQuery(query);
	%>
		<table border=1>
			<tr>
				<th>학과번호</th>
				<th>학과명</th>
				<th>연봉합계</th>
				<th>평균연봉</th>
				<th>순위</th>
			</tr>
			<%
				while(rs.next()){
					jsp_deptno 	= rs.getString("deptno");
					jsp_dname 	= rs.getString("dname");
					jsp_salSum	= rs.getString("salSum");
					jsp_salAvg 	= rs.getString("salAvg");
					jsp_salRank = rs.getString("salRank");
			%>
			<tr>
				<td><%= jsp_deptno %></td>
				<td><%= jsp_dname %></td>
				<td><%= jsp_salSum %></td>
				<td><%= jsp_salAvg %></td>
				<td><%= jsp_salRank %></td>
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