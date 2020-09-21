<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<h1>참가자등록</h1>
	<form action="action_create.jsp" method="post">
	<table>
		<tr>
			<td>참가자 ID</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>참가자 이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="year">년
				<input type="text" name="month">월
				<input type="text" name="day">일</td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="radio" name="gender" value="M">남  &nbsp;
				<input type="radio" name="gender" value="F">여</td>
		</tr>
		<tr>
			<td>특기</td>
			<td><select name="talent">
					<option value="">특기 선택</option>
					<option value="1">보컬</option>
					<option value="2">댄스</option>
					<option value="3">랩</option>
				</select></td>
		</tr>
		<tr>
			<td>소속사</td>
			<td><input type="text" name="office"></td>
		</tr>
	</table>
	<input type="submit" value="등록" onclick="return check()">
	</form>
	
	<script type="text/javascript">
		function check() {
			const form = document.querySelector('form');
			if(form.id.value == "") {
				alert('ID를(을) 입력해주세요');
				form.id.focus();
				return false;
			}
			if(form.name.value == "") {
				alert('이름를(을) 입력해주세요');
				form.name.focus();
				return false;
			}
			if(form.year.value == "") {
				alert('년를(을) 입력해주세요');
				form.year.focus();
				return false;
			}
			if(form.month.value == "") {
				alert('월를(을) 입력해주세요');
				form.month.focus();
				return false;
			}
			if(form.day.value == "") {
				alert('일를(을) 입력해주세요');
				form.day.focus();
				return false;
			}
			if(form.gender.value == "" || form.gender.value == null) {
				alert('성별를(을) 입력해주세요');
				form.gender.focus();
				return false;
			}
			if(form.talent.value == "") {
				alert('특기를(을) 입력해주세요');
				form.talent.focus();
				return false;
			}
			if(form.office.value == "") {
				alert('소속사를(을) 입력해주세요');
				form.office.focus();
				return false;
			}
			
			form.submit();
		}
	</script>
</body>
</html>