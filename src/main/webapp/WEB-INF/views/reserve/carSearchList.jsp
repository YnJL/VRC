<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>렌트 차량 조건 검색</title>
</head>
<body>
	<div align = "center">
		<h1>${type }렌트카 보기</h1>
	</div>
	<div align = "left">
		<a href = "carReserveMain">되돌아가기</a>
	</div>
	
	<hr>
	<center>
		<table>
			<c:forEach items = "${list }" var = "dto">
				<tr height = "220">
					<td width = "33%" align = "center">
						<img alt = "" src="../resources/${dto.img }" width = "300" height = "200">
					<td>
						<font size = "3" color = "gray"><b>차량명 : ${dto.name }:${dto.img }</b></font></td>
					<td align = "center">
						<button onclick = "location.href = '/reserve/reserve?no=${dto.no}'">예약하기</button>
					</td>
				</tr>	
			</c:forEach>
		</table>
	</center>
</body>
</html>