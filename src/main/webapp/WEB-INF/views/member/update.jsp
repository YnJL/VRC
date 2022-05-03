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
table{

	table-layout: fixed;
	overflow-wrap: break-word;
}
span{
	background: silver;
	display: inline-block;
	width: 24%;	
	height: 50px; line-height: 50px;
}
span:hover{
	background: black;
	color: white;
	cursor: pointer;
}
footer {
	 width: 100%;
	 bottom: 0;
	 position: absolute;
	 background: #000000;
     height:120px;
	 color: white;
}
th.col{
	background: #333333;
	color: white;
}
  
</style>
			<script>
			function confirm_del(mi){
				if(confirm("정말 탈퇴하시겠습니까?")){
					return location.href='mdelete?id='+mi;
				} else {
					return;
				}
			}
			</script>
<body>
<%!String id; %>
<% id=(String) session.getAttribute("id"); %>

	<header>
		<table width=100% align = "center">
			<tr>
				<td width=77% height=100px>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href = "/"><img src="../resources/10.png" width="15%" height="100%"/></a>
			</td>
			<td>
				<%
					if(id==null){
				%>
				<form action="/member/login" method="post">
					<table>
						<tr>
							<th align=right width=40%>ID　</th>
							<td width=60%><input type="text" name="id" size=10></td>
						</tr>
						<tr>
							<th align=right>PW　</th>
							<td><input type="password" name="pass" size=10></td>
						</tr>
						<tr>
							<th colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="로그인">
							<input type="button" value="회원가입" onClick="location.href='/regform'">
					</table>
				</form>
				<%} else {%><p align=center>
					<%=id%>님 방문을 환영합니다<br/><br/>
				<%if(id.equals("admin")){%>
					<input type="button" value="관리메뉴" onClick="location.href='/adminhome'">
				<%} else {%>
					<input type="button" value="내 정보" onClick="location.href='/myinfo'">
				<%}%>
					<input type="button" value="로그아웃" onClick="location.href='/member/logout'"></p>
				<%}%>
			</td>
			</tr>
			<tr>
				<th colspan=2>
				<span onclick="location.href='/carGrid'">차량목록</span>
				<span onclick="location.href='/resform'">예약하기</span>					
				<span onclick="location.href='/myreserve'">예약확인</span>
				<span onclick="location.href='/board/list'">자유게시판</span>
				</th>
			</tr>
		</table>
	</header>
<h2 align=center>회원정보수정</h2>
<form action="update_ok" method="post">
<table width="40%" cellpadding="0" cellspacing="0" border="1" align="center">
	<tr>
		<th class = "col" width="100" height = "50">ID</th>
		<td width="300"><input type="hidden" name="id" value="${info.id}">${info.id}
		<input type="hidden" name="pass" value="${info.pass }"></td>
	</tr>
	<tr>
		<th class = "col" width="100" height = "50">e-Mail</th>
		<td><input type="email" name="email" size="30" value="${info.email }"></td>
	</tr>
	<tr>
		<th class = "col" width="100" height = "50">전화번호</th>
		<td><input type="text" name="tel" size="30" value="${info.tel }"></td>
	</tr>
	<tr>
		<th class = "col" width="100" height = "50">연령대</th>
		<td>
			<input type="radio" name="age" value="20대" <c:if test="${info.age eq '20대'}"> checked</c:if>>20대&nbsp;&nbsp;
			<input type="radio" name="age" value="30대" <c:if test="${info.age eq '30대'}"> checked</c:if>>30대&nbsp;&nbsp;
			<input type="radio" name="age" value="40대" <c:if test="${info.age eq '40대'}"> checked</c:if>>40대&nbsp;&nbsp;
			<input type="radio" name="age" value="50대" <c:if test="${info.age eq '50대'}"> checked</c:if>>50대&nbsp;&nbsp;
			<input type="radio" name="age" value="60대" <c:if test="${info.age eq '60대'}"> checked</c:if>>60대 이상
		</td>
	</tr>
	<tr>
		<th class = "col" width="100" height = "50">직업</th>
		<td><input type="text" name="job" size="30" value="${info.job }"></td>
	</tr>
	<tr>
		<th class = "col" width="100" height = "50">취미</th>
		<td>
			<input type="checkbox" name="hobby" value="등산" <c:if test="${fn:contains(info.hobby,'등산')}"> checked</c:if>>등산&nbsp;
			<input type="checkbox" name="hobby" value="여행" <c:if test="${fn:contains(info.hobby,'여행')}"> checked</c:if>>여행&nbsp;
			<input type="checkbox" name="hobby" value="캠핑" <c:if test="${fn:contains(info.hobby,'캠핑')}"> checked</c:if>>캠핑&nbsp;
			<input type="checkbox" name="hobby" value="낚시" <c:if test="${fn:contains(info.hobby,'낚시')}"> checked</c:if>>낚시&nbsp;
			<input type="checkbox" name="hobby" value="기타" <c:if test="${fn:contains(info.hobby,'기타')}"> checked</c:if>>기타
		</td>
	</tr>
</table>
	<p align=center><input type="submit" value="수정하기"></p>
</form>
	<p align=center><button onclick="confirm_del('${info.id}')">회원탈퇴</button></p>
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