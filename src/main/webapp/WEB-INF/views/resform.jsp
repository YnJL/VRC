<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약양식</title>
</head>
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

th.col{
	background: #333333;
	color: white;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/count.js"></script> 
<script>
function res(){
	var total = 0;
	var qty = document.getElementById('qty');
	var dday = document.getElementById('dday');
	var ppd = ${price};
	var insu = document.rform.insu.checked;
	var wifi = document.rform.fiwi.checked;
	var seat = document.rform.seat.checked;
	
	total = parseInt(qty.value) * parseInt(dday.value) * parseInt(ppd);
	
	if (insu) {
		total += 10000 * parseInt(qty.value) * parseInt(dday.value);
	}
	
	if (wifi) {
		total += 10000 * parseInt(qty.value) * parseInt(dday.value);
	}
	
	if (seat) {
		total +=  5000 * parseInt(qty.value) * parseInt(dday.value);
	}

		if (confirm("총 "+total+"원 입니다. 예약하시겠습니까?")) {
			rform.submit();
		} else {
			return;
		}
	}
</script>
<body>
<%!
	String id = null;
	String carno = "";
	String carname = "";
%>
<%
	id = (String) session.getAttribute("id");
	carno = (String) request.getAttribute("carno");
	if(id==null){%>
		<script>alert("로그인 해주세요!");
		history.back();
		</script><%
	} else {
		if(carno==null){%>
		<script>alert("차량을 선택해 주세요!");
		location.href="carList";</script><%
		} else {
			carname = request.getAttribute("carname").toString();
		}
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
			<span onclick="location.href='carGrid'">차량목록</span>
			<span onclick="location.href='resform'">예약하기</span> 
			<span onclick="location.href='myreserve'">예약확인</span> 
			<span onclick="location.href='/board/list'">자유게시판</span>
			</th>
		</tr>
	</table>
</header>
<h2 align=center>예약하기</h2>
<form action="reserve" method="post" name="rform">
<table border=1 align="center">
	<tr>
		<th class = 'col' width="100">예약자id</th>
		<td width="200"><input type="hidden" name="id" value="${id }">${id }</td>
	</tr>
	<tr>
		<th class = 'col' >예약차량</th>
		<td><input type="hidden" name="no" size="30" value="${carno }">${carname }</td>
	</tr>
	<tr>
		<th class = 'col' >예약수량</th>
		<td><input type="text" name="qty" size="5" id="qty" value="1">대&nbsp;&nbsp;
			<input type="button" onclick='qq("plus")' value='+'>
			<input type="button" onclick='qq("minus")' value='-'>		
		</td>
	</tr>
	<tr>
		<th class = 'col' >렌트일수</th>
		<td><input type="text" name="dday" size="5" id="dday" value="1">일&nbsp;&nbsp;
			<input type="button" onclick='dd("plus")' value='+'>
			<input type="button" onclick='dd("minus")' value='-'>
		</td>
	</tr>
	<tr>
		<th class = 'col' >렌트일시</th>
		<td><input type="date" name="rday"></td>
	</tr>
	<tr>
		<th class = 'col' >보험신청</th>
		<td><input type="checkbox" name="insurance" value="1" id="insu"> 10000원/일
			<input type="hidden" name="insurance" value="2"></td>
	</tr>
	<tr>
		<th class = 'col' >WIFI신청</th>
		<td><input type="checkbox" name="wifi" value="1" id="fiwi"> 10000원/일
			<input type="hidden" name="wifi" value="2"></td>
	</tr>
	<tr>
		<th class = 'col' >네비신청</th>
		<td><input type="checkbox" name="navigation" value="1"> 무료
			<input type="hidden" name="navigation" value="2"></td>
	</tr>
	<tr>
		<th class = 'col' >아동석신청</th>
		<td><input type="checkbox" name="babyseat" value="1" id="seat"> 5000원/일
			<input type="hidden" name="babyseat" value="2"></td>
	</tr>
</table>
	<p align=center><input type="button" onclick="res()" value="예약하기"></p>
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