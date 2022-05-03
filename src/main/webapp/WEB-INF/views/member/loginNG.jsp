<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<center>
	<h2>로그인</h2>
		<table border="1" width="500">
			<form action='login' method="post">
			<tr height ='50'>
				<td width = '150' align = 'center'>아이디</td>
				<td width = '350' align = 'center'><input type="text" name="id" size = '40'></input></td>
			</tr>
			<tr height = '50'>
				<td width = '150' align = 'center'>패스워드</td>
				<td width = '350' align = 'center'><input type="password" name="pass" size = '40'></input></td>
			</tr>
			<tr height = '50'>
				<td colspan="2" align="center">
				<pre>아이디 또는 비밀번호가 일치하지 않습니다.</pre>
				</td>
			</tr>
			<tr height = '50'>
				<td colspan="2" align="center">
				<input type = "checkbox" name = "cookieSave" value = "쿠키저장"/> 쿠키저장  &nbsp;&nbsp;
				<input type="submit" value="로그인" />&nbsp;&nbsp;
				<button type="button" onclick="location.href='joinForm'">회원가입</button>
				<hr>
				<a href = "/">메인가기</a>
				</td>
			</tr>
		</table>
	</form>
 </center>
</body>
</html>

