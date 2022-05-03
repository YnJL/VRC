<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
</head>
<body>
<h1>선택한 차량 정보 및 옵션선택</h1>
<div align = "left">
	<a href = "carReserveMain">되돌아가기</a>
</div>

<hr>

<center>
	<form action = "reserveProc" method = "POST">
		<table wight = "100" border="1">
			<tr height = "100">
				<td align = "center" colspan = "3">
				<font size = "6" color = "gray">${memid }님이 선택한${dto.name }차량정보</font></td>
			</tr>
			<tr>
				<td rowspan = "12" width = "50%" align = "center">
				<image alt = "" src = "../resources/${dto.img }"width = "450"></image></td>
				<td width = "25%" align = "center">차량이름</td>
				<td align = "left">${dto.name }</td>
			</tr>
			<tr>
				<td wigth = "25%" align = "center">차량분류</td>
				<td align = "left">${dto.category }</td>
			</tr>
			<tr>
				<td width = "25%" align = "center">대여가격</td>
				<td align = "left">${dto.price }</td> 
			</tr>
			<tr>
				<td width = "25%" align = "center">제조회사</td>
				<td align = "left">${dto.company }</td>
			</tr>
			<tr>
				<td width = "25%" align = "center">상세정보</td>
				<td align = "left">${dto.info }</td>
			</tr>
			<tr>
				<td width = "25%" align = "center">대여수량</td>
				<td align = "left">
				<select name = "qty">
					<option value = "1">1대</option>
					<option value = "2">2대</option>
					<option value = "3">3대</option>
					<option value = "4">4대</option>
					<option value = "5">5대</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width = "25%" align = "center">대여기간</td>
				<td align = "left" width = "40">
				<select name = "dday">
					<option value = "1">1일</option>
					<option value = "2">2일</option>
					<option value = "3">3일</option>
					<option value = "4">4일</option>
					<option value = "5">5일</option>
					<option value = "6">6일</option>
					<option value = "7">7일</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width = "25%" align = "center">대여일자</td>
				<td align = "left">
				<input type = "date" name = "rday"></td>
			</tr>
			<tr>
				<td width = "25%" align = "center">보험적용</td>
				<td align = "left">
				<select name = "insurance" width = "40">
					<option value = "1">적용(1일1만원)</option>
					<option value = "0">비적용</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width = "25%" align = "center">WiFi적용</td>
				<td align = "left">
				<select name = "wifi" width = "40">
					<option value = "1">적용(1일1만원)</option>
					<option value = "0">비적용</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width = "25%" align = "center">네비게이션적용</td>
				<td align = "left">
				<select name = "navigation" width = "40%">
					<option value = "1">적용(무료)</option>
					<option value = "0">비적용</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width = "25%" align = "center">BabySeat적용</td>
				<td align = "left">
				<select name = "babyseat" width = "40%">
					<option value = "1">적용(5천원)</option>
					<option value = "0">비적용</option>
				</select>
				</td>
			</tr>
			<tr>
				<input type = "hidden" name = "no" value = "${dto.no }">
				<input type = "hidden" name = "img" value = "${dto.img }">
				<input type = "hidden" name = "memid" value = "${memid }">
				<input type = "hidden" name = "price" value = "${dto.price }">
				<td colspan = "3" width = "50%" align = "center">
				<input Type = "submit" value = "예약하기"></td>
			</tr>
		</table>
	</form>
</center>	
</body>
</html>