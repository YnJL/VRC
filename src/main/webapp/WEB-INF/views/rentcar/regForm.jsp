<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 등록 페이지</title>
</head>
<body>
<div align = "center"><h1>차량등록</h1></div>
<hr>
<form action = "registCar" method = "POST">
	<table width = "700" align = "center" border = "1">
		<tr>
			<th>차량이름</th>
			<td colspan = "2">
			<input type = "text" name = "name" size = "50"></td>
		</tr>
		
		<tr>
			<th>카테고리</th>
			<td><input type = "text" name = "category" size = "50"></td>
			<td>1.소형 2.중형 3.대형</td>
		</tr>
		
		<tr>
			<th>렌트비용</th>
			<td colspan = "2"><input type = "text" name = "price" size = "50"></td>
		</tr>
		
		<tr>
			<th>인승</th>
			<td colspan = "2"><input type = "text" name = "usepeople" size = "50"></td>
		</tr>
		
		<tr>
			<th>제조사</th>
			<td colspan = "2"><input type = "text" name = "company" size = "50"></td>
		</tr>
		
		<tr>
			<th>차량 이미지 파일명</th>
			<td colspan = "2"><input type = "text" name = "img" size = "50"></td>
		</tr>

		<tr>
			<th>차량 상세 정보</th>
			<td colspan = "2"><input type = "text" name = "info" size = "50"></td>
		</tr>
		<tr>
			<td colspan = "3" align = "center">
				<input type = "submit" value = "등록">&nbsp;&nbsp;&nbsp;&nbsp;
				<a href = "/rentcar/carlist">메인</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>