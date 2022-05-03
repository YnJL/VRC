<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/CSS/member/join.css">
<body>
		<h1 align="center">회원가입</h1><hr>
		<div class="parent">
  		<div class="centered">
		<form action="join" method="post">
			<fieldset>
				<legend><h3>회원정보등록</h3></legend>
				아이디 *&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				<input type="text" name="id" required><br/><hr/>
				<br/>
				비밀번호 *&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
				<input type="password" name="pass" placeholder="비밀번호" required><br/><hr/>
				<br/>
				이메일 *&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				<input type="text" name="email"required><br/><hr/>
				<br/>
				전화번호 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
				<input type="text" name="tel"><br/><hr/>
				<br/>
				연령대 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
				<input type="text" name="age"><br/><hr/>
				<br/>
				취미 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				&nbsp; &nbsp;
				<input type="text" name="hobby"><br/><hr/>
				<br/>
				직업 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				&nbsp; &nbsp;
				<input type="text" name="job">
				<br/><hr/>
				<p style= "color: red">*표시가 되어있는 항목은 필수로 작성해야하는 항목입니다</p>
				&nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="가입하기">
				&nbsp; &nbsp; &nbsp; &nbsp; <input type="reset" value="다시작성">
				&nbsp; &nbsp; &nbsp; &nbsp; <button onclick="location='/'" >메인화면으로</button>
			</fieldset>
		</form>
		</div>
		</div>
	</body>
	<footer>
		<hr size="10" align="left" width=100% noshade="noshade"></hr>
		<small>
			&nbsp;&nbsp; 인공지능적용 애플리케이션 및 서버사이드 과정 
			&nbsp; |  &nbsp;비젼직업전문학교<br/>
			&nbsp;&nbsp; 각종문의 : wh7840@naver.com  &nbsp;| 연락처 : 010-0000-000<br/>
			&nbsp;&nbsp; Copyright &copy; 2021 All Rigths Reserved.
     	</small>
    </footer>
</body>
</html>