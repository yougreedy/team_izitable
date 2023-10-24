<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3deea4e437afacaccf5d342a0a21b891&libraries=services"></script>
<!-- 내 위치 가져오기 -->
<script src="../../../resources/js/kakaomap/pos.js"></script>   
<title>IZITABLE - 이지테이블</title>

<jsp:include page="../header.jsp"></jsp:include>
<style>
#bbs_wrap {min-height: 608px;}
body {
	margin-top: 50px;
	margin-bottom: -50px;
}
.shopList {
	border: 2px solid #fb5849; 
	/*border-radius:2%;*/ 
	width:479px; text-align: 
	left; margin-bottom: 5px; 
	/*background-color: #fb5849*/; 
	color: #fb5849;"
}
.focus {
	background-color: #fb5849;
	color: white;
}
</style>
</head>

<body>
<jsp:include page="../nav.jsp"></jsp:include>

<div id="content">
<div class="container" style="margin: 0 auto; width: 1200px; text-align: center">
<div id="contents">
<div id="bbs_wrap" >
		
<form method="post" action="/list" style="margin: 10px;">
<select id="si" name="si" style="width: 100px">
	<option value="">시</option>
	<!-- <option value="서울">서울</option> -->
	<option value="대전">대전</option>
</select>
<script>
	$('#si').on('change', function(){
		$('#gu').val('');
		$('#dong').val('');
		this.form.submit();
	});
</script>
<script>
	if('${si}' != "") { document.querySelector('[name="si"]').value = '${si}'; }
</script>

<select id="gu" name="gu" style="width: 100px">
	<option value="">구</option>
	<!-- <option value="동구">동구</option>
	<option value="서구">서구</option>
	<option value="대덕구">대덕구</option> -->
	<c:forEach var="item" items="${gulist}">
		<option value="${item.gu}">${item.gu}</option>
	</c:forEach>
</select>
<script>
	$('#gu').on('change', function(){
		$('#dong').val('');
		this.form.submit();
	});
</script>
<script>
	if('${gu}' != "") { document.querySelector('[name="gu"]').value = '${gu}'; }
</script>

<select id="dong" name="dong" onchange="this.form.submit()" style="width: 100px">
	<option value="">동</option>
	<!-- <option value="가양동">가양동</option>
	<option value="가양동">가양동</option>
	<option value="비래동">비래동</option> -->
	<c:forEach var="item" items="${donglist}">
		<option value="${item.dong}">${item.dong}</option>
	</c:forEach>
</select>
<script>
	if('${dong}' != "") { document.querySelector('[name="dong"]').value = '${dong}'; }
</script>
<select id="categoryNo" name="categoryNo" onchange="this.form.submit()" style="width: 100px">
	<option value="0">카테고리</option>
	<option value="1">한식</option>
	<option value="2">일식</option>
	<option value="3">중식</option>
	<option value="4">양식</option>
	<option value="5">디저트</option>
</select>
<script type="text/javascript">
	if('${categoryNo}' != "") { document.querySelector('[name="categoryNo"]').value = '${categoryNo}'; }
</script>
<!-- <button onclick="applyFn()">적용</button> -->
<!-- <button type="submit" class="btn">적용</button> -->

<button type="button" id="getMyPositionBtn" onclick="getCurrentPosBtn()" class="btn" ><img src="/resources/image/mylocation.png" width="20px" height="20px"> 내 위치</button>

</form>



<div id="map" style="width:500px;height:500px; margin: 0 auto; display: inline-block;"></div>
<!-- 카카오 지도 생성 -->
<script src="../../../resources/js/kakaomap/map.js"></script>

