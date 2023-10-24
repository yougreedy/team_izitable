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

<div class="container" style="margin: 0 auto; width: 1200px; /*border: 2px solid black;*/ min-height: 700px; margin-top:100px">

<div class="tit_intro_step">
	<ul>
		<li>약관동의</li>
		<li>회원유형</li>
		<li class="current">정보입력</li>
		<li>가입완료</li>
	</ul>
</div>

<h2 class="icon1">정보입력</h2>
		<!-- <form method="post" action="add"> --> <!-- jsp는 페이지 단위, 어쩔 수 없이 form tag를 받아줄 페이지 필요 -->
		<!-- <form method="post" name="signup_form"> --> <!-- jsp는 페이지 단위, 어쩔 수 없이 form tag를 받아줄 페이지 필요 -->
		<form method="post" action="/join" onsubmit="return regist();">
			<input type="hidden" id="idCheckAt" value="N"/>
			
			<div>
				<div class="join_input">
					<label>이메일</label><br>
					<input type="text" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요" pattern="[^ @]*@[^ @]*">
					<a href="#" id="btn-id-check" class="btn-sm spot fn" title="중복확인(새창열림)"><span>중복확인</span></a>
					<!-- <button class="btn">이메일 인증</button> -->
				</div>
				
				<div class="join_input">
					<label>인증번호 입력</label><br>
					<input type="text" id="userEmailcheck" name="userEmailcheck" palceholder="인증번호를 입력해주세요">
					<a href="#" id="btn-email-check" class="btn-sm spot fn" title="인증번호(새창열림)"><span>인증</span></a>
				</div>
				
				<div class="join_input">
					<label>이름</label><br>
					<input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요">
				</div>
				
				<div class="join_input">
					<label>휴대폰 번호</label><br>
					<input type="text" id="userPhone" name="userPhone" placeholder="숫자만 입력해주세요">
				</div>
				
				<!--
				<div>
					<label>휴대폰 번호 인증</label>
					<input type="hidden" name="userPhoneCert">
				</div>
				-->
				
				<div class="join_input">
					<label>비밀번호</label><br>
					<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력해주세요">
				</div>
				
				<div class="join_input">
					<label>비밀번호 확인</label><br>
					<input type="password" id="passwd_confirm" name="passwd_confirm" placeholder="비밀번호를 다시 한 번 입력해주세요">
				</div>
				
				영문, 숫자, 특수문자 등 3가지 사용시 8자 이상, 2가지 사용시 10자리 이상으로 설정해주세요.

				<div class="join_input">
					<button type="submit" id="join" class="btn">등록</button>
					<a href="/joinType"><button type="button" class="btn">뒤로</button></a>
				</div>
				
			</div>
		</form>
	</div>

<script>
$(document).ready(function() {
	//아이디 중복 검사
	$("#btn-id-check").click(function() {
		var userEmail = $("#userEmail").val();
		
		if(userEmail) {
			fetch("/join/duplicateCheck?email=" + userEmail, {
				method : "GET",								
			})
			.then(resp => resp.json())
			.then(data => {
					/*alert(result.data.totalCount);*/
					if(data.successYn == "Y") {
						alert("사용가능한 ID입니다. 인증번호가 전송되었습니다.");
						$("#idCheckAt").val("Y");
					}else{
						alert(data.message);
						$("#idCheckAt").val("N");
					}
				}).catch(()=> {
					alert("error");
				});
		}else{
			alert("ID를 입력해주세요.");
		}
		
		return false;
	});
	
	
	/*
	//이메일
	$("#domain").change(function() {
		let domain = $(this).val(); //this=#domain
		
		$("#emailDomain").val(domain);	
	});
	*/
	
	
});

//validation 체크
function regist(){
	//아이디 중복 검사 체크
	if($("#idCheckAt").val() != "Y") {
		alert("이메일 중복 검사를 해주세요.");
		return false;
	}else if(!$("#userEmail").val()){
		alert("이메일을 입력해주세요.");
		return false;
	}else if(!$("#userName").val()){
		alert("이름을 입력해주세요.");
		return false;	
	}else if(!$("#userPhone").val()){
		alert("휴대폰 번호를 입력해주세요.");
		return false;
	}else if(!$("#userPwd").val()){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else if(!$("#passwd_confirm").val()){
		alert("비밀번호 확인을 입력해주세요.");
		return false;
	}else if($("#userPwd").val() != $("#passwd_confirm").val()){
		alert("비밀번호와 비밀번호 확인 정보가 다릅니다.");
		return false;
	}
	
	if($("#userPwd").val()) {
		var pw = $("#userPwd").val(),
			message = "",
			//대소문자, 특수문자, 숫자는 8자리 이상 정규형
			passwordRules1 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,30}$/,
			//대소문자, 숫자는 10자리 이상 정규형
			passwordRules2 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,30}$/,
			result = false;
			
		if(pw.length < 10) {
			if(!passwordRules1.test(pw)) {
				message = "영문, 숫자, 특수문자 등 3가지 사용시 8자 이상, 2가지 사용시 10자리 이상";
			}else{
				result = true;
			}
		}
		
		if(!passwordRules2.test(pw) && !result) {
			message = "영문, 숫자, 특수문자 등 3가지 사용시 8자 이상, 2가지 사용시 10자리 이상";
		}else{
			result = true;
		}
		
		if(message.length > 0) {
			alert(message + " 입력해주세요.");
			return false;
		}
	}			
}
</script>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>