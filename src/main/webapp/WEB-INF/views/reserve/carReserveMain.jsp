<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "org.vision.rentcar.model.Rentcar" %>
<%@ page import = "java.util.List" %>
<%@ page import = "org.vision.rentcar.dao.RentcarDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type = "text/css" href = "mystyle.css">
<title>렌트카Main</title>
</head>
<body>
	<div color = 'gray' align = "center">
		<h1>최신등록차량</h1>
		<a href = "/">HOME</a>
	</div>
	
	<form action="/reserve/search" method = "get">
		<font size = "3" color = "gray"><b>차량검색하기</b></font>&nbsp;&nbsp;
		<select name = "category" style = "">
		<option value = "0">전체</option>
		<option value = "1">소형</option>
		<option value = "2">중형</option>
		<option value = "3">대형</option></select>&nbsp;&nbsp;
		<input type = "submit" value = "검색"> &nbsp;&nbsp;
	</form>
	
	<hr>
	
	<table width = "1000" align = "center">
		<tr higth = "240">
		<c:forEach items = "${recentList }" var = "dto">
			<td width = "333" align = "center">
				<a href = "/reserve/reserve?no=${dto.no }">
					<img alt="" src="../resources/${dto.img }" width = "300" height = "200">
				</a>
					<p>차량명 : ${dto.name }</p>
			</td>
		</c:forEach>
		</tr>
	</table>
	<hr>
</body>
</html>