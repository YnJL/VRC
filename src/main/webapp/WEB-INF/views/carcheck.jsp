<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량등록체크</title>
</head>
<body>
	<%
	String check=(String)session.getAttribute("check");
	int no = (int)pageContext.findAttribute("no");
	String ref = (String)session.getAttribute("ref");
	
	if(check.equals("success")) {%>
		<script>
		alert("차량등록 성공!");
		document.location.href='carinfo?no=${no}';
		</script>
	<%}	else if(check.equals("failure")){%>
		<script>
		alert("차량등록 실패!");
		document.location.href='${ref}';
		</script>
	<%} else {%>
		<script>
		alert("차량등록 실패!!!");
		document.location.href='${ref}';
		</script>
	<%}	%>
</body>
</html>