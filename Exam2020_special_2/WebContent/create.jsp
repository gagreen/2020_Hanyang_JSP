<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<h1>판매등록</h1>
	<form action="action_create.jsp" method="post">
	<table>
		<tr>
			<td>비번호</td>
			<td><input type="text" name="saleno" ></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td><input type="text" name="pcode"></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="date" name="saledate"></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td><input type="text" name="scode"></td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="text" name="amount"></td>
		</tr>
		<tr>
			<td colspan="2"> <input type="submit" value="등록">
				<input type="reset" value="다시 쓰기"></td>
		</tr>
	</table>
	</form>
</body>
</html>