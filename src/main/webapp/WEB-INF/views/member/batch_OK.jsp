<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입(Batch)</title>
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

alert('Batch를 이용한 가입이 완료되었습니다.');

</script>
</head>
<body>
	<%!String id; %>
	<%id=(String) session.getAttribute("id");%>
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
<h1 align = "center">회원가입(Batch)처리 페이지</h1>
<form action="joinBatch" method = "post">
	<table width="40%" cellpadding="0" cellspacing="0" border="1" align="center">
		<tr>
			<th class = "col" width="110" height = "50">아이디</th>
			<th class = "col" width="110" height = "50">비밀번호</th>
			<th class = "col" width="110" height = "50">이메일</th>
			<th class = "col" width="110" height = "50">전화번호</th>
			<th class = "col" width="110" height = "50">연령대</th>
			<th class = "col" width="110" height = "50">취미</th>
			<th class = "col" width="110" height = "50">직업</th>
		</tr>
		<tr>
			<td colspan="7">
			<div align = "center"> 순서에 맞게 콤마로 구분해 작성하시오. </div><br>
			<div align = "center">예시 : abc1234,1234!,abc1234@naver.com,010-1111-2222,30대,게임,개발자</div>
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<textarea rows = "10" cols = "108" name = "batchData"></textarea>
		</tr>
		<tr>
			<td colspan = "8" align = "center" >
				<input type = "submit" value="전송">

			</td>
		</tr>
	
	</table>


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