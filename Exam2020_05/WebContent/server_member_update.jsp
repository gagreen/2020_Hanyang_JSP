<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<title> 회원정보변경 (서버) </title>
 	<%	
 		/* 오라클 연동 관련 변수 선언 및 초기화 */
	 	String driver	= "oracle.jdbc.OracleDriver"; 
		String db_url	= "jdbc:oracle:thin:@//localhost:1521/orcl";
		String db_user	= "scott";
		String db_pw	= "tiger";
		String query	= null;
 		
		String member_memberid	= null;
 		String member_name 		= null;
 		String member_gender 	= null;
 		String member_religion	= null;
 		String member_joinday 	= null;
 		String member_address 	= null;
 		
 		Connection conn 		= null;
		PreparedStatement pstmt	= null;
 		
 		request.setCharacterEncoding("UTF-8"); // 요청 파라미터 인코딩 설정
 	%> 
</head>
<body>
	<%
		member_memberid	= request.getParameter("form_memberid");
		member_name 	= request.getParameter("form_name");
		member_gender 	= request.getParameter("form_gender");
		member_religion = request.getParameter("form_religion");
		member_joinday	= request.getParameter("form_joinday");
		member_address 	= request.getParameter("form_address");
		
		try{
			Class.forName(driver); // jdbc 드라이버 로딩
			conn = DriverManager.getConnection(db_url, db_user, db_pw); // db 접속 및 Connection 객체 생성
			query = "UPDATE member_table SET db_member_name = ?, db_member_gender = ?, db_member_religion = ?,"
					+ " db_member_joinday = ?, db_member_address = ? WHERE db_member_memberid = ?";
				// 업데이트 쿼리문 생성 
			pstmt = conn.prepareStatement(query); // PreparedStatement 객체 생성
			pstmt.setString(1, member_name);	// 첫 번째 인자: ?의 순서, 두 번째 인자: 넣을 값
			pstmt.setString(2, member_gender);
			pstmt.setString(3, member_religion);
			pstmt.setString(4, member_joinday);
			pstmt.setString(5, member_address);
			pstmt.setString(6, member_memberid);
			if(pstmt.executeUpdate() == 0){	// INSERT문 실행, 안되면 실패 알려줌 
				out.println("DB 입력 도중 오류 발생");
			}
			
		}catch(Exception e){	// 오류 발생 시
			e.printStackTrace();
		}finally{ 				// 무조건 실행(오류 여부에 상관없이)
			if(pstmt != null){ 	// null이 아니라면
				pstmt.close();	// stmt 닫기
			}
			if(conn != null){ 	// null이 아니라면
				conn.close();	// conn 닫기 (생성 순서와 반대로 닫아야 함)
			}
		}
	%>
</body>
</html>