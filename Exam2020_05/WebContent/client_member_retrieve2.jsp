<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title>ȸ�������ȸ (����)</title>
	<%
		/* ����Ŭ ���� ���� ���� ���� �� �ʱ�ȭ */
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
		<table> <!-- ȸ�� ���� ���� -->
			<tr>
				<td> ȸ�� ID </td>
				<td> <input type="text" name="form_memberid"> </td>
			</tr>
			<tr>
				<td> ȸ�� ��й�ȣ </td>
				<td> <input type="password" name="form_password"> </td>
			</tr>
		</table>
		<input type = "submit" value = "���������ϱ�" onclick="return form_retrieve2_check_javascript()"> &nbsp;  &nbsp;
		<input type = "reset"  value = "ȭ���Է������" >
	</form>
		<!-- �ش� ȸ���� ���� �����ֱ� ����-->
		<%
			if(request.getParameter("form_memberid") !=  null){
					
				form_memberid	= request.getParameter("form_memberid");
				form_password	= request.getParameter("form_password");	
				
				try{
					Class.forName(driver); // jdbc ����̹� �ε�
					conn = DriverManager.getConnection(db_url, db_user, db_pw); // db ���� �� Connection ��ü ����
					
					/* ȸ�� ���� �ܰ� */
					stmt = conn.createStatement(); // Statement ��ü ����
					query = "SELECT db_member_memberid FROM member_table WHERE db_member_memberid = '" + form_memberid + "' AND db_member_password = " + form_password;
					rs = stmt.executeQuery(query); // ResultSet ��ü ����(stmt ������ ���� ���)
					if(rs.next() == false){ // ó���� BOF�̱� ������ next() ����
						// ��� ������ ������ id�� pw�� �߸� �Է��� ���̹Ƿ� �˸�â�� ���� return�� 
		%>
						<script>
							alert("ID�� ��й�ȣ�� �߸� �Է��߽��ϴ�.");
						</script>				
		<%
						return;
					}
					if(rs != null){ 	// null�� �ƴ϶��
						rs.close(); 	// rs �ݱ�
					}
					if(stmt != null){ 	// null�� �ƴ϶��
						stmt.close();	// stmt �ݱ�
					}
					
					/* DB���� ȸ�� ���� �ޱ� */
					stmt = conn.createStatement(); // Statement ��ü ����
					query = "SELECT db_member_name, db_member_gender, db_member_religion, TO_CHAR(db_member_joinday, 'yyyy-mm-dd') db_member_joinday, db_member_address FROM member_table WHERE db_member_memberid = '" + form_memberid +"'";
					rs = stmt.executeQuery(query); // ResultSet ��ü ����(stmt ������ ���� ���)
					rs.next(); // ó���� BOF�̱� ������ next() ����
					
					member_name 	= rs.getString("db_member_name"); // ResultSet�� getString���� db Data�� ������
					member_gender 	= rs.getString("db_member_gender");
					member_religion = rs.getString("db_member_religion");
					member_joinday 	= rs.getString("db_member_joinday");
					member_address 	= rs.getString("db_member_address");
					
					if(rs != null){ 	// null�� �ƴ϶��
						rs.close(); 	// rs �ݱ�
					}
					if(stmt != null){ 	// null�� �ƴ϶��
						stmt.close();	// stmt �ݱ�
					}
					
			%>
			
				<table> 
					<tr>
						<th> ȸ������ 			</th>
						<th> ȸ���������� 		</th>
						<th> ȸ���������� 		</th>
						<th> ȸ����������		</th>
						<th> ȸ���ּ�			</th>
					</tr>
					<tr>
						<td> <%= member_name %> </td>
						<td> <%= member_gender %> </td>
						<td> <%= member_religion %> </td>
						<td> <%= member_joinday %> </td>
						<td> <%= member_address %> </td>
					</tr>
				</table>
				<!-- �ش� ȸ���� ���� �����ֱ� ��-->
				
				<%
					/* DB���� ��� ���� �����ֱ� */
					stmt = conn.createStatement(); // Statement ��ü ����
					query = "SELECT db_tastehistory_tastecode, db_tastecode_name FROM tastehistory_table, tastecode_table WHERE db_tastehistory_memberid = '" + form_memberid +"' AND db_tastehistory_tastecode = db_tastecode_code";
							// ���̺� ���� tastecode�� code��(tastehistory, tastecode), memberid�� �˻�
					rs = stmt.executeQuery(query); // ResultSet ��ü ����(stmt ������ ���� ���)
				%>
				<table> <!-- �ش� ȸ���� ��� ����Ʈ �����ֱ� -->
					<tr>
						<th> ȸ����̱����ڵ�	</th>
						<th> ȸ����̱��а�	 	</th>
					</tr>
				<%
					while(rs.next()){ // EOF ������ �ݺ�
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
				}catch(Exception e){	// ���� �߻� ��
					e.printStackTrace();
				}finally{ 				// ������ ����(���� ���ο� �������)
					if(rs != null){ 	// null�� �ƴ϶��
						rs.close(); 	// rs �ݱ�
					}
					if(stmt != null){ 	// null�� �ƴ϶��
						stmt.close();	// stmt �ݱ�
					}
					if(conn != null){ 	// null�� �ƴ϶��
						conn.close();	// conn �ݱ� (���� ������ �ݴ�� �ݾƾ� ��)
					}
				}
			}
		
	%>
	<script >
		function form_retrieve2_check_javascript(){
			if(form_member_retrieve2.form_memberid.value.length == 0){
				alert("ȸ�޾��̵� �Էµ��� �ʾҽ��ϴ�.");
				form_member_retrieve2.form_memberid.focus();
				return false;
			}
			if(form_member_retrieve2.form_password.value.length == 0){
				alert("ȸ�޺�й�ȣ�� �Էµ��� �ʾҽ��ϴ�.");
				form_member_retrieve2.form_password.focus();
				return false;
			}
			
			form_member_retreve2.submit();
		}
	</script>
</body>
</html>