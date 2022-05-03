<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 차량 목록</title>
<%
	String id = "guest";
try{
	id = (String) session.getAttribute("id");
} catch (Exception e){
	id = null;
}
if(!id.equals("admin")){
%>
<script type = "text/javascript">
	alert('관리자외 접근이 불가합니다.');
	history(-1);
</script>
<%
 response.sendRedirect("/");
}
%>
</head>
<body>

<h1 align = "center">등록 차량 목록</h1>
<menu align = "left">
<a href = "/rentcar/regForm">차량등록</a>&nbsp;&nbsp;&nbsp;
<a href = "/">HOME</a>
</menu>
<hr>
<center>
	<table>
		<tr>
			<td align = "center" colspan = "3">
			<font size = "6" color = "gray">전체 렌트카보기</font></td>
		</tr>
		<c:forEach items = "${list }" var = "dto">
			<tr height = "220">
				<td width = "33%" align = "center">
					<img alt="" src="../resources/${dto.img }" width = "300" height = "200">
				<td>
					<font size = "3" color = "gray"><b>차량명: ${dto.name }:${dto.img }</b></font></td>
				<td align = "center">
				<button onclick = "location.href='/rentcar/delete?no=${dto.no }'">삭제</button>
				</td>
			</tr>		
		</c:forEach>
	</table>
</center>
</body>
</html>