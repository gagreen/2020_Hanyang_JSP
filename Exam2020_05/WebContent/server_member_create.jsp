<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보등록 (서버)</title>
	<%
		/* 오라클 연동 관련 변수 선언 및 초기화 */
		String driver	= "oracle.jdbc.OracleDriver"; 
		String db_url	= "jdbc:oracle:thin:@//localhost:1521/orcl";
		String db_user	= "scott";
		String db_pw	= "tiger";
		String query	= null;
		
		String member_memberid			= null; // form 입력 파라미터 받을 변수 초기화
		String member_password			= null;
		String member_name				= null;
		String member_gender			= null;
		String member_religen			= null;
		String member_joinday			= null;
		String member_address			= null;
		String member_filename			= null;
		String[] tastehistory_tastecode	= null; // 취미는 여러 개이므로 배열로
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		request.setCharacterEncoding("UTF-8"); // 요청 파라미터 인코딩 설정
	%>
</head>
<body>
	<%
		member_memberid			= request.getParameter("form_memberid"); // request.getParameter()로 요청 파라미터 변수에 대입 
		member_password			= request.getParameter("form_password");
		member_name				= request.getParameter("form_name");
		member_gender			= request.getParameter("form_gender");
		member_religen			= request.getParameter("form_religion");
		member_joinday			= request.getParameter("form_joinday");
		member_address			= request.getParameter("form_address");
		member_filename			= request.getParameter("form_filename");
		tastehistory_tastecode	= request.getParameterValues("form_tastecode"); // request.getParameterValues()로 여러 개의 파라미터 받기
		
		try{ // 오류 제어
			Class.forName(driver); //jdbc 드라이버 로딩
			conn = DriverManager.getConnection(db_url, db_user, db_pw); // db 접속 및 Connection 객체 생성
			
			// member_table 삽입
			query = "INSERT INTO member_table VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(query); // INSERT 문 생성
			
			pstmt.setString(1, member_memberid); 				// 첫 번째 인자: ?의 순서, 두 번째 인자: 넣을 값
			pstmt.setInt(2, Integer.parseInt(member_password));
			pstmt.setString(3, member_name);
			pstmt.setString(4, member_gender);
			pstmt.setString(5, member_religen);
			pstmt.setString(6, member_joinday);
			pstmt.setString(7, member_address);
			pstmt.setString(8, member_filename);
			if(pstmt.executeUpdate() == 0){	// INSERT문 실행, 안되면 실패 알려줌 
				out.println("DB 입력 도중 오류 발생");
			}
			
			if(pstmt != null){
				pstmt.close();
			}
			
			// tastehistory_table 삽입
			query = "INSERT INTO tastehistory_table VALUES (?, ?)";
			pstmt = conn.prepareStatement(query); // INSERT 문 실행
			
			for(int i=0; i<tastehistory_tastecode.length; i++){ // 입력 개수만큼 삽입 실행
				pstmt.setString(1, member_memberid);
				pstmt.setString(2, tastehistory_tastecode[i]);
				if(pstmt.executeUpdate() == 0){ // INSERT문 실행, 안되면 실패 알려줌
					out.println("DB 입력 도중 오류 발생");
				}
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