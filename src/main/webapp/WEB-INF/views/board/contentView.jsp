<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
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

#pop {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -175px;
	margin-top: -100px;
	width: 350px;
	height: 100px;
	z-index: 1;
	display: none;
	border: 5px solid #000000;
	background-color: #DDD;
	text-align: center;
}

th.col{
	background: #333333;
	color: white;
}
</style>
<script>
	function viewLayer() {
		document.getElementById("pop").style.display = 'inline'
	};

	function pwCheck() {
		var pw = document.getElementById('password').value;
		var password = "${content.password}";
		if (pw == password) {
			location.href = 'modifyView?num=${content.num}';
		} else {
			alert("비밀번호가 일치하지 않습니다");
		}
	}
</script>
</head>
<body>
	<%!String id;%>
	<%
		id = (String) session.getAttribute("id");
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
	<h1 align="center">게시글 상세보기</h1>
	<table width="30%" cellpadding="0" cellspacing="0" border="1" align="center">
		<tr height="40">
			<th class = "col" width="200">글번호</th>
			<td width="200" align="center">${content.num }</td>
			<th class = "col" width="200">작성자</th>
			<td width="300" align="center">${content.writer}</td>
		</tr>
		<tr height="40">
			<th class = "col">조회수</th>
			<td  align="center">${content.readcount }</td>
			<th class = "col">작성날짜</th>
			<td  align="center">${content.reg_date }</td>
		</tr>
		<tr height="40">
			<th class = "col">제목</th>
			<td colspan="3">${content.subject }</td>
		</tr>
		<tr>
			<th class = "col">내용</th>
			<td width="300" height="300" colspan="4">${content.content }</td>
		</tr>
		<tr>
			<td colspan="4" align="center" height="50">
				<!--<input type="button" value="수정하기" onClick="location.href='modifyView?num=${content.num }'">-->
				<input type="button" value="수정하기 " onClick="viewLayer()">
				<input type="button" value="목록으로" onClick="location.href='list'">
				<input type="button" value="댓글쓰기" onClick="location.href='replyView?num=${content.num }'">
			</td>
		</tr>
	</table>
	<Div id="pop">
		<input type="hidden" name="num" value="${num}"> 
		<br/> 비밀번호를입력하세요
		<br/> 
		<input type="password" id="password" name="password" maxlength='6' value="" placeholder="비밀번호"> 
		<br/> 
		<input type="button" value="전송" onClick="pwCheck()"/>
		<input type="button" onclick="location.href='contentView?num=${content.num }'" value="취소"/>
	</Div>
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