<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vision Rental Car</title>
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

#wrap {
	min-height: 10vh;
	position: relative;
	width: 100%;
	padding-bottom: 19px;
}

footer {
	width: 100%;
	bottom: 0;
	background: #333333;
	height: 100px;
	position: relative;
	color: white;
}

* {
	box-sizing: border-box;
}

body {
	font-family: Verdana, sans-serif;
}

.mySlides {
	display: none;
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

/* Caption text */
.text {
	color: #000000;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

* {
	margin: 0;
	padding: 0;
}

.section input[id*="slide"] {
	display: none;
}

.section .slidewrap {
	max-width: 600px;
	margin: 0 auto;
}

.section .slidelist {
	white-space: nowrap;
	font-size: 0;
	overflow: hidden;
	position: relative;
}

.section .slidelist>li {
	display: inline-block;
	vertical-align: middle;
	width: "50";
	transition: all .5s;
}

.section .slidelist>li>a {
	display: block;
	position: relative;
}

.section .slidelist>li>a img {
	width: "100";
}

.section .slidelist label {
	position: absolute;
	z-index: 10;
	top: 50%;
	transform: translateY(-50%);
	padding: 50px;
	cursor: pointer;
}

.section .slidelist .textbox {
	position: absolute;
	z-index: 1;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	line-height: 1.6;
	text-align: center;
}

.section .slidelist .textbox h3 {
	font-size: 40px;
	color: #fff;;
	transform: translateY(30px);
	transition: all .5s;
}
/*.section .slidelist .textbox p {font-size:16px;color:#fff;opacity:0;transform:translateY(30px);transition:all .5s;}*/

/* input에 체크되면 슬라이드 효과 */
.section input[id="slide01"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(0%);
}

.section input[id="slide02"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-100%);
}

.section input[id="slide03"]:checked ~ .slidewrap .slidelist>li {
	transform: translateX(-200%);
}

/* input에 체크되면 텍스트 효과 */
.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox h3
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .2s;
	text-shadow: -2px 0 #000, 0 2px #000, 2px 0 #000, 0 -2px #000;
}
/*.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}*/
.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox h3
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .2s;
	text-shadow: -2px 0 #000, 0 2px #000, 2px 0 #000, 0 -2px #000;
}
/*.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}*/
.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox h3
	{
	opacity: 1;
	transform: translateY(0);
	transition-delay: .2s;
	text-shadow: -2px 0 #000, 0 2px #000, 2px 0 #000, 0 -2px #000;
}
/*.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox p {opacity:1;transform:translateY(0);transition-delay:.4s;}*/

/* 좌,우 슬라이드 버튼 */
.slide-control>div {
	display: none;
}

.section .left {
	left: 30px;
	background: url('../resources/left.png') center center/100% no-repeat;
}

.section .right {
	right: 30px;
	background: url('../resources/right.png') center center/100% no-repeat;
}

.section input[id="slide01"]:checked ~ .slidewrap .slide-control>div:nth-child(1)
	{
	display: block;
}

.section input[id="slide02"]:checked ~ .slidewrap .slide-control>div:nth-child(2)
	{
	display: block;
}

.section input[id="slide03"]:checked ~ .slidewrap .slide-control>div:nth-child(3)
	{
	display: block;
}

/* 페이징 */
.slide-pagelist {
	text-align: center;
	padding: 10px;
}

.slide-pagelist>li {
	display: inline-block;
	vertical-align: middle;
}

.slide-pagelist>li>label {
	display: block;
	padding: 3px 10px;
	border-radius: 10px;
	background: #ccc;
	margin: 10px 5px;
	cursor: pointer;
}

.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(1)>label
	{
	background: #999;
}

.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(2)>label
	{
	background: #999;
}

.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist>li:nth-child(3)>label
	{
	background: #999;
}

* {
	padding: 0;
	margin: 0;
}

li {
	list-style: none;
}

.gallery {
	width: 1000px;
	margin: 0 auto;
	overflow: hidden;
}

.gallery h3 {
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
}

.gallery li {
	float: left;
	width: 300px;
	height: 200px;
	margin-right: 20px;
}

.gallery li:last-child {
	margin-right: 0;
}

.gallery a {
	display: block; /* 영역적용위해 사용 */
	width: 100%;
	height: 100%;
	overflow: hidden;
	position: relative; /* absolute의 기본기준은 body로 처리 - 현재 요소로 기준변경 */
}

.gallery figure {
	width: 90%;
	height: 90%;
}

