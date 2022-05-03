<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.vision.rentcar.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voucher</title>
<style>
table {
	table-layout: fixed;
	overflow-wrap: break-word;
}

span {
	background: silver;
	display: inline-block;
	width: 24%;
	height: 50px;
	line-height: 50px;
}

span:hover {
	background: black;
	color: white;
	cursor: pointer;
}

footer {
	width: 100%;
	bottom: 0;
	position: absolute;
	background: #000000;
	height: 120px;
	color: white;
}

table{margin: auto;}

th.col{
	background: #333333;
	color: white;
}


</style>

</head>
<body>
<%!String id; %>
	<%
		id = (String) session.getAttribute("id");
		if (id == null) {
	%>
	<script>
		alert("로그인 해주세요!");
		location.href="/";
	</script>
	<%
		}
	%>
	<header>
	<table width=100% align="center">
		<tr>
			<td width=77% height=100px>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/"><img src="../resources/10.png" width="15%" height="100%" /></a>
			</td>
			<td>
				<%
				if (id == null) {
				%>
				<form action="/member/login" method="post">
					<table>
						<tr>
							<th align=right width=40%>ID</th>
							<td width=60%><input type="text" name="id" size=10></td>
						</tr>
						<tr>
							<th align=right>PW</th>
							<td><input type="password" name="pass" size=10></td>
						</tr>
						<tr>
							<th colspan=2>&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="submit" value="로그인"> 
							<input type="button" value="회원가입" onClick="location.href='regform'">
							</th>
						</tr>
					</table>
				</form>
					<%} else {%><p align=center>
						<%=id%>님 방문을 환영합니다<br/><br/>
					<%if(id.equals("admin")){%>
						<input type="button" value="관리메뉴" onClick="location.href='adminhome'">
					<%} else {%>
						<input type="button" value="내 정보" onClick="location.href='myinfo'">
					<%}%>
						<input type="button" value="로그아웃" onClick="location.href='logout'"></p>
					<%}%>
			</td>
		</tr>
		<tr>
			<th colspan=2>
			<span onclick="location.href='carGrid'">차량목록</span>
			<span onclick="location.href='resform'">예약하기</span> 
			<span onclick="location.href='myreserve'">예약확인</span> 
			<span onclick="location.href='/board/list'">자유게시판</span>
			</th>
		</tr>
	</table>
</header>
<h2 align=center>예약내역확인</h2>
<%!
	String insu, wifi, navi, baby;
	int total;
%>
<%
	insu = "X"; wifi = "X"; navi = "X"; baby = "X";
	RentReserve dto = (RentReserve) request.getAttribute("voucher");
	Rentcar car = (Rentcar) request.getAttribute("carinfo");
	total = dto.getDday() * dto.getQty() * car.getPrice();
	
	if(dto.getInsurance() == 1) {
		insu="O";
		total += 10000 * dto.getDday() * dto.getQty();
	}
	
	if(dto.getWifi() == 1) {
		wifi="O";
		total += 10000 * dto.getDday() * dto.getQty();
	}
	
	if(dto.getNavigation() == 1) navi = "O";
	
	if(dto.getBabyseat() == 1) {
		baby = "O";
		total += 5000 * dto.getDday() * dto.getQty();
	}
	
%>
<table border=1>
	<tr>
		<th class = 'col' width="100">예약번호</th>
		<td width="200"><input type="hidden" name="regno" value="${voucher.regno }">${voucher.regno }</td>
		<th class = 'col' width="100">예약자id</th>
		<td width="200">${voucher.id }</td>
	</tr>
	<tr>
		<th class = 'col'>예약차량</th>
		<td>${carinfo.name }</td>
		<th class = 'col'>예약수량</th>
		<td>${voucher.qty }</td>
	</tr>
	<tr>
		<th class = 'col'>렌트일시</th>
		<td>${voucher.rday }</td>
		<th class = 'col'>렌트일수</th>
		<td>${voucher.dday }</td>
	</tr>
	<tr>
		<th class = 'col'>보험여부</th>
		<td><%=insu %></td>
		<th class = 'col'>WIFI여부</th>
		<td><%=wifi %></td>
	</tr>
	<tr>
		<th class = 'col'>네비여부</th>
		<td><%=navi %></td>
		<th class = 'col'>아동석여부</th>
		<td><%=baby %></td>
	</tr>
	<tr>
		<th class = 'col'>총 요금</th>
		<td colspan="3" align="center"><%=total %> 원</td>
	</tr>
</table>
<p align=center>
		<input type="button" value="홈으로 돌아가기" onClick="location.href='/'">
		
		<input type="button" value="수정하기" onClick="location.href='rmod?regno=${voucher.regno}'">
</p>
</body>
<footer>
	<hr size="10" align="left" width=100% noshade="noshade"></hr>
	<small>
		&nbsp;&nbsp; 인공지능적용 애플리케이션 및 서버사이드 과정 
		&nbsp; | &nbsp;비젼직업전문학교<br/>
 		&nbsp;&nbsp; 각종문의 : hgd1234@naver.com  &nbsp;| 연락처 : 010-0000-000<br/>
 		&nbsp;&nbsp; Copyright &copy; 2022 All Rigths Reserved.
		<div style="POSITION: fixed; MARGIN-LEFT: 680px; TOP: 850px; LEFT: 55%; z-index: 9999;">
			<div class="">
				<a href="https://open.kakao.com/o/syZiOZ5d">
				<img src="../resources/kakao.png" align="right" /></a>
			</div>
		</div>
	</small>
</footer>
</html>