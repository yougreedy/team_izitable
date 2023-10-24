// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(36.350614570020895, 127.42563406620827), // 지도의 중심좌표
        //center: new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
};

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);