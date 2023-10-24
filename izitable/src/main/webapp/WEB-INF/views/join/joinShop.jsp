<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>

<head>
<style>
join_input { margin-bottom: 30px; }
</style>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>IZITABLE - 이지테이블 : 회원가입</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3deea4e437afacaccf5d342a0a21b891&libraries=services"></script>

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
		<form method="post" action="/join" onsubmit="return regist();" enctype="multipart/form-data">
			<input type="hidden" id="idCheckAt" value="N"/>
			
			<div>
				<div class="join_input">
					<label>이메일</label><br>
					<input type="text" id="shopEmail" name="shopEmail" placeholder="이메일을 입력해주세요" pattern="[^ @]*@[^ @]*">
					<a href="#" id="btn-id-check" class="btn-sm spot fn" title="중복확인(새창열림)"><span>중복확인</span></a>
					<!-- <button class="btn">이메일 인증</button> -->
				</div>
				
				<div class="join_input">
					<label>매장 이름</label><br>
					<input type="text" id="compName" name="compName" placeholder="매장 이름을 입력해주세요">
				</div>
				
				<div class="join_input">
					<label>사업자 번호</label><br>
					<input type="text" id="compNum" name="compNum" placeholder="숫자만 입력해주세요">
				</div>
				
				<div class="join_input">
					<label>매장 사장님명</label><br>
					<input type="text" id="compCeo" name="compCeo" placeholder="매장 사장님명을 입력해주세요">
				</div>
				
				<div class="join_input">
					<label>매장 전화번호</label><br>
					<input type="text" id="compCall" name="compCall" placeholder="숫자만 입력해주세요">
				</div>
				
				<div class="join_input">
					<label>매장 주소</label><br>
					<input type="text" id="postcode" placeholder="우편번호">
					<input type="button" id="postcodebutton"onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="roadAddress" name="compAddr2" placeholder="도로명주소">
					<input type="text" id="jibunAddress" name="compAddr1" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="detailAddress" name="detailAddr" placeholder="상세주소">
					<input type="text" id="extraAddress" placeholder="참고항목">
					<!-- 위도 -->
				    <input type="hidden" id="latInput" name="latitude" class="form-control rounded-0" value="" />
				    <!-- 경도 -->
				    <input type="hidden" id="lngInput" name="longitude" class="form-control rounded-0" value="" />
<!-- 				    <button type="button" id="showLocationButton">위치 확인하기</button> -->
				</div>
				
				
				
				<div class="join_input">
					<label>매장 카테고리</label><br>
					<select name="categoryNo">
						<option value="1">한식</option>
						<option value="2">일식</option>
						<option value="3">중식</option>
						<option value="4">양식</option>
						<option value="5">디저트</option>
					</select>
				</div>
				
				<div class="join_input">
					<label>비밀번호</label><br>
					<input type="password" id="shopPwd" name="shopPwd" placeholder="비밀번호를 입력해주세요">
				</div>
				
				<div class="join_input">
					<label>비밀번호 확인</label><br>
					<input type="password" id="passwd_confirm" name="passwd_confirm" placeholder="비밀번호를 다시 한 번 입력해주세요">
				</div>
				
				<p>영문, 숫자, 특수문자 등 3가지 사용시 8자 이상, 2가지 사용시 10자리 이상으로 설정해주세요.</p>
				<br>
				
				
				<!-- 회원사진 등록 -->
				<form>
					<div class="join_photo">
						
					<p>매장이미지 등록</p>						
						<div>
							<label>파일:</label>
							<input name="uploadFile" type="file" id="imageInput">
						</div>
						
						<!-- 
						<div>
							<button type="button" id="previewbtn" class="btn">미리보기</button>
						</div>
						 -->
						
						<div id="imagePreview">
							<img id="previewImage" alt="미리보기" src="/resources/image/profile.png" width="100" height="100">
						</div>
					</div>
					<hr>
				</form>
				
	
				<div class="join_input">
					<button type="submit" id="join" class="btn">등록</button>
					<a href="/joinType"><button type="button" class="btn">뒤로</button></a>
				</div>
				

				
			</div>
		</form>
	</div>
	
