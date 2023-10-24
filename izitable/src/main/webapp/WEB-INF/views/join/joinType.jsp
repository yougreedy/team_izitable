<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<style>
#navi {
	margin:0 auto;
	width: 100%;
	height: 100px;
	/* border: 2px solid black; */
}
#logo {
	margin: 10px;
 	float: left;
 	width: 20%;
 	/* border: 1px solid red; */
}
#keyword {
	margin: 10px;
	float: left;
	width: 50%;
	/* border: 1px solid red; */
}
#input {
	width: 100%;
}
#search {
	margin: 10px;
	float: left;
	width: 5%;
	/* border: 1px solid red; */
}
#login {
	margin: 10px;
	float: right;
	width: 15%;
	/* border: 1px solid red; */
}
</style>

<jsp:include page="../header.jsp"></jsp:include>
<!-- 회원가입 Style -->
<link rel="stylesheet" href="/asset/member/css/login.css">
</head>

<body>

<jsp:include page="../nav1.jsp"></jsp:include>

<div class="container" style="margin: 0 auto; width: 1200px; /*border: 2px solid black;*/ min-height: 700px; margin-top:100px">

<div class="tit_intro_step">
	<ul>
		<li>약관동의</li>
		<li class="current">회원유형</li>
		<li>정보입력</li>
		<li>가입완료</li>
	</ul>
</div>

<h2 class="icon1">회원유형</h2>

	
		<div style="width: 80%; margin: 10px auto">
		
		<div class="container_signin" style="margin-top: 80px; width: 900px; padding-left: 60px;" >
			<div style="width: 200px; float: left; text-align: center;">
				<div style="border: 2px solid black; width: 200px; height: 250px; text-align: center;">
					<a href="/join/user"><img src="/resources/image/normal.png" width="150px">
					<br>
					<button class="btn" style="margin-top: 10px;">일반 회원 가입</button></a>
				</div>
			</div>
			
			
			
			<div style="border: 2px solid black; width: 200px; height: 250px; float: right; text-align: center;">
				<a href="/join/shop"><img src="/resources/image/shop.png" width="150px">
				<button class="btn" style="margin-top: 10px;">매장 회원 가입</button></a>
			</div>
		</div>
		
		</div>
			
	</div>
	
	
	<form id="joinFrm" name="joinFrm" method="post" action="/join/insertMember.do">
	<input type="hidden" name="loginType" value=""/>
	<input type="hidden" name="userEmail"/>
	<input type="hidden" name="userNm"/>
	<input type="hidden" name="emailAdres"/>
	</form>
	
<jsp:include page="../footer.jsp"></jsp:include>	

</body>
</html>