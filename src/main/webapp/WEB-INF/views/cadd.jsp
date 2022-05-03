<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.vision.rentcar.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량추가</title>
<style>
table {
	table-layout: fixed;
	overflow-wrap: break-word;
}

span.menu {
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
img.car {
  width: 300px;
  height: 150px;
  object-fit: cover;
}
th.col{
	background: #333333;
	color: white;
}
</style>
<script>
function setThumbnail(event){
	var reader = new FileReader();
	reader.onload = function(event){
		var img = document.getElementById("carImg");
		img.setAttribute("src", event.target.result);
	};
	reader.readAsDataURL(event.target.files[0]);
}
</script>
</head>
<body>
<%!String id; %>
<% id=(String) session.getAttribute("id"); %>
<c:if test="${id ne 'admin' }">
	<script>
	alert("관리자만 접속할 수 있는 페이지 입니다");
	document.location.href='/';
	</script>
</c:if>
<header>
	<table width=100% align="center">
		<tr>
			<td width=77% height=100px>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="/"><img src="../resources/admin.png" width="15%" height="100%" /></a>
			</td>
			<td>
				<form action="member/logout" method="post" name="csearch">
				<p align=center>관리자 페이지 입니다<br/><br/>
				<input type="button" value="홈 메뉴" onClick="location.href='/'">
				<input type="submit" value="로그아웃"></p>
				</form>
			</td>
	</tr>
	<tr><th colspan=2>
		<span class="menu" onclick="location.href='carList'">차량관리</span>
		<span class="menu" onclick="location.href='rlist'">예약관리</span>
		<span class="menu" onclick="location.href='mlist'">회원관리</span>
		<span class="menu" onclick="location.href='/board/list'">자유게시판</span>
	</th></tr>
</table>
</header>
<h2 align=center>차량추가</h2>

<form action="caradd" method="post" enctype="multipart/form-data">
<table border=1 align=center>
	<tr>
		<td align=center rowspan=6><span id="thumbnail"><img src="" width="300px" id="carImg"></span></td>
		<th class = 'col' width="100">차량이름</th>
		<td width="200"><input type="text" name="name" size="30"></td>
	</tr>
	<tr>
		<th class = 'col' >차량번호</th>
		<td><input type="text" name="no" size="30"></td>
	</tr>
	<tr>
		<th class = 'col' >차량분류</th>
		<td>
			<input type="radio" name="category" value="1">소형
			<input type="radio" name="category" value="2">중형
			<input type="radio" name="category" value="3">대형
		</td>
	</tr>
	<tr>
		<th class = 'col' >제조회사</th>
		<td><input type="text" name="company" size="30"></td>
	</tr>
	<tr>
		<th class = 'col' >차량정원</th>
		<td><input type="text" name="usepeople" size="30"></td>
	</tr>
	<tr>
		<th class = 'col' >대여가격</th>
		<td><input type="text" name="price" size="30"></td>
	</tr>
	<tr>
		<td><input type="file" name="img" onchange="setThumbnail(event);" accept="image/png, image/jpeg"></td>
		<th class = 'col'>기타정보</th>
		<td><input type="text" name="info" size="30"></td>
	</tr>
</table>
<p align=center>
	<input type="submit" value="등록하기">
</p>
</form>
<footer>
	<hr size="10" align="left" width=100% noshade="noshade"></hr>
	<small> &nbsp;&nbsp; 인공지능적용 애플리케이션 및 서버사이드 과정 &nbsp; |
		&nbsp;비젼직업전문학교<br /> &nbsp;&nbsp; 각종문의 : hgd1234@naver.com &nbsp;| 연락처
		: 010-0000-000<br /> &nbsp;&nbsp; Copyright &copy; 2022 All Rigths
		Reserved.
		<div style="POSITION: fixed; MARGIN-LEFT: 670px; TOP: 900px; LEFT: 55%; z-index: 9999;">
			<a href="https://open.kakao.com/o/syZiOZ5d"><img src="../resources/kakao.png" align="right" /></a>
		</div>
		<div style="POSITION: fixed; MARGIN-LEFT: 670px; TOP: 830px; LEFT: 55%; z-index: 9999; size: 50;">
			<div style="cursor: pointer;" onclick="window.scrollTo(0,0);">
				<img src="../resources/top.png" align="right" width="25%" height="25%" />
			</div>
		</div>
	</small>
</footer>
</body>
</html>