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
		<li class="current">약관동의</li>
		<li>회원유형</li>
		<li>정보입력</li>
		<li>가입완료</li>
	</ul>
</div>

<h2 class="icon1">약관동의</h2>

<p>약관 및 개인정보 수집ㆍ이용 및 제3자 제공 동의에 대한 내용을 자세히 읽어 보신 후 동의 여부를 결정하여 주시기 바랍니다.</p>

<div class="agree_box">
	<form id="agreeFrm" name="agreeFrm" action="/joinType" method="post">
		<h3 class="icon2">이용약관(필수)</h3>
		<div class="cont" tabindex="0">
			이지테이블 이용 약관 동의
		</div>
		<div class="check">
			필수(
				<input type="radio" class="vMid" id="agree01" name="agree01">
				<label for="agree01">동의</label>
				<input type="radio" class="vMid" id="agree01-1" name="agree01" checked="checked">
				<label for="agree01-1">비동의</label>
				)
		</div>
		
		<h3 class="icon2">개인정보 수집ㆍ이용(필수)</h3>
		<div class="cont" tabindex="0">
			개인정보 수집 및 이용 약관 동의
		</div>
		<div class="check">
			필수(
				<input type="radio" class="vMid" id="agree02" name="agree02">
				<label for="agree02">동의</label>
				<input type="radio" class="vMid" id="agree02-1" name="agree02" checked="checked">
				<label for="agree02-1">비동의</label>
				)
		</div>
		
		<h3 class="icon2">개인정보 제3자 제공 및 위탁에 관한 안내</h3>
		<div class="cont" tabindex="0">
			개인정보 제3자 제공 동의
		</div>
		<div class="check">
			선택(
				<input type="radio" class="vMid" id="agree03" name="agree03">
				<label for="agree03">동의</label>
				<input type="radio" class="vMid" id="agree03-1" name="agree03" checked="checked">
				<label for="agree03-1">비동의</label>
				)
		</div>
	</form>
</div>

<div class="agree_all">
	<label><input type="checkbox" id="check_all"/> 모든 약관에 동의합니다.</label>
</div>
<div class="btn-cont">
	<a href="/joinType" class="btn spot btn_next fn">다음</a>
</div>

</div>

<script>
function cnfirm() {
	if(!$('input[id=agree01]:checked').is(':checked')){
		alert('이용약관에 동의하지 않으셨습니다.');
		return false;
	}
	if(!$('input[id=agree02]:checked').is(':checked')) {
		alert('개인정보 수집ㆍ이용에 동의하지 않으셨습니다.');
		return false;
	}
	$("#agreeFrm").submit(); ///join/memberType.do로 submit
}	

$(document).ready(function() {
	$("#check_all").click(function() {
		if($(this).is(":checked")) { //this = #check_all
			$("#agree01, #agree02, #agree03").click();
		}
	});
	
	$(".btn_next").click(function() { //다음을 눌렀을때,
		cnfirm(); //function cnfirm()으로 넘어감,
		return false; //a href="/join/memberType.do"를 false
	});
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>