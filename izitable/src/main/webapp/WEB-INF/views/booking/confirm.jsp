<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
<style>
join_input { margin-bottom: 30px; }
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>IZITABLE - 이지테이블 : 예약완료</title>

<jsp:include page="../header.jsp"></jsp:include>
<!-- 회원가입 Style -->
<link rel="stylesheet" href="/asset/member/css/login.css">
</head>

<body>

<jsp:include page="../nav1.jsp"></jsp:include>


<body>
<div class="container" style="margin: 0 auto; width: 1200px; /*border: 2px solid black;*/">


<h2 class="icon1">예약완료</h2>


<div class="join_finish">
	<p>"예약이 완료되었습니다. 감사합니다♥"</p>
	<div class="btn_c">
		<a href="${pageContext.request.contextPath}/user/booking/${sessionScope.user.userNo}" class="btn-lg spot">예약내역확인</a>
		<a href="/" class="btn-lg">메인으로</a>
	</div>
</div>

</div>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>