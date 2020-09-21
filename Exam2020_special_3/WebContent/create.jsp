<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form action="action_create.jsp" method="post" onsubmit="return check()">
	<table>
		<tr>
			<td>매출전표번호</td>
			<td><input type="text" name="saleno"></td>
		</tr>
		<tr>
			<td>지점코드</td>
			<td><input type="text" name="scode"></td>
		</tr>
		<tr>
			<td>판매일자</td>
			<td><input type="text" name="date"></td>
		</tr>
		<tr>
			<td>피자코드</td>
			<td><select name="pcode">
				<option value="">피자 선택</option>
				<option value="AA01">[AA01] 고르곤졸라피자</option>
				<option value="AA02">[AA02] 치즈피자</option>
				<option value="AA03">[AA03] 페퍼로니피자</option>
				<option value="AA04">[AA04] 콤비네이션피자</option>
				<option value="AA05">[AA05] 고구마피자</option>
				<option value="AA06">[AA06] 포테이토피자</option>
				<option value="AA07">[AA07] 불고기피자</option>
				<option value="AA08">[AA08] 나폴리피자</option>
			</select></td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="text" name="amount"></td>
		</tr>
	</table>
	<input type="submit" value="전표등록">
	<input type="button" value="다시쓰기" onclick="reset_check()">
	</form>
	
	<script type="text/javascript">
		function check() {
			const form = document.querySelector('form');
			if(form.saleno.value == "") {
				alert('매출전표번호(이)가 입력되지 않았습니다.');
				form.saleno.focus();
				return false;
			}
			if(form.scode.value == "") {
				alert('지점코드(이)가 입력되지 않았습니다.');
				form.scode.focus();
				return false;
			}
			if(form.date.value == "") {
				alert('판매일자(이)가 입력되지 않았습니다.');
				form.date.focus();
				return false;
			}
			if(form.pcode.value == "") {
				alert('피자코드(이)가 입력되지 않았습니다.');
				form.pcode.focus();
				return false;
			}
			if(form.amount.value == "") {
				alert('판매수량(이)가 입력되지 않았습니다.');
				form.amount.focus();
				return false;
			}
		}
		
		function reset_check() {
			const form = document.querySelector('form');
			alert('정보를 지우고 처음부터 다시 입력 합니다.!');
			form.reset();
		}
	</script>
</body>
</html>