<div style="/*border: 2px solid black;*/ width:500px; height:500px; display: inline-block; margin-left: 10px; overflow: auto">
	<c:forEach var="item" items="${list}">
		<div id="${item.shopNo}" tabindex="-1" class="shopList">
			
			<c:choose>
				<c:when test="${item.imgFilename == null || item.imgFilename == \"\"}">
					<div style="display: inline-block; /*border: 2px solid black;*/"><img src="/resources/image/shop.png" width="100" height="100"></div>
				</c:when>
				<c:otherwise> 
					<div style="display: inline-block; /*border: 2px solid black;*/"><img src="/upload/${item.imgFilename}" width="100" height="100"></div>
				</c:otherwise>
			</c:choose>
			
			<!-- 
			<c:if test="${item.imgFilename != null || item.imgFilename != \"\"}"> 
				<div style="display: inline-block; /*border: 2px solid black;*/"><img src="/upload/${item.imgFilename}" width="100" height="100"></div>
			</c:if>
			<c:if test="${item.imgFilename == null || item.imgFilename == \"\"}">
				<div style="display: inline-block; /*border: 2px solid black;*/"><img src="/resources/image/shop.png" width="100" height="100"></div>
			</c:if>
			 -->
			 
			<div style="display: inline-block; /*border: 2px solid black;*/ width:320px; height:100px; vertical-align: middle;">
				<ul>
					<li>매장명 : ${item.compName}</li>
					<li>전화번호 : ${item.compCall}</li>
					<li>소개 : ${item.compIntro}</li>
					<%-- <li>카테고리 : ${item.categoryNo}</li> --%>
				</ul>
			</div>
			<div style="text-align: left"><a href="/booking/shop/${item.shopNo}" class="btn">예약하기</a></div>
		</div>
	</c:forEach>
	<c:if test="${list.size() < 1}" >
		해당하는 음식점이 없습니다.
	</c:if>
</div>


<!-- 카테고리에 따른 지도 중심 이동 -->
<script>
/* 주소-좌표 변환 */
	
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
//console.log(cityval)
/*
geocoder.addressSearch(sival + " " + guval + " " + dongval, function(result, status) {

// 정상적으로 검색이 완료됐으면 
if (status === kakao.maps.services.Status.OK) {
	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
}

//지도의 중심을 결과값으로 받은 위치로 이동시킵니다
map.setCenter(coords);
});
*/
</script>
	    
<!-- 카테고리에 따른 마커 생성 -->
<c:forEach var="item" items="${list}">
<%-- <p>위도 : ${item.latitude}, 경도 : ${item.longitude}</p> --%>

<script>
//var lat = [];
//var lng = [];

//alert(`${item.latitude}, ${item.longitude}`);



//마커 속성
var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
    MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
    OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
    OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
    OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
    OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
    OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
    OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
    //SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
    SPRITE_MARKER_URL = 'http://localhost:8083/resources/image/markers_sprites_mod.png', // 수정된 스프라이트 마커 이미지 URL
    SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
    SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
    SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
    markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
    overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
    overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
    spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기
//마커 속성
    
    
//마커의 위치
var positions = [
	{
        title: `${item.compName}`, 
        latlng: new kakao.maps.LatLng(${item.latitude}, ${item.longitude})
    }
],
selectedMarker = null; // 클릭한 마커를 담을 변수


//마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 


//지도 위에 마커를 표시합니다
for (var i = 0; i < positions.length; i ++) {
	var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
    originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
    overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
    normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
    clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
    overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
	
	// 마커를 생성하고 지도위에 표시합니다
    addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
}

function addMarker(position, normalOrigin, overOrigin, clickOrigin) {
	
	// 마커 이미지의 이미지 크기 입니다
    //var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    //var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
    
    // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
    var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
    overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
    clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        //image : markerImage // 마커 이미지 
        image: normalImage
    });
    
 	// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
    marker.normalImage = normalImage;
    
 	// 마커에 mouseover 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseover', function() {

        // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 오버 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(overImage);
        }
    });

    // 마커에 mouseout 이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'mouseout', function() {

        // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 기본 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {
            marker.setImage(normalImage);
        }
    });
    
 	// 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
    	let sDiv = document.getElementById(`${item.shopNo}`)
    	//$(sDiv).css('background-color', 'black').focus();
    	if ( $(sDiv).hasClass('focus') ) return;
    	$('.focus').removeClass('focus')
    	$(sDiv).addClass('focus').focus();
    	//alert("매장번호" + ${item.shopNo});
    	
    	
    	// 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 클릭 이미지로 변경합니다
        if (!selectedMarker || selectedMarker !== marker) {

            // 클릭된 마커 객체가 null이 아니면
            // 클릭된 마커의 이미지를 기본 이미지로 변경하고
            !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

            // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
            marker.setImage(clickImage);
        }

        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
        selectedMarker = marker;
    });
	
 	/*
 	// 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
    	document.getElementById('myModal').style.display = 'block';
    	fetch(`item/${item.shopNo}`, {
            method: "GET",
        });
    	document.getElementById('cn').innerHTML = `${item.compName}`;
    	document.getElementById('ca').innerHTML = `${item.compAddr1}`;
    	document.getElementById('cc').innerHTML = `${item.compCall}`;
    	document.getElementById('sn').value = `${item.shopNo}`;

    	alert("매장번호" + ${item.shopNo});
    });
 	*/
}
 	

