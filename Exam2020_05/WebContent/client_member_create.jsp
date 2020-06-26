<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 회원정보등록 (클라이언트) </title>
</head>
<body>
	<form name="form_member_create" method="post" action="server_member_create.jsp">
		<table>
			<tr>
				<td> 회원ID        :</td> <!-- 회원 ID text 타입 -->
				<td> <input type="text" name="form_memberid"></td>
			</tr>
			<tr>
				<td> 회원비밀번호       :</td> <!-- 회원비밀번호 password 타입 -->
				<td> <input type="password" name="form_password"></td>
			</tr>
			<tr>
				<td> 회원성명            :</td> <!-- 회원이름 text 타입 -->
				<td> <input type="text" name="form_name"></td> 
	        </tr>
	        <tr>
	        	<td> 회원성별구분       :</td> <!-- 회원 성별 radio 타입(하나만 선택 가능) -->
	        	<td> 남 <input type="radio" name="form_gender" value="남">
	        		 여 <input type="radio" name="form_gender" value="여">  </td>
	        </tr>
	        <tr>
	        	<td> 회원종교구분       :</td> <!-- 회원 종교 select box 타입(option 중 하나) -->
	        	<td> <select name="form_religion">
						<option value="천주교"> 천주교 </option>
						<option value="기독교"> 기독교 </option>
						<option value="불교도"> 불교 </option>
						<option value="이슬람"> 이슬람 </option>
					</select>
				</td>
					
			</tr>
			<tr>
				<td> 회원가입일자       :</td> <!-- 회원 가입일 text 타입 -->
				<td> <input type="text" name="form_joinday">   </td>
			</tr>
			<tr>
				<td> 회원주소           :</td> <!-- 회원 주소 textarea 타입(크기 지정 가능) -->
				<td> <textarea name="form_address"></textarea> </td>
			</tr>
			<tr>
				<td> 회원자기소개서파일 :</td> <!-- 회원 자소서 파일 file 타입(컴퓨터에서 찾기 가능) -->
				<td> <input type="file" name="form_filename">  </td>
			</tr>
			<tr>
				<td> 회원취미구분       :</td> <!-- 회원 취미 checkbox 타입(다중 선택 가능) -->
				<td> 없음<input type="checkbox" name="form_tastecode" value=0> &nbsp;
					 축구<input type="checkbox" name="form_tastecode" value=1> &nbsp;
					 수영<input type="checkbox" name="form_tastecode" value=2> &nbsp;
					 영화<input type="checkbox" name="form_tastecode" value=3> &nbsp;
					 독서<input type="checkbox" name="form_tastecode" value=4> &nbsp;
				</td>
			</tr>
		</table>
		<input type="submit" value="정보등록하기"  onclick="return form_createcheck_javascript();"> &nbsp;
		<input type="reset"  value="화면입력지우기">
	</form>
	
	<script>
		function form_createcheck_javascript(){ //form 입력 검사
			if(form_member_create.form_memberid.value.length == 0){ // 회원 아이디 체크여부
				alert("회원ID가 입력되지 않았습니다."); 			// 경고창 띄움 
				form_member_create.form_memberid.focus(); 	// 입력창에 커서
				return false;								// submit 무효
			}
			if(form_member_create.form_password.value.length == 0){ // 회원 비밀번호 체크여부
				alert("회원비밀번호가 입력되지 않았습니다.");
				form_member_create.form_password.focus();
				return false;
			}
			if(form_member_create.form_name.value.length == 0){ // 회원 성명 체크여부
				alert("회원성명이 입력되지 않았습니다.");
				form_member_create.form_name.focus();
				return false;
			}
			if(form_member_create.form_address.value.length == 0){ // 회원 주소 체크여부
				alert("회원주소가 입력되지 않았습니다.");
				form_member_create.form_address.focus();
				return false;
			}
			if(form_member_create.form_gender.value == ""){ // 회원 성별 체크여부
				alert("회원성별구분이 입력되지 않았습니다.");
				form_member_create.form_gender.focus();
				return false;
			}
			if(form_member_create.form_religion.value == ""){ // 회원 종교 체크여부 
				alert("회원종교구분이 입력되지 않았습니다.");
				form_member_create.form_religion.focus();
				return false;
			}
			if(form_member_create.form_joinday.value == ""){ // 회원 가입일자 체크여부
				alert("회원가입일자가 입력되지 않았습니다.");
				form_member_create.form_joinday.focus();
				return false;
			}
			
			const arrTastecode = document.getElementsByName("form_tastecode"); // 취미구분코드 입력 체크
			var check = true;							// if문 기준
			for(var i=0; i<arrTastecode.length; i++){ 	// 모든 체크박스 검사
				if(arrTastecode[i].checked == true){ 	// 체크된 것이 있다면
					check = false; 						// 넘기기
					break;
				}
			}
			if(check){
				alert("회원취미구분이 입력되지 않았습니다.");
				form_member_create.form_tastedcode.focus();
				return false;
			}
	
			form_member_create.submit();	// 문제가 없다면 submit 
		}
	</script>
</body>
</html>