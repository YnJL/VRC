<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원출력</title>
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
</head>
<body>
<%!String id; %>
<% id=(String) session.getAttribute("id"); %>
<c:if test="${id ne 'admin' }">
	<script>
	alert("관리자만 접속할 수 있는 페이지 입니다");
	document.location.href='home';
	</script>
</c:if>
			<script>
			function confirm_del(mi){
				if(confirm("삭제하시겠습니까?")){
					return location.href='mdelete?id='+mi;
				} else {
					return;
				}
			}
			</script>
				<header>
		<table width=100% align = "center">
			<tr>
				<td width=77% height=100px>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href = "/"><img src="../resources/admin.png" width="15%" height="100%"/></a>
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
<h2 align=center>회원리스트</h2>
<table border=1 align="center">
	<tr>
		<th class = "col" width="13%">ID</th>
		<th class = "col" width="17%">e-Mail</th>
		<th class = "col" width="15%">전화번호</th>
		<th class = "col" width="15%">연령대</th>
		<th class = "col" width="13%">직업</th>
		<th class = "col" width="17%">취미</th>
		<th class = "col" >삭제</th>
	</tr>
	<c:forEach items="${mlist }" var="dto"><c:if test="${dto.id ne 'admin'}">

	<tr>
		<td align="center">${dto.id }</td>
		<td align="center">${dto.email }</td>
		<td align="center">${dto.tel }</td>
		<td align="center">${dto.age }대</td>
		<td align="center">${dto.job }</td>
		<td align="center">${dto.hobby }</td>
		<td align="center"><button onclick="confirm_del('${dto.id}')">삭제</button></td>
	</tr>
	</c:if></c:forEach>
</table>
<div align=center><input type="button" value="회원가입(Batch)" onclick="location.href='member/batchForm'"></div>
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