// MakrerImage 객체를 생성하여 반환하는 함수입니다
function createMarkerImage(markerSize, offset, spriteOrigin) {
    var markerImage = new kakao.maps.MarkerImage(
        SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
        markerSize, // 마커의 크기
        {
            offset: offset, // 마커 이미지에서의 기준 좌표
            spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
            spriteSize: spriteImageSize // 스프라이트 이미지의 크기
        }
    );
    
    return markerImage;
}
 	

 	
//검색 결과가 있을 때, 첫 번째 마커를 기준으로 지도 중심을 설정합니다
if (positions.length > 0) {
    map.setCenter(positions[0].latlng);
}
</script>

</c:forEach>


<!-- <script language="JavaScript"> window.name = "Test_Dialog"; </script>
<a href="http://www.egocube.pe.kr/" target="Test_Dialog">Click!</a> -->


<div id="myModal" class="modal">
	<div class="modal-content">
		<span class="close">&times;</span>
		<div id="cn">
		</div>
		<div id="ca">
		</div>
		<div id="cc">
		</div>
		
		<form action="/booking/add" method="post">
		<input type="number" id="sn" name="shopNo" hidden="hidden">
		<input type="number" name="userNo" hidden="hidden" value="${sessionScope.user.userNo}">
		
		<div class="accordion border-0 accordion-s" id="accordion-group-6">
		
                    <div class="accordion-item">
                    
                        <button class="accordion-button collapsed px-0" type="button" data-bs-toggle="collapse" data-bs-target="#accordion6-1">
                            <!-- <span class="font-600 font-13">예약 날짜 선택</span> -->
                            <input class="font-600 font-13 datepicker" name="bookingDate" value="예약 날짜 선택">
                            <i class="bi bi-chevron-down font-20"></i>
                        </button>
                        
                        <div id="accordion6-1" class="accordion-collapse collapse" data-bs-parent="#accordion-group-6">
                            <p class="pb-3 opacity-60">
                                <!-- <input class="datepicker"> -->
                                <script>
                                $(function(){
                                    $('.datepicker').datepicker();
                                })
                                </script>
                            </p>
                        </div>
                        
                    </div>

                    <div class="accordion-item">
                        
                        <button class="accordion-button collapsed px-0" type="button" data-bs-toggle="collapse" data-bs-target="#accordion6-2">
                            <input type="text" id="bookingTime" class="font-600 font-13" name="bookingTime" value="예약 시간 선택">
                            <i class="bi bi-chevron-down font-20"></i>
                        </button>
                        
                        <div id="accordion6-2" class="accordion-collapse collapse" data-bs-parent="#accordion-group-6">
                        	
                        	<script>
                        	function bookingTime( item ) {
                        		document.querySelector('#bookingTime').value = $(item).text();
                        	}
                        	</script>
                        
                            <div class="mb-2 pb-2"></div>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">11:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">12:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">13:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">14:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">17:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">18:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">19:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">20:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">21:00</a>
                            <div class="mb-2"></div> 
                            
                        </div>
                    </div>

                    <div class="accordion-item">
                    
                        <button class="accordion-button collapsed px-0" type="button" data-bs-toggle="collapse" data-bs-target="#accordion6-3">
                            <input type="number" id="tit_bookingMemNum" name="bookingMemNum" class="font-600 font-13" value="예약 인원 선택">
                            <i class="bi bi-chevron-down font-20"></i>
                        </button>
                        
                        <div id="accordion6-3" class="accordion-collapse collapse" data-bs-parent="#accordion-group-6">
                            <p class="pb-3 opacity-60">
                            1~10명까지 선택 가능합니다.<br>
                            방문하시는 인원을 선택하세요.
                            </p>

                            <div class="row">
                                <div class="col-6"  style="margin: 0 auto;">
                                    <div class="stepper rounded-s">
                                    	<script>
                                    	function count(type) {
                                    		let bmn = document.querySelector('#bookingMemNum').value;
                                    		
                                    		if(type === 'plus') {
                                    			bmn = parseInt(bmn) + 1;
                                    			if (bmn > 10) {
                                    				return false;
                                    			}
                                    		}
                                    		else if(type === 'minus')  {
                                    			bmn = parseInt(bmn) - 1;
                                    			if (bmn < 1) {
                                    				return false;
                                    			}
                                    		}
                                    		document.querySelector('#bookingMemNum').value = bmn;
                                    		document.querySelector('#tit_bookingMemNum').value = bmn;
										}
                                    	
                                    	function plus() {
                                    		//document.querySelector('#nop').value += 1;
                                    		//var nop = document.querySelector('#nop').value                                    		
                                    		//console.log(typeof(Number(nop)));
                                    		//console.log(Number(nop));
                                    		//Number(nop) = Number(nop) + 1;
										}
                                    	</script>
                                    	
                                        <a href="#"><i class="bi bi-dash font-18 color-red-dark" onclick="count('minus')"></i></a>
                                        <input type="number" id="bookingMemNum" class="color-theme" min="1" max="10" value="1">
                                        <a href="#"><i class="bi bi-plus font-18 color-green-dark" onclick="count('plus')"></i></a>
                                        
                                    </div>
                                </div>
                            </div>
                            
                        </div>

                    </div>
                </div>
		
		<div>
			<button type="submit" id="booking">예약하기</button>
		</div>
		</form>
		
	</div>
