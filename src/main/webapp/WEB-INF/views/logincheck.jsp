<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Check</title>
</head>
<body>
	<%
	String check=(String)session.getAttribute("check");
	String ref = (String)session.getAttribute("ref");
	
	if(check.equals("success")) {%>
		<script>
		alert("로그인 성공!");
		</script>
	<%}	else if(check.equals("failure")){%>
		<script>
		alert("로그인 실패!");
		</script>
	<%} else if(check.equals("except")){%>
		<script>
		alert("로그인 실패!!");
		</script>
	<%} else {%>
		<script>
		alert("로그인 실패!!!");
		</script>
	<%}	%>
	<script>
		document.location.href='${ref}';
	</script>
</body>
</html>