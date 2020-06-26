<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title>회원취미조회 (서버)</title>
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
		
		String form_memberid	= null;
		String form_password 	= null;
		String member_memberid	= null;
		String member_password	= null;
		String member_name		= null;
		String member_gender	= null;
		String member_religion	= null;
		String member_joinday	= null;
		String member_address	= null;
		
		int tastehistory_tastecode	= 0;
		String tastecode_name 		= null;
		
		request.setCharacterEncoding("UTF-8");
	%>
</head>
<body>
	<form name="form_member_retrieve2" method="post" action="">
		<table> <!-- 회원 검증 과정 -->
			<tr>
				<td> 회원 ID </td>
				<td> <input type="text" name="form_memberid"> </td>
			</tr>
			<tr>
				<td> 회원 비밀번호 </td>
				<td> <input type="password" name="form_password"> </td>
			</tr>
		</table>
		<input type = "submit" value = "정보변경하기" onclick="return form_retrieve2_check_javascript()"> &nbsp;  &nbsp;
		<input type = "reset"  value = "화면입력지우기" >
	</form>
		<!-- 해당 회원의 정보 보여주기 시작-->
		<%
			if(request.getParameter("form_memberid") !=  null){
					
				form_memberid	= request.getParameter("form_memberid");
				form_password	= request.getParameter("form_password");	
				
				try{
					Class.forName(driver); // jdbc 드라이버 로딩
					conn = DriverManager.getConnection(db_url, db_user, db_pw); // db 접속 및 Connection 객체 생성
					
					/* 회원 검증 단계 */
					stmt = conn.createStatement(); // Statement 객체 생성
					query = "SELECT db_member_memberid FROM member_table WHERE db_member_memberid = '" + form_memberid + "' AND db_member_password = " + form_password;
					rs = stmt.executeQuery(query); // ResultSet 객체 생성(stmt 쿼리문 실행 결과)
					if(rs.next() == false){ // 처음엔 BOF이기 때문에 next() 실행
						// 결과 집합이 없으면 id나 pw를 잘못 입력한 것이므로 알림창을 띄우고 return함 
		%>
						<script>
							alert("ID나 비밀번호를 잘못 입력했습니다.");
						</script>				
		<%
						return;
					}
					if(rs != null){ 	// null이 아니라면
						rs.close(); 	// rs 닫기
					}
					if(stmt != null){ 	// null이 아니라면
						stmt.close();	// stmt 닫기
					}
					
					/* DB에서 회원 정보 받기 */
					stmt = conn.createStatement(); // Statement 객체 생성
					query = "SELECT db_member_name, db_member_gender, db_member_religion, TO_CHAR(db_member_joinday, 'yyyy-mm-dd') db_member_joinday, db_member_address FROM member_table WHERE db_member_memberid = '" + form_memberid +"'";
					rs = stmt.executeQuery(query); // ResultSet 객체 생성(stmt 쿼리문 실행 결과)
					rs.next(); // 처음엔 BOF이기 때문에 next() 실행
					
					member_name 	= rs.getString("db_member_name"); // ResultSet의 getString으로 db Data를 가져옴
					member_gender 	= rs.getString("db_member_gender");
					member_religion = rs.getString("db_member_religion");
					member_joinday 	= rs.getString("db_member_joinday");
					member_address 	= rs.getString("db_member_address");
					
					if(rs != null){ 	// null이 아니라면
						rs.close(); 	// rs 닫기
					}
					if(stmt != null){ 	// null이 아니라면
						stmt.close();	// stmt 닫기
					}
					
			%>
			
				<table> 
					<tr>
						<th> 회원성명 			</th>
						<th> 회원성별구분 		</th>
						<th> 회원종교구분 		</th>
						<th> 회원가입일자		</th>
						<th> 회원주소			</th>
					</tr>
					<tr>
						<td> <%= member_name %> </td>
						<td> <%= member_gender %> </td>
						<td> <%= member_religion %> </td>
						<td> <%= member_joinday %> </td>
						<td> <%= member_address %> </td>
					</tr>
				</table>
				<!-- 해당 회원의 정보 보여주기 끝-->
				
				<%
					/* DB에서 취미 정보 보여주기 */
					stmt = conn.createStatement(); // Statement 객체 생성
					query = "SELECT db_tastehistory_tastecode, db_tastecode_name FROM tastehistory_table, tastecode_table WHERE db_tastehistory_memberid = '" + form_memberid +"' AND db_tastehistory_tastecode = db_tastecode_code";
							// 테이블 조인 tastecode와 code로(tastehistory, tastecode), memberid로 검색
					rs = stmt.executeQuery(query); // ResultSet 객체 생성(stmt 쿼리문 실행 결과)
				%>
				<table> <!-- 해당 회원의 취미 리스트 보여주기 -->
					<tr>
						<th> 회원취미구분코드	</th>
						<th> 회원취미구분값	 	</th>
					</tr>
				<%
					while(rs.next()){ // EOF 전까지 반복
						tastehistory_tastecode	= rs.getInt("db_tastehistory_tastecode");
						tastecode_name	 		= rs.getString("db_tastecode_name");
				%>
					<tr>
						<td> <%= tastehistory_tastecode %> </td>
						<td> <%= tastecode_name %> </td>
						
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
			}
		
	%>
	<script >
		function form_retrieve2_check_javascript(){
			if(form_member_retrieve2.form_memberid.value.length == 0){
				alert("회왼아이디가 입력되지 않았습니다.");
				form_member_retrieve2.form_memberid.focus();
				return false;
			}
			if(form_member_retrieve2.form_password.value.length == 0){
				alert("회왼비밀번호가 입력되지 않았습니다.");
				form_member_retrieve2.form_password.focus();
				return false;
			}
			
			form_member_retreve2.submit();
		}
	</script>
</body>
</html>