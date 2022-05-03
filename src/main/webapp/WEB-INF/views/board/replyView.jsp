<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 작성 페이지</title>
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
<h1 align=center>댓글 작성</h1>
<hr>
<table width="30%" cellpadding="0" cellspacing="0" border="1" align="center">
	<form action = "reply" method = "post">
		<input type = "hidden" name = "num" value = "${replyView.num }">
		<input type = "hidden" name = "ref" value = "${replyView.ref }">
		<input type = "hidden" name = "re_step" value = "${replyView.re_step }">
		<input type = "hidden" name = "re_level" value = "${replyView.re_level }">
	<tr height="40">
		<th class = "col" width="200">글번호</th>
		<td width="200" align="center">${replyView.num }</td>
		<th class = "col" width="200">작성날짜</th>
		<td width="300" align="center">${replyView.reg_date }</td>
	</tr>
	<tr height="40">
		<th class = "col">조회수</th>
		<td align="center">${replyView.readcount }</td>
		<th class = "col">작성자</th>
		<td align="center"><input type = "text" name = "writer" size = "30" value = ""></td>
	</tr>
	<tr height="40">
		<th class = "col">비밀번호</th>
		<td align="center"><input type = "password" name = "password" size = "20" ></td>
		<th class = "col">이메일</th>
		<td align="center"><input type = "text" name = "email" size = "30"></td>
		</tr>
	<tr height="40">
		<th class = "col">제목</th>
		<td colspan="3"><input type = "text" name = "subject" size = "90" value = " &lt; re &gt; ${replyView.subject }">
	</tr>
	<tr>
		<th class = "col">내용</th>
		<td width="300" height="300" colspan="4"><textarea name = "content" rows = "20" cols = "90" >&lt; re &gt;${replyView.content }</textarea></td>
	</tr>
	<tr>
		<td colspan = "4" align = "center" height = "50">
		<input type = "submit" value = "댓글작성">
		<input type="button" value="목록으로" onClick="location.href='list'">
		</td>
	</tr>
	</form>
</table>
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