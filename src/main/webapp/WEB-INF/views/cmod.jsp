<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.vision.rentcar.model.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량정보수정</title>
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


table{margin: auto;}

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
			<span class="menu" onclick="location.href='carGrid'">차량목록</span>
			<span class="menu" onclick="location.href='resform'">예약하기</span> 
			<span class="menu" onclick="location.href='myreserve'">예약확인</span> 
			<span class="menu" onclick="location.href='/board/list'">자유게시판</span>
			</th>
		</tr>
	</table>
</header>
<h2 align=center>차량정보</h2>
<form action="carmod" method="post" enctype="multipart/form-data">
<table border=1>
	<tr>
		<td align=center rowspan=6><span id="thumbnail"><img src="resources/cars/${carinfo.img }" width="300px" id="carImg"></span></td>
		<th class = 'col' width="100">차량이름</th>
		<td width="200"><input type="text" name="name" size="30" value="${carinfo.name }"></td>
	</tr>
	<tr>
		<th class = 'col' width="100">차량번호</th>
		<td width="200"><input type="hidden" name="no" value="${carinfo.no }">${carinfo.no }</td>
	</tr>
	<tr>
		<th class = 'col'>차량분류</th>
		<td>
			<input type="radio" name="category" value="1" <c:if test="${carinfo.category eq 1 }"> checked </c:if>>소형&nbsp;&nbsp;
			<input type="radio" name="category" value="2" <c:if test="${carinfo.category eq 2 }"> checked </c:if>>중형&nbsp;&nbsp;
			<input type="radio" name="category" value="3" <c:if test="${carinfo.category eq 3 }"> checked </c:if>>대형
		</td>
	</tr>
	<tr>
		<th class = 'col'>제조회사</th>
		<td><input type="text" name="company" size="30" value="${carinfo.company}"></td>
	</tr>
	<tr>
		<th class = 'col'>차량정원</th>
		<td><input type="text" name="usepeople" size="30" value="${carinfo.usepeople}"></td>
	</tr>
	<tr>
		<th class = 'col'>대여가격</th>
		<td><input type="text" name="price" size="30" value="${carinfo.price}"></td>
	</tr>
	<tr>
		<td><input type="file" name="img" onchange="setThumbnail(event);" accept="image/png, image/jpeg"></td>
		<th class = 'col'>기타정보</th>
		<td><input type="text" name="info" size="30" value="${carinfo.info}"></td>
	</tr>
</table>
<p align=center>
	<input type="submit" value="수정하기">
</p>
</form>
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