<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<h1>교수 등록</h1>
	<form name="createForm" method="post" action="createAction.jsp">
		<table>
			<tr>
				<td>교수번호(자동발생)</td>
				<td><input type="text" name="profno"></td>
			</tr>
			<tr>
				<td>교수성명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>직급</td>
				<td><select name="position">
					<option value="정교수">정교수</option>
					<option value="조교수">조교수</option>
					<option value="전임강사">전임강사</option>
				</select></td>
			</tr>
			<tr>
				<td>월급</td>
				<td><input type="text" name="pay"></td>
			</tr>
			<tr>
				<td>입사일</td>
				<td><input type="text" name="hiredate"></td>
			</tr>
			<tr>
				<td>보너스</td>
				<td><input type="text" name="bonus"></td>
			</tr>
			<tr>
				<td>학과번호</td>
				<td><input type="text" name="deptno"></td>
			</tr>
		</table>
		<input type="submit" value="등록" onclick="return check_form()">
		<input type="button" value="조회" onclick="location.href='index.jsp?sec=prof_read.jsp'">
	</form>
	<script>
		function check_form(){
			if(createForm.name.value == ''){
				alert('교수성명을 입력하세요.');
				createForm.name.focus();
				return false;
			}
			if(createForm.id.value == ''){
				alert('ID를 입력하세요.');
				createForm.id.focus();
				return false;
			}
			if(createForm.position.value == ''){
				alert('직급을 입력하세요.');
				createForm.position.focus();
				return false;
			}
			if(createForm.pay.value == ''){
				alert('월급을 입력하세요.');
				createForm.pay.focus();
				return false;
			}
			if(createForm.hiredate.value == ''){
				alert('입사일을 입력하세요.');
				createForm.hiredate.focus();
				return false;
			}
			if(createForm.bonus.value == ''){
				alert('보너스를 입력하세요.');
				createForm.bonus.focus();
				return false;
			}
			if(createForm.deptno.value == ''){
				alert('학과번호를 입력하세요');
				createForm.deptno.focus();
				return false;
			}
			
			alert('교수 등록이 완료되었습니다.');
			createForm.submit();
		}
	</script>
</body>
</html>