<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "org.vision.rentcar.model.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "org.vision.rentcar.dao.*" %>
<%@ page import = "org.vision.rentcar.boardservice.*" %> 
<%
 	// 페이징 처리를 위한 작업
 String pageNumberStr = request.getParameter("xpage");
 RBListService service = new RBListService();
 int pageNumber = 1;

 if (pageNumberStr != null) {
 	pageNumber = Integer.parseInt(pageNumberStr);
 }

 MessageListView viewData = service.getMessageListView(pageNumber);
 int totalPages = viewData.getPageTotalCount();
 if (pageNumberStr == null)
 	pageNumberStr = "1";

 List<RentBoard> subList = viewData.getMessageList();
 %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>자유게시판</title>
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
	<%!String id;%>
	<%
		id = (String) session.getAttribute("id");
	%>
	<header>
		<table width=100% align = "center">
			<tr>
				<td width=77% height=100px>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href = "/"><img src="../resources/10.png" width="15%" height="100%"/></a>
				</td>
				<td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<%
						if (id == null) {
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
								<tr><th colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" value="로그인">
								<input type="button" value="회원가입" onClick="location.href='/regform'">
					</table>
				</form>
			
			<%
							} else {
						%><p align=center>
				<%=id%>님 방문을 환영합니다<br/><br/>
			<%
				if (id.equals("admin")) {
			%>
				<input type="button" value="관리메뉴" onClick="location.href='/adminhome'">
			<%
				} else {
			%>
				<input type="button" value="내 정보" onClick="location.href='/myinfo'">
			<%
				}
			%>
				<input type="button" value="로그아웃" onClick="location.href='/member/logout'"></p>
			<%
				}
			%>
		</td>
	</tr>
	<tr><th colspan=2>
		<span onclick="location.href='/carGrid'">차량목록</span>
		<span onclick="location.href='/resform'">예약하기</span>
		<span onclick="location.href='/myreserve'">예약확인</span>
		<span onclick="location.href='/board/list'">자유게시판</span>
		</th>
	</tr>
</table>
</header>

	<br/>
	<table width = "60%" cellpadding = "0" cellspacing = "0" border = "1" align = "center">
		<tr>
			<th class = "col" width = "50" height = "50">번호</th>
			<th class = "col" width = "100" >작성자</th>
			<th class = "col" width = "200" >이메일</th>
			<th class = "col" width = "700">제목</th>
			<th class = "col" width = "100">게시일자</th>
			<th class = "col" width = "50">조회수</th>
		</tr>
			<c:forEach items = "<%=subList%>" var = "dto">
		<tr>
			<td align = "center" height = "40">${dto.num }</td>
			<td align = "center">${dto.writer }</td>
			<td align = "center">${dto.email }</td>
			<td><c:forEach begin = "1" end = "${dto.re_level }">-</c:forEach>
			<a href = "contentView?num=${dto.num }">${dto.subject }</a></td>
			<td align = "center">${dto.reg_date }</td>
			<td align = "center">${dto.readcount}</td>
		</tr>
			</c:forEach>
		<tr>
			<td colspan = "8" align="center" height = "50" > 
			<input type="button" value="글쓰기" onClick="location.href='writeView'">
			</td>
		</tr>
	</table>
	<div align="center">
	<%
		for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
	%>
		<a href="list?xpage=<%=i%>">[<%=i%>]</a>
	<%
		}
	%>
	</div>
	<hr>
</body>
<footer>
	<hr size="10" align="left" width=100% noshade="noshade"></hr>
	<small>
		&nbsp;&nbsp; 인공지능적용 애플리케이션 및 서버사이드 과정 
		&nbsp; | &nbsp;비젼직업전문학교<br/>
 		&nbsp;&nbsp; 각종문의 : hgd1234@naver.com  &nbsp;| 연락처 : 010-0000-000<br/>
 		&nbsp;&nbsp; Copyright &copy; 2022 All Rigths Reserved.
		<div style="POSITION: fixed; MARGIN-LEFT: 680px; TOP: 850px; LEFT: 55%;z-index:9999;">
			<div class="">
				<a href = "https://open.kakao.com/o/syZiOZ5d">
				<img src="../resources/kakao.png" align = "right"/></a>
			</div>
		</div>
	</small>
</footer>
</html>