</div>

<div>
${info.shopNo}
</div>



<!-- 적용x -->
<!-- 
<script>
//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
}
</script>

<script>
function applyFn(){
	
	var si  = document.getElementById("si");
	var sival = (si.options[si.selectedIndex].value);
	
	var gu  = document.getElementById("gu");
	var guval = (gu.options[gu.selectedIndex].value);
	
	var dong  = document.getElementById("dong");
	var dongval = (dong.options[dong.selectedIndex].value);
	
	var category  = document.getElementById("category");
	var categoryval = (category.options[category.selectedIndex].value);
	
	alert("value = " + sival + guval + dongval + categoryval);
	
	/* 		
	var selectedindex = city.selectedIndex;
	alert("value = "+value+" , selectedindex = "+selectedindex); 
	*/
	
	

	/* 주소-좌표 변환 */
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	//console.log(cityval)
	geocoder.addressSearch(sival + " " + guval + " " + dongval, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	    if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">적용위치</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
		        
		        
		        
	        /* ~ 카테고리 검색 ~ */
	    	
	    	// 장소 검색 객체를 생성합니다
	    	var ps = new kakao.maps.services.Places(); 
	    	
	    	// input에서 키워드 받음 
	    	//var keyword = document.querySelector('#search').value;	
	    		
	    	// 키워드로 장소를 검색합니다
	    	ps.keywordSearch(categoryval, placesSearchCB, {
	    		radius : 2000,
	    		location: coords
	    	});
	
	
	    	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	    	function placesSearchCB (data, status, pagination) {
	    	    if (status === kakao.maps.services.Status.OK) {
	
	    	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	    	        // LatLngBounds 객체에 좌표를 추가합니다
	    	        var bounds = new kakao.maps.LatLngBounds();
	
	    	        for (var i=0; i<data.length; i++) {
	    	            displayMarker(data[i]);    
	    	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	    	        }       
	    			
	    	        //if ( bounds =! null )
	    	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    	        map.setBounds(bounds);
	    	    } 
	    	}
	    	
	    	// 지도에 마커를 표시하는 함수입니다
	    	function displayMarker(place) {
	    		
	    	    // 마커를 생성하고 지도에 표시합니다
	    	    var marker = new kakao.maps.Marker({
	    	        map: map,
	    	        position: new kakao.maps.LatLng(place.y, place.x) 
	    	    });
	
	    	    // 마커에 클릭이벤트를 등록합니다
	    	    kakao.maps.event.addListener(marker, 'click', function() {
	    	    	document.getElementById('myModal').style.display = 'block';
	    	    });
	    	    	
	   	    	//modal.classList.remove('hidden');
	   	    	
	   	        
	   	    	// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	   	        /* infowindow.setContent(
	   	       		'<div style="padding:5px;font-size:12px;">' + place.place_name + '</div><br><div style="padding:5px;font-size:12px;">' + place.road_address_name + '</div><br><div style="padding:5px;font-size:12px;">' + place.phone + '</div>'
	   	        );
	   	        infowindow.open(map, marker); */
	    	        
			};
		}	
	});
};
</script>
 -->