<!-- 다음 카카오 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 우편번호 서비스(https://postcode.map.daum.net/guide) -->
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                
                
                //우편번호 검색 버튼 클릭 시 위도 경도 좌표 가져오기
                var address = document.getElementById('roadAddress').value; // 입력된 주소 가져오기
		        console.log(address);
		
		        // 주소를 좌표로 변환하는 Geocoder 객체 생성
		        var geocoder = new kakao.maps.services.Geocoder();
		
		        // 주소를 좌표로 변환
		        geocoder.addressSearch(address, function (result, status) {
		            if (status === kakao.maps.services.Status.OK) {
		                var latitude = result[0].y; // 위도
		                var longitude = result[0].x; // 경도
		                
		                console.log(latitude);
		                console.log(longitude);
		
		                // 위도와 경도를 숨겨진 입력 필드에 채워 넣기
		                document.getElementById('latInput').value = latitude;
		                document.getElementById('lngInput').value = longitude;
		                alert('위치 확인 되었습니다.');
		            } else {
		                alert('주소를 찾을 수 없습니다.');
					}
			    });
            }
        }).open();
    }
</script>

<script>
$(document).ready(function() {
	//아이디 중복 검사
	$("#btn-id-check").click(function() {
		var shopEmail = $("#shopEmail").val();
		
		if(shopEmail) {
			$.ajax({
				url : "/join/duplicateCheck?email=" + shopEmail,
				type : "GET",
				//contentType: "application/json",
 				dataType : "json",				
				success : function(data/*result*/) {
					/*alert(result.data.totalCount);*/
					if(data.successYn == "Y") {
						alert("사용가능한 ID입니다. 인증번호가 전송되었습니다.");
						$("#idCheckAt").val("Y");
					}else{
						alert(data.message);
						$("#idCheckAt").val("N");
					}
				}, error : function() {
					alert("error");
				}
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

//매장 이미지 등록할 때 미리보기
$(document).ready(function() {
    $("#imageInput").change(function() {
        var input = document.getElementById("imageInput");
        var preview = document.getElementById("previewImage");

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                preview.src = e.target.result;
                $("#imagePreview").show(); // 미리 보기 영역 표시
            };

            reader.readAsDataURL(input.files[0]);
        } else {
            alert("파일을 선택해주세요.");
        }
    });

    // 나머지 코드 (아이디 중복 검사 및 유효성 검사)는 그대로 유지
});

//validation 체크
function regist(){
	//아이디 중복 검사 체크
	if($("#idCheckAt").val() != "Y") {
		alert("이메일 중복 검사를 해주세요.");
		return false;
	}else if(!$("#shopEmail").val()){
		alert("이메일을 입력해주세요.");
		return false;
	}else if(!$("#compName").val()){
		alert("매장 이름을 입력해주세요.");
		return false;
	}else if(!$("#compNum").val()){
		alert("사업자 번호를 입력해주세요.");
		return false;
	}else if(!$("#compCeo").val()){
		alert("매장 사장님명을 입력해주세요.");
		return false;
	}else if(!$("#compCall").val()){
		alert("매장 전화번호를 입력해주세요.");
		return false;
	}else if(!$("#roadAddress").val()){
		alert("매장 주소를 입력해주세요.");
		return false;
	}else if(!$("#latInput").val()){
		alert("위치 확인을 해주세요.");
		return false;
	}else if(!$("#shopPwd").val()){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else if(!$("#passwd_confirm").val()){
		alert("비밀번호 확인을 입력해주세요.");
		return false;
	}else if($("#shopPwd").val() != $("#passwd_confirm").val()){
		alert("비밀번호와 비밀번호 확인 정보가 다릅니다.");
		return false;
	}
	
	if($("#shopPwd").val()) {
		var pw = $("#shopPwd").val(),
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