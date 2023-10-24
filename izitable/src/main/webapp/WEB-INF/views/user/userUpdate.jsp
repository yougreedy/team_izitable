<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<jsp:include page="../header.jsp"></jsp:include>
<style>
#bbs_wrap {min-height: 608px; margin-top: 50px;}
</style>
</head>

<body>
<jsp:include page="../nav2.jsp"></jsp:include>

<div id="content">
<div class="container" style="margin: 0 auto; width: 1200px;">
<div id="contents">
<div id="bbs_wrap">	
		<div style="/*border: 2px solid black;*/ text-align: center;">
		
			<button class="btn" style="margin-right: 30px;"><a href="/user/booking/${sessionScope.user.userNo}"><h3>예약 목록</h3></a></button>
			<button class="btn btn-lg"><a href="/user/update/${sessionScope.user.userNo}"><h3>정보 변경</h3></a></button>

		</div>
		
	<div style="/*border: 2px solid black;*/ margin: 0 auto; width: 300px; margin-top: 50px;">
	
		<div>
			<h3>회원 정보 변경</h3>
		</div>
		
		<br>
		
		<form method="post">
			<div>
			
				<div>
					<label>- 이메일</label><br>
					<input type="text" name="userEmail" value="${item.userEmail}">
				</div>
				
				<div>
					<label>- 이름</label><br>
					<input type="text" name="userName" value="${item.userName}">
				</div>
				
				<div>
					<label>- 휴대폰 번호</label><br>
					<input type="text" name="userPhone" value="${item.userPhone}">
				</div>
				
				<!-- 
				<div>
					<label>휴대폰 번호 인증</label><br>
					<input type="hidden" name="userPhoneCert">
				</div>
				 -->
				
				<br>
	
				<div>
					<button type="submit" id="update" class="btn btn-mod">변경 완료</button>
				</div>

			</div>
		</form>
		
	</div>	
	
</div>
</div>
</div>
</div>

<script>
$(document).ready(function(){
	//변경
	$(".btn-mod").click(function(){
		alert('변경이 완료되었습니다');
	});
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