.gallery figcaption {
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	position: absolute; /* 이미지와 겹치게 처리 */
	top: 0;
	left: 0;
	color: #fff;
	text-align: center;
	line-height: 200px;
	opacity: 0; /* 처음엔 안보이고 */
	transition: 0.3s;
}

.gallery a:hover figcaption, .gallery a:focus figcaption {
	/* 마우스를 올리면 보이게 처리 */
	opacity: 1;
}

/* 마우스 올렸을 때 사진 확대 작업 */
.gallery img {
	transition: 0.3s;
}

.gallery a:hover img, .gallery a:focus img { /* a태그에 마우스를 올렸을 때 */
	transform: scale(1.2);
}
</style>
</head>
<body>
	<%!String id;%>
	<%
		id = (String) session.getAttribute("id");
	%>
	<header>
		<table width=100% align="center" >
			<tr>
				<td width=77% height=100px >
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/"><img src="../resources/10.png" width="15%" height="100%" /></a>
				</td>
				<td>
					<%
						if (id == null) {
					%>
					<form action="member/login" method="post">
						<table align="center">
							<tr>
								<th align=right width=40%>ID</th>
								<td width=60% align="center"><input type="text" name="id" size=10></td>
							</tr>
							<tr>
								<th align=right>PW</th>
								<td><input type="password" name="pass" size=10></td>
							</tr>
							<tr>
								<th colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" value="로그인"> 
								<input type="button" value="회원가입" onClick="location.href='/regform'">
								</th>
							</tr>
						</table>
					</form> <%} else {%><p align=center>
						<%=id%>님 방문을 환영합니다<br />
						<br />
						<%
							if (id.equals("admin")) {
						%>
						<input type="button" value="관리메뉴" onClick="location.href='adminhome'">
						<%} else {%>
						<input type="button" value="내 정보" onClick="location.href='myinfo'">
						<%}%>
						<input type="button" value="로그아웃" onClick="location.href='member/logout'">
					</p> <%}%>
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

	<div class="section">
		<input type="radio" name="slide" id="slide01" checked>
		<input type="radio" name="slide" id="slide02"> 
		<input type="radio" name="slide" id="slide03">
		<div class="slidewrap">
			<ul class="slidelist">
				<!-- 슬라이드 영역 -->
				<li class="slideitem">
					<a><div class="textbox">
						<h3>가장 안전한 렌터카</h3>
						</div> 
						<img src="../resources/m1.jpg"></a>
				</li>
				<li class="slideitem">
					<a><div class="textbox">
						<h3>가장 저렴한 렌터카</h3>
						</div>
						<img src="../resources/m4.jpg"></a>
				</li> &nbsp;&nbsp;&nbsp;&nbsp;
				<li class="slideitem">
					<a><div class="textbox">
						<h3>Vision Rental Car</h3>
						<h3>환영합니다</h3>
						</div> 
						<img src="../resources/m5.jpg"></a>
				</li class="slideitem">

				<!-- 좌,우 슬라이드 버튼 -->
				<div class="slide-control">
					<div>
						<label for="slide03" class="left"></label>
						<label for="slide02" class="right"></label>
					</div>
					<div>
						<label for="slide01" class="left"></label> 
						<label for="slide03" class="right"></label>
					</div>
					<div>
						<label for="slide02" class="left"></label>
						<label for="slide01" class="right"></label>
					</div>
				</div>
			</ul>
			<!-- 페이징 -->
			<ul class="slide-pagelist">
				<li><label for="slide01"></label></li>
				<li><label for="slide02"></label></li>
				<li><label for="slide03"></label></li>
			</ul>
		</div>
	</div>
		<br />
		<br />
		<div class="gallery">
			<ul>
				<li>
					<a href="/cargridfilter?size=1">
						<figure>
							<img src="../resources/12.png" alt="이미지01">
							<figcaption>자세히보기</figcaption>
						</figure>
					</a>
				</li> &nbsp;&nbsp;&nbsp;&nbsp;
				<li>
					<a href="/cargridfilter?size=2">
						<figure>
							<img src="../resources/9.png" alt="이미지02">
							<figcaption>자세히보기</figcaption>
						</figure>
					</a>
				</li> &nbsp;&nbsp;&nbsp;&nbsp;
				<li>
					<a href="/cargridfilter?size=3">
						<figure>
							<img src="../resources/13.png" alt="이미지03">
							<figcaption>자세히보기</figcaption>
						</figure>
					</a>
				</li>
			</ul>
		</div>
</body>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
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
</html>
