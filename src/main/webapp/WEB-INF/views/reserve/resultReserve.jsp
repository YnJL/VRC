<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보</title>
</head>
<body>
예약된 정보입니다.<br>
<image alt = "" src = "../resources/${img }" width = "450"> </image><br>

차량번호 : ${reserveDTO.no }<br>

차량수 : ${reserveDTO.qty }<br>

사용일수 : ${reserveDTO.dday }일 사용 ${price * reserveDTO.dday * reserveDTO.qty } 원<br>

사용일자 : ${reserveDTO.rday }<br>

보험적용 : ${reserveDTO.insurance * 10000 * reserveDTO.dday * reserveDTO.qty} <br>

와이파이 : ${reserveDTO.wifi * 10000 * reserveDTO.dday * reserveDTO.qty }<br>

네비게이션 사용 : ${reserveDTO.navigation }<br>
			
아동시트 : ${reserveDTO.babyseat * 5000 * reserveDTO.qty } <br>
		
예약자 ID : ${reserveDTO.memid }<br>

합계 : ${cost }<br>

<button onclick = "location.href='/reserve/delete?regnum=${currval }'">예약취소</button>&nbsp;&nbsp;&nbsp;
<button onclick = "location.href='/reserve/reserveOK'">확인</button>			

</body>
</html>