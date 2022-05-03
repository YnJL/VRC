<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입양식</title>
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
function reg(){
	var rform=document.rform;
	var rid=rform.id.value;
	var password=rform.password.value;
	var pascheck=rform.pascheck.value;
	if(rid=='' || password=='') {
		alert("항목을 채워주세요")
		return false;
	} else if(password==pascheck){
		rform.submit();
	} else {
		alert("비밀번호를 확인해주세요!");
		return false;
	}
}
</script>
</head>
<body>
<body>
	<%!String id; %>
	<%
		id=(String) session.getAttribute("id");
	%>
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
							<td width="200"><input type="text" name="id" size=10></td>
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

<h2 align=center>회원가입</h2>
<form action="register" method="post" name="rform" onsubmit="return reg()">
<table width="40%" cellpadding="0" cellspacing="0" border="1" align="center">
	<tr>
		<th class = "col" width="30" height = "50">ID(*)</th>
		<td width="50"><input type="text" name="id" size="18">
				<!-- 	<input type="button" onclick="idcheck()" value="중복확인"> -->
		</td>
	</tr>
	<tr>
		<th class = "col" width="50" height = "50">PW(*)</th>
		<td><input type="password" name="password" size="30"></td>
	</tr>
	<tr>
		<th class = "col" width="50" height = "50">PW check(*)</th>
		<td><input type="password" name="pascheck" size="30"></td>
	</tr>
	<tr>
		<th class = "col" width="50" height = "50" >e-Mail(*)</th>
		<td><input type="email" name="email" size="30" required></td>
	</tr>
	<tr>
		<th class = "col" width="50" height = "50">전화번호</th>
		<td><input type="text" name="tel" size="30"></td>
	</tr>
	<tr>
		<th class = "col" width="50" height = "50">연령대</th>
		<td>
			<input type="radio" name="age" value="20대">20대&nbsp;&nbsp;
			<input type="radio" name="age" value="30대">30대&nbsp;&nbsp;
			<input type="radio" name="age" value="40대">40대&nbsp;&nbsp;
			<input type="radio" name="age" value="50대">50대&nbsp;&nbsp;
			<input type="radio" name="age" value="60대">60대 이상
		</td>
	</tr>
	<tr>
		<th class = "col" width="50" height = "50">직업</th>
		<td><input type="text" name="job" size="30"></td>
	</tr>
	<tr>
		<th class = "col" width="50" height = "50">취미</th>
		<td>
			<input type="checkbox" name="hobby" value="등산">등산&nbsp;
			<input type="checkbox" name="hobby" value="여행">여행&nbsp;
			<input type="checkbox" name="hobby" value="캠핑">캠핑&nbsp;
			<input type="checkbox" name="hobby" value="낚시">낚시&nbsp;
			<input type="checkbox" name="hobby" value="기타">기타
		</td>
	</tr>
	<tr>
		<th colspan=2>(*)표시는 필수 입력 항목입니다.
	</tr>
</table>
	<p align=center><input type="submit" value="가입하기"></p>
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