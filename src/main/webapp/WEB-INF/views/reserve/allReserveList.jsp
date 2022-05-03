<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>총 예약 목록</title>
</head>
<body>

<h1>예약 목록</h1>
<a href = "/">HOME</a>
<hr>
<table border = "1">
<tr>
	<th>예약번호</th>
	<th>예약자ID</th>
	<th>차량이미지</th><th>차량이름</th><th>사용일자</th>
	<th>사용일수</th><th>사용대수</th>
	<th>사용단가</th><th>차량보험료</th>
	<th>보험적용</th><th>보험요금</th>
	<th>WIFI적용</th><th>WIFI요금</th>
	<th>네비세이션사용</th>
	<th>아동시트</th><th>아동시트요금</th>
	<th>총비용</th><th>예약취소</th>
</tr>
<c:forEach items = "${allData }" var ="dto">
<tr align = "right">
	<td>${dto.regnum}</td>
	<td>${dto.memid}</td>
	<td>${dto.img}</td>
	<td>${dto.name}</td>
	<td>${dto.rday}</td>
	<td>${dto.dday}</td>
	<td>${dto.qty}</td>
	<td>${dto.price}</td>
	<td>${dto.fee}</td>
	<td>${dto.insurance}</td>
	<td>${dto.insu_fee}</td>
	<td>${dto.wifi}</td>
	<td>${dto.wifi_fee}</td>
	<td>${dto.navigation}</td>
	<td>${dto.babyseat}</td>
	<td>${dto.baby_fee}</td>
	<td>${dto.total}</td>
	<td align = "center">
	<button onclick = "location.href='/reserve/delete?regnum=${dto.regnum }'">예약취소</button>
</tr>
</c:forEach>
</table>
</body>
</html>