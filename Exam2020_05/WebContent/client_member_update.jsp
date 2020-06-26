<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 회원정보변경 (클라이언트) </title> 
	
	<%
		/* 오라클 연동 관련 변수 선언 및 초기화 */
		String driver	= "oracle.jdbc.OracleDriver"; 
		String db_url	= "jdbc:oracle:thin:@//localhost:1521/orcl";
		String db_user	= "scott";
		String db_pw	= "tiger";
		String query	= null;
		
		Connection conn = null;
		Statement stmt 	= null;
		ResultSet rs	= null;
		
		String member_memberid	= null;
		String member_password	= null;
		String member_name		= null;
		String member_gender	= null;
		String member_religion	= null;
		String member_joinday	= null;
		String member_address	= null;
		String member_filename	= null;
		
		request.setCharacterEncoding("UTF-8"); // 요청 파라미터 인코딩 설정
	%>
</head>
<body>
	<form name="login_member_update" method="post" action="">
		<table>
			<tr>
				<td> 회원ID :	</td> 
				<td><input type="text" name="form_memberid"></td>
			</tr>
			<tr>
				<td> 회원비밀번호 :	</td> 
				<td><input type="password" name="form_password"></td>
			</tr>   
		</table>
		<input type="submit" value="정보조회하기" onclick="return form_update_check_javascript()">	
	</form>
	
	<%
		if(request.getParameter("form_memberid") != null){ // 요청에 파라미터가 있다면
			member_memberid = request.getParameter("form_memberid");
			member_password = request.getParameter("form_password");
			
			try{
				Class.forName(driver); // jdbc 드라이버 로딩
				conn = DriverManager.getConnection(db_url, db_user, db_pw); // db 접속 및 Connection 객체 생성
				
				stmt = conn.createStatement(); // Statement 객체 생성
				query = "SELECT db_member_memberid, db_member_password, db_member_name, db_member_gender, db_member_religion, TO_CHAR(db_member_joinday, 'yyyy-mm-dd') db_member_joinday, db_member_address" +
						" FROM member_table WHERE db_member_memberid = '" + member_memberid + "' AND db_member_password = " + member_password;
						// id와 pw를 기준으로 검색
				rs = stmt.executeQuery(query); // ResultSet 객체 생성(stmt 쿼리문 실행 결과)
				if(rs.next() == false){ // 처음엔 BOF이기 때문에 next() 실행
					// 결과 집합이 없으면 id나 pw를 잘못 입력한 것이므로 알림창을 띄우고 return함 
	%>
					<script>
						alert("ID나 PW를 잘못 입력했습니다.");
					</script>
	<%			
					return;
				}
				
				member_name = rs.getString("db_member_name");
				member_gender = rs.getString("db_member_gender");
				member_religion = rs.getString("db_member_religion");
				member_joinday = rs.getString("db_member_joinday");
				member_address = rs.getString("db_member_address");
			
		%>
			<form name="form_member_update" method="post" action="server_member_update.jsp">
				<input type="hidden" name="form_memberid" value="<%=member_memberid%>">
				<table>
					<tr>
						<th>변경대상항목</th>
						<th>변경전정보</th>
						<th>변경후정보</th>
					</tr>
					<tr>
						<td> 회원성명 </td>
						<td> <%= member_name %> </td>
						<td> <input type="text" name="form_name"></td>
					</tr>
					<tr>
						<td> 회원성별구분 </td>
						<td> <%= member_gender %> </td>
						<td> 남<input type="radio" name="form_gender" value="남"> &nbsp;
							 여<input type="radio" name="form_gender" value="여"> </td>
					</tr>
					<tr>
						<td> 회원종교구분 </td>
						<td> <%= member_religion %> </td>
						<td> <select name="form_religion">
								<option value="천주교"> 천주교 </option>
								<option value="기독교"> 기독교 </option>
								<option value="불교도"> 불교 </option>
								<option value="이슬람"> 이슬람 </option>
							</select> </td>
					</tr>
					<tr>
						<td> 회원가입일자 </td>
						<td> <%= member_joinday %> </td>
						<td> <input type="text" name="form_joinday"></td>
					</tr>
					<tr>
						<td> 회원주소 </td>
						<td> <%= member_address %> </td>
						<td> <textarea name="form_address"></textarea></td>
					</tr>
				</table>
				<input type="submit" value="정보변경하기" onclick="return form_update_check_javascript()"> &nbsp;
				<input type="reset" value="화면입력지우기">
			</form>	
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
		}
	%>
	<script>
		function form_update_check_javascript(){ //form 입력 검사
			if(form_member_update.form_name.value == ""){ // 회원 성명 체크여부
				alert("회원성명이 입력되지 않았습니다.");
				form_member_update.form_name.focus();
				return false;
			}
			if(form_member_update.form_address.value == ""){ // 회원 주소 체크여부
				alert("회원주소가 입력되지 않았습니다.");
				form_member_update.form_address.focus();
				return false;
			}
			if(form_member_update.form_gender.value == ""){ // 회원 성별 체크여부
				alert("회원성별구분이 입력되지 않았습니다.");
				form_member_update.form_gender.focus();
				return false;
			}
			if(form_member_update.form_religion.value == ""){ // 회원 종교 체크여부 
				alert("회원종교구분이 입력되지 않았습니다.");
				form_member_update.form_religion.focus();
				return false;
			}
			if(form_member_update.form_joinday.value == ""){ // 회원 가입일자 체크여부
				alert("회원가입일자가 입력되지 않았습니다.");
				form_member_update.form_joinday.focus();
				return false;
			}
	
			form_member_update.submit();	// 문제가 없다면 submit 
		}
	</script>
	
</body>
</html>