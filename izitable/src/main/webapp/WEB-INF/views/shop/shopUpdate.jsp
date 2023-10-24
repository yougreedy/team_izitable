<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<jsp:include page="../header.jsp"></jsp:include>
<style>
#bbs_wrap {min-height: 608px; margin-top: 50px;}
.inline {display: inline-block; margin: 0 10;}
input {width:500px;'}

</style>
</head>

<body>
<jsp:include page="../nav2.jsp"></jsp:include>

<div id="content">
<div class="container" style="margin: 0 auto; width: 1200px;">
<div id="contents">
<div id="bbs_wrap">	

		<div style="/*border: 2px solid black;*/ text-align: center;">
		
			<button class="btn" style="margin-right: 30px;"><a href="/shop/booking/${sessionScope.shop.shopNo}"><h3>예약 관리</h3></a></button>
			<button class="btn" style="margin-right: 30px;"><a href="/shop/setting/${sessionScope.shop.shopNo}"><h3>매장 설정</h3></a></button>
			<button class="btn btn-lg"><a href="/shop/update/${sessionScope.shop.shopNo}"><h3>정보 변경</h3></a></button>

		</div>
		
		<br>
		
		<form method="post" enctype="multipart/form-data">
			<div style="/*border: 2px solid black;*/ margin: 0 auto; width: 1100px; margin-top: 50px;">
			
				<div class="inline"  style="margin: 0 auto; ">
					<img class="shop_img" src="/upload/${item.imgFilename}" width="500px" height="500px" style="margin: 100px auto; padding-bottom:0px;"><br>
					<label>&nbsp;&nbsp;&nbsp;&nbsp;</label>
				</div>
				

				<div class="inline">
					<div>
						<label>- 이메일</label><br>
						<input type="text" name="shopEmail" value="${item.shopEmail}">
					</div>
					
					<div>
						<label>- 매장명</label><br>
						<input type="text" name="compName" value="${item.compName}">
					</div>
					
					<div>
						<label>- 매장 번호(사업자번호)</label><br>
						<input type="text" name="compNum" value="${item.compNum}">
					</div>
					
					<div>
						<label>- 매장 사장님명</label><br>
						<input type="text" name="compCeo" value="${item.compCeo}">
					</div>
					
					
					<div>
						<label>- 매장 전화번호</label><br>
						<input type="text" name="compCall" value="${item.compCall}">
					</div>
					
					<div>
						<label>- 매장 구주소</label><br>
						<input type="text" name="compAddr1" value="${item.compAddr1}">
					</div>
					
					<div>
						<label>- 매장 신주소(도로명주소)</label><br>
						<input type="text" name="compAddr2" value="${item.compAddr2}">
					</div>
					
					<div>
						<label>- 매장 소개</label><br>
						<input type="text" name="compIntro" value="${item.compIntro}">
					</div>
					
					<div>
					
					<div>
						<label>- 매장 이미지</label><br>					
						<div>
							<label>파일:</label>
							<input name="uploadFile" type="file" id="imageInput">
						</div>
								
						<div id="imagePreview">
							<img id="previewImage" alt="미리보기" src="/resources/image/profile.png" width="100" height="100" style="padding-bottom:0px;">
						</div>
					</div>
					</div>
					
					<br>
					
					<div>
						<button type="submit" id="update" class="btn btn-mod" style="float: right;">변경 완료</button>
					</div>
				</div>	
				
			</div>
		</form>
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
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
