<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "org.vision.rentcar.model.*" %>   
<%@ page import = "org.vision.rentcar.dao.*" %>
<%@ page import = "org.vision.service.*" %> 
<%@ page import = "java.util.*" %> 
<%
	String pageNo = request.getParameter("pageN");
	if(pageNo == null) pageNo = "1";
	
	CGridService service = new CGridService();
	int pageNum=0;
	pageNum = Integer.parseInt(pageNo);
	CarList carlist = service.getCarView(pageNum);
	int totalPage = carlist.getTotalPageN();
	// out.println(pageNo +" / "+ totalPage);
	List<Rentcar> subList = carlist.getCarList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량목록</title>
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
img.car {
  width: 400px;
  height: 200px;
  object-fit: cover;
}

td.col{ 
	background: #333333;
	color: white;
}
th.col{
	background: #333333;
	color: white;
}


.link:hover {	cursor: pointer;}

p {text-align: center;}

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/filter.js"></script>
</head>
<body>

<%! int count = 0;
	String c="";
	String id; %>
<%
	id=(String) session.getAttribute("id");
	if(id != null) {
				id = session.getAttribute("id").toString();
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
<p>
<input type="button" onclick="location.href='carList'" value="리스트보기">
&nbsp;&nbsp;&nbsp;
<input id="filter" type="button" value="검색옵션" onclick="openfilter()">
</p>
<div id="filtertable" style="display: none">
<form action="cargridfilter" method="post" name="csearch">
<table border=1 height="50px" width="500px" align="center">
	<tr>
		<th class = 'col' height="50px" width="80px">차량분류</th>
		<td>
 			<table>
				<tr>
					<td colspan=3><input type="checkbox" name="size" value="1"/>소형&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="size" value="2"/>중형&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="size" value="3"/>대형</td>
				</tr>
		</table>
		</td>
	</tr>
	<%count=0; %>
	<tr>
		<th class = 'col' height="50px" width="80px" >제조회사</th>
		<td>
		<table>
			<tr>
				<td>
			<c:forEach items="${comp }" var="company">
				<%!String co = "";%>
				<%
				count++;
				co=(String) pageContext.findAttribute("company");
				%>
				<input type="checkbox" name="comp" value="<%=co%>"><%=co%>
				<%if (count % 3 == 0) {%>
					</tr><tr>
				<%} %>
			</c:forEach>
				</td>
			</tr>
		</table>
		</td>
</table>
<p><input type="submit" value="필터적용"></p>
</form>
</div>
<h2 align=center>차량정보</h2>
<table border="1" align="center">
	<tr>
		<c:forEach items="<%=subList %>" var="dto">
		<td>
		<table class="link" onclick="location.href='carinfo?no=${dto.no}'" align="center" height="50px" width="500px">
			<tr>
				<td align="center" colspan=4>
				<img class="car" src="resources/cars/${dto.img }" width="300px"></td>
			</tr>
			<tr align="center" height="60px" width="600px">
				<td class="col" align="center" width=50%>${dto.name }</td>
				<td class="col" align="center" width=50%>${dto.company }</td>
				<td class="col" align="center">${dto.usepeople }인승</td>
				<td class="col" align="center">${dto.price }원/일</td>
			</tr>
		</table>
		</td>
		</c:forEach>
	</tr>
	<tr>
		<th colspan=3 height="50px">
			<% for(int i=1;i<=carlist.getTotalPageN();i++){%>
			&nbsp;<a href="carGrid?pageN=<%=i%>">[<%=i%>]</a>&nbsp;
			<%} %>
		</th>
	</tr>
</table>
<p><c:if test="${id eq 'admin' }">
	<input type="button" value="차량추가" onclick="location.href='cadd'">
</c:if></p>
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