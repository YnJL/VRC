<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입성공</title>
</head>
<body>
	<%
	String check=(String)session.getAttribute("check");
	if(check.equals("success")) {%>
		<script>
		alert("회원가입 성공!");
		document.location.href='/';
		</script>
	<%}	else if(check.equals("failure")){%>
		<script>
		alert("회원가입 실패!");
		document.location.href='regform';
		</script>
	<%} else {%>
		<script>
		alert("회원가입 실패!!!");
		document.location.href='/';
		</script>
	<%}	%>
</body>
</html>