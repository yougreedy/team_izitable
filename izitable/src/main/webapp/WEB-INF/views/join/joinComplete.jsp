<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
<style>
join_input { margin-bottom: 30px; }
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>IZITABLE - 이지테이블 : 회원가입</title>

<jsp:include page="../header.jsp"></jsp:include>
<!-- 회원가입 Style -->
<link rel="stylesheet" href="/asset/member/css/login.css">
</head>

<body>

<jsp:include page="../nav1.jsp"></jsp:include>


<body>
<div class="container" style="margin: 0 auto; width: 1200px; /*border: 2px solid black;*/ min-height: 700px; margin-top:100px">

<div class="tit_intro_step">
	<ul>
		<li>약관동의</li>
		<li>회원유형</li>
		<li>정보입력</li>
		<li class="current">가입완료</li>
	</ul>
</div>

<h2 class="icon1">가입완료</h2>
<p class="mB20">회원가입이 완료되었습니다. 감사합니다</p>

<div class="join_finish">
	<p>"회원가입이 완료되었습니다. <em>로그인 후</em> 사용해 주시기 바랍니다."</p>
	<div class="btn_c">
		<a href="/login.do" class="btn-lg spot">로그인</a>
		<a href="/" class="btn-lg">메인으로</a>
	</div>
</div>

</div>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>