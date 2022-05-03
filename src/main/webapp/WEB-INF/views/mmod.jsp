<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<style>
table{margin: auto;}
</style>
<body>
<%!String id; %>
<% id=(String) session.getAttribute("id"); %>
<c:if test="${id ne 'admin' }">
	<script>
	alert("관리자만 접속할 수 있는 페이지 입니다");
	document.location.href='home';
	</script>
</c:if>
<h2 align=center>회원정보수정</h2>
<form action="mmodify" method="post">
<table border=1>
	<tr>
		<th width="100">ID</th>
		<td width="200"><input type="hidden" name="id" value="${info.id}">${info.id}</td>
	</tr>
	<tr>
		<th>PW</th>
		<td><input type="password" name="password" size="30"></td>
	</tr>
	<tr>
		<th>e-Mail</th>
		<td><input type="email" name="email" size="30" value="${info.email }"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="tel" size="30" value="${info.tel }"></td>
	</tr>
	<tr>
		<th>연령대</th>
		<td>
			<input type="radio" name="age" value="20대" <c:if test="${info.age eq '20대'}"> checked</c:if>>20대&nbsp;&nbsp;
			<input type="radio" name="age" value="30대" <c:if test="${info.age eq '30대'}"> checked</c:if>>30대&nbsp;&nbsp;
			<input type="radio" name="age" value="40대" <c:if test="${info.age eq '40대'}"> checked</c:if>>40대<br/>
			<input type="radio" name="age" value="50대" <c:if test="${info.age eq '50대'}"> checked</c:if>>50대&nbsp;&nbsp;
			<input type="radio" name="age" value="60대" <c:if test="${info.age eq '60대'}"> checked</c:if>>60대 이상
		</td>
	</tr>
	<tr>
		<th>직업</th>
		<td><input type="text" name="job" size="30" value="${info.job }"></td>
	</tr>
	<tr>
		<th>취미</th>
		<td>
			<input type="checkbox" name="hobby" value="등산" <c:if test="${fn:contains(info.hobby,'등산')}"> checked</c:if>>등산&nbsp;
			<input type="checkbox" name="hobby" value="여행" <c:if test="${fn:contains(info.hobby,'여행')}"> checked</c:if>>여행&nbsp;
			<input type="checkbox" name="hobby" value="캠핑" <c:if test="${fn:contains(info.hobby,'캠핑')}"> checked</c:if>>캠핑<br/>
			<input type="checkbox" name="hobby" value="낚시" <c:if test="${fn:contains(info.hobby,'낚시')}"> checked</c:if>>낚시&nbsp;
			<input type="checkbox" name="hobby" value="기타" <c:if test="${fn:contains(info.hobby,'기타')}"> checked</c:if>>기타
		</td>
	</tr>
</table>
	<p align=center><input type="submit" value="수정하기"></p>
</form>
</body>
</html>