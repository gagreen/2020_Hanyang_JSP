<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 회원정보삭제 (클라이언트) </title> 
	
	<%
		String driver	= "oracle.jdbc.OracleDriver"; 
		String db_url	= "jdbc:oracle:thin:@//localhost:1521/orcl";
		String db_user	= "scott";
		String db_pw	= "tiger";
		String query	= null;
		
		Connection conn 		= null;
		PreparedStatement pstmt = null;
		Statement stmt 			= null;
		
		String member_memberid	= null;
		
		request.setCharacterEncoding("UTF-8");
	%>
</head>
<body>
	<%
		member_memberid = request.getParameter("form_memberid");
	
		try{ // 오류 제어
			Class.forName(driver); //jdbc 드라이버 로딩
			conn = DriverManager.getConnection(db_url, db_user, db_pw); // db 접속 및 Connection 객체 생성
			
			
			/* 취미 테이블 컬럼 우선 삭제 */
			stmt = conn.createStatement(); // Statement 객체 생성
			query = "DELETE FROM tastehistory_table WHERE db_tastehistory_memberid = '" + member_memberid + "'";
			if(stmt.executeUpdate(query) == 0){	// INSERT문 실행, 안되면 실패 알려줌 
				out.println("취미 DB 처리 도중 오류 발생");
			}
			if(stmt != null){ 	// null이 아니라면
				stmt.close();	// stmt 닫기
			}
			
			/* 회원 테이블 컬럼 삭제*/
			stmt = conn.createStatement(); // Statement 객체 생성
			query = "DELETE FROM member_table WHERE db_member_memberid = '" + member_memberid + "'"; // 회원아이디 기준
			if(stmt.executeUpdate(query) == 0){	// INSERT문 실행, 안되면 실패 알려줌 
				out.println("회원 DB 처리 도중 오류 발생");
			}
			
			
		}catch(Exception e){	// 오류 발생 시
			e.printStackTrace();
		}finally{ 				// 무조건 실행(오류 여부에 상관없이)
			if(stmt != null){ 	// null이 아니라면
				stmt.close();	// stmt 닫기
			}
			if(conn != null){ 	// null이 아니라면
				conn.close();	// conn 닫기 (생성 순서와 반대로 닫아야 함)
			}
		}
	%>
</body>
</html>