<!-- 적용x -->



<script>
//모달 닫기 버튼 이벤트 처리
document.querySelector('.close').addEventListener('click', function() {
    document.getElementById('myModal').style.display = 'none';
});

// 모달 바깥 영역 클릭 시 모달 닫기
window.addEventListener('click', function(event) {
    var modal = document.getElementById('myModal');
    if (event.target === modal) {
        modal.style.display = 'none';
    }
});
</script>


<!-- 시구동 -->
<!-- 
<script>
//시 불러오기

	//~ fetch api 방식 ~
	var siInp = document.querySelector('#si');
	var guInp = document.querySelector('#gu');
	var dongInp = document.querySelector('#dong');
	
	siInp.onclick = function() {
		//alert('test');
		//select box option 초기화
		
		var siOpt = document.querySelectorAll('.siOption');
		console.dir(siOpt);
		
		if(siOpt.length > 0) {
			let soList = siOpt;
			for (var i = 0; i < soList.length; i++) {
				soList[i].remove();
			}
		}
		
		fetch('/api/si', {
			method: 'POST'
		}).then(function(response) {
		//let data = response.json();
		return response.json();
		}).then(function(data){ //response.json()의 결과가 인자로 전달
			//alert('test2');
			console.dir(data);
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				let optElm = document.createElement('option');
				optElm.innerHTML = d.si;
				optElm.setAttribute('value', d.si);
				optElm.classList.add('siOption');
				siInp.append(optElm);
			}
		}).catch(function(error){
			console.log(error);
			//alert(error);
		});
	};
</script>
 -->
 
<!--
<script>
//구 불러오기

	//~ fetch api 방식 ~
	var siInp = document.querySelector('#si');
	var guInp = document.querySelector('#gu');
	var dongInp = document.querySelector('#dong');
	
	console.log(siInp);
	
	siInp.onchange = function(){
		alert('test');
		//select box option 초기화
		
		var guOpt = document.querySelectorAll('.guOption');
		console.dir(guOpt);
		
		if(guOpt.length > 0) {
			let goList = guOpt;
			for (var i = 0; i < goList.length; i++) {
				goList[i].remove();
			}
		}
		
		fetch('/api/gu', {
			method: 'POST',
			body: new URLSearchParams({si: siInp.value})
		}).then(function(response) {
		//let data = response.json();
		return response.json();
		}).then(function(data){ //response.json()의 결과가 인자로 전달
			//alert('test2');
			console.dir(data);
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				let optElm = document.createElement('option');
				optElm.innerHTML = d.si;
				optElm.setAttribute('value', d.gu);
				optElm.classList.add('guOption');
				guInp.append(optElm);
			}
		}).catch(function(error){
			console.log(error);
			//alert(error);
		});
		
		//this.form.submit();
	};
</script>
	
<script>
//동 불러오기
	window.addEventListener('load', function() {
		console.log("load");
		
	//~ fetch api 방식 ~
	var siInp = document.querySelector('#si');
	var guInp = document.querySelector('#gu');
	var dongInp = document.querySelector('#dong');
	
	guInp.onchange = function() {
		//alert('test');
		//select box option 초기화
		
		var dongOpt = document.querySelectorAll('.dongOption');
		console.dir(dongOpt);
		
		if(dongOpt.length > 0) {
			let doList = dongOpt;
			for (var i = 0; i < doList.length; i++) {
				doList[i].remove();
			}
		}
		
		fetch('/api/dong', {
			method: 'POST',
			body: new URLSearchParams({si: siInp.value, gu: guInp.value})
		}).then(function(response) {
		//let data = response.json();
		return response.json();
		}).then(function(data){ //response.json()의 결과가 인자로 전달
			//alert('test2');
			console.dir(data);
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				let optElm = document.createElement('option');
				optElm.innerHTML = d.si;
				optElm.setAttribute('value', d.dong);
				optElm.classList.add('dongOption');
				dongInp.append(optElm);
			}
		}).catch(function(error){
			console.log(error);
			//alert(error);
		});
	};
});
</script>
  -->

</div>
</div>
</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>