<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="header.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#bbs_wrap {min-height: 608px;}
body {text-align: center; /*border: 2px solid black*/ margin-top: 50px;}
</style>
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body>

<jsp:include page="nav.jsp"></jsp:include>

<h2 class="icon1">로그인</h2>

<div id="content">
<div class="container">
<div id="contents">
<div id="bbs_wrap">	


<div class="login_box">
<div class="mem_login">
<div class="smartshool login">
<div class="login_inp_wrap">
<div class="login_inp">

<br><br>
		
	<form method="post" action="/login" name="frmGnrlLogin" id="frmGnrlLogin" onsubmit="return checkGnrlLogin(this)">
		<fieldset>
	
		<legend>로그인 입력폼</legend>
		<div class="form-group" style="/*border: 2px solid black;*/ margin-right: 50px">
			<label for="email">&nbsp&nbsp&nbsp&nbsp이메일:</label>
			<input type="text" id="email" name="userEmail" class="inp" title="아이디를 입력하세요." placeholder="아이디를 입력하세요.">
		</div>
	
		<div style="/*border: 2px solid black;*/ margin-right: 50px">
			<label for="pwd"> 비밀번호:</label>
			<input type="password" id="pwd" name="userPwd" class="inp" title="비밀번호를 입력하세요." placeholder="비밀번호를 입력하세요." autocomplete="off">
		</div>
		<br/>
		<div>
			<input type="checkbox" id="loginType" name="loginType" value="shop" class="inp">매장 로그인
		</div>
		
		<br>
		
			<button type="submit" class="btn" style="margin: 5px 0px; width: 200px">로그인</button>
								
		<div class="btn-cont">
			<a class="btn-kakao" href="#" data-type="login">
				<img src="http://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="200" alt="카카오 로그인 버튼"/>
			
					</div>
		</fieldset>
	</form>
			<div>
				회원 가입이 필요하신가요? <button class="btn"><a href="/siteUseAgree">회원가입</a></button>	
			</div>
			
		</div>
	</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<script>
<c:if test="${not empty loginMessage}">
	alert("${loginMessage}");
</c:if>

function checkGnrlLogin(frm) {
	if(frm.email.value == "") {
		alert("이메일을 입력해주세요");
		frm.email.focus();
		return false;
	}
	
	if(frm.pwd.value == "") {
		alert("비밀번호를 입력해주세요");
		frm.pwd.focus();
		return false;
	}
	
	$("#frmGnrlLogin");
}

$(document).ready(function() {
	//아이디 입력 창 포커스 설정
	$('#email').focus();
});

</script>

<script>
	document.querySelector("#loginType").addEventListener("click", function(){
		if(document.querySelector("#loginType").checked == true) {
			document.querySelector("#email").name="shopEmail"
			document.querySelector("#pwd").name="shopPwd"
		}
		else {
			document.querySelector("#email").name="userEmail"
			document.querySelector("#pwd").name="userPwd"
		}
	})
</script>

<form id="frmLogin" name="frmLogin" method="post" action="/kakaoLogin">
	<!-- <input type="hidden" name="userEmail" value=""/> -->
	<input type="hidden" id="userEmail" name="userEmail"/>
	<input type="hidden" name="userName"/>
</form>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script>
$(document).ready(function(){
	//카카오 로그인 버튼
	$(".btn-kakao").click(function(){
		const type = $(this).data("type");
		kakaoLogin(type);
		return false;
	});

});


//카카오 키 정보 입력
Kakao.init('0b7a004ffb2b6ac4334ce44c38e6ddaa'); // 본인 Javascript key

//카카오 SDK 초기화

Kakao.isInitialized();

//카카오로그인

function kakaoLogin(type){
	Kakao.Auth.login({
		success: function (response) {
			Kakao.API.request({
				url: '/v2/user/me',
				success:function (response) {
					
					console.log(response)
					
					$("#userEmail").val(response.id);
					//$("input[name=userEmail]").val(response.id) 이거 사용하면 입력란에 고유번호가 보임
					$("input[name=userName]").val(response.properties.nickname);
					$("#frmLogin").submit();
				},
				fail: function (error){
					console.log(error)
				},
			})
		}, fail: function (error){
			console.log(error)
		},
	})
}
</script>
	
	

<!-- 로그인 실패 메세지 -->   
 <script>
	const msg = "${msg}"; //따옴표가 있어야 작동함, 없으면 변수이름으로 인식함
	if(msg)
		alert(msg);
</script>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>