<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 회원정보조회 (클라이언트) </title>
	
	<%
		/* 오라클 연동 관련 변수 선언 및 초기화 */
		String driver	= "oracle.jdbc.OracleDriver"; 
		String db_url	= "jdbc:oracle:thin:@//localhost:1521/orcl";
		String db_user	= "scott";
		String db_pw	= "tiger";
		String query 	= null;
	 	
		Connection conn = null;
		Statement stmt 	= null;
		ResultSet rs 	= null;
		
		String member_memberid	= null;
		String member_name		= null;
		String member_gender	= null;
		String member_religion	= null;
		String member_joinday	= null;
		String member_address	= null;
		
		request.setCharacterEncoding("UTF-8"); // 요청 파라미터 인코딩 설정
	%>
</head>
<body>
	<form name="form_member_retrieve1" method="post" action="#">
		<h3> 회원정보조회 (클라이언트)</h3>
		<%
			try{
				Class.forName(driver); // jdbc 드라이버 로딩
				conn = DriverManager.getConnection(db_url, db_user, db_pw); // db 접속 및 Connection 객체 생성
				stmt = conn.createStatement(); // Statement 걕체 생성
				query = "SELECT db_member_memberid, db_member_name, db_member_gender, db_member_religion, TO_CHAR(db_member_joinday,'yyyy-mm-dd') db_member_joinday, db_member_address FROM member_table";
				rs = stmt.executeQuery(query); // ResultSet 객체 생성(stmt 쿼리문 실행 결과)
		%>
		
		<table border="1">
			<tr>
				<th> 회원ID		</th>
				<th> 회원성명		</th>
				<th> 회원	성별구분	</th>
				<th> 회원종교구분	</th>
				<th> 회원가입일자	</th>
				<th> 회원주소		</th>
			</tr>
		<%
				while(rs.next()){ // EOF 전까지 반복
					member_memberid	= rs.getString("db_member_memberid"); // ResultSet의 getString으로 db Data를 가져옴
					member_name		= rs.getString("db_member_name");
					member_gender	= rs.getString("db_member_gender");
					member_religion	= rs.getString("db_member_religion");
					member_joinday	= rs.getString("db_member_joinday");
					member_address	= rs.getString("db_member_address"); 
		%>
			<tr>
		 		<td> <%= member_memberid %> </td>
		 		<td> <%= member_name %>     </td>
		 		<td> <%= member_gender %>   </td>
		 		<td> <%= member_religion %> </td>
		 		<td> <%= member_joinday %>  </td>
		 		<td> <%= member_address %>  </td>
		 	</tr>
		 <%
				}
		 %>
		</table>
		<%
			}catch(Exception e){	// 오류 발생 시
				e.printStackTrace();
			}finally{ 				// 무조건 실행(오류 여부에 상관없이)
				if(rs != null){ 	// null이 아니라면
					rs.close(); 	// rs 닫기
				}
				if(stmt != null){ 	// null이 아니라면
					stmt.close();	// stmt 닫기
				}
				if(conn != null){ 	// null이 아니라면
					conn.close();	// conn 닫기 (생성 순서와 반대로 닫아야 함)
				}
			}
		%>
		<input type="submit" value="정보조회하기"> &nbsp; &nbsp;
		<input type="reset" value="화면입력지우기">
	</form>
</body>
</html>