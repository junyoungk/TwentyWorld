<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여러개 마커에 이벤트 등록하기1</title>
<script   src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1f49e4152a44b4f802bb60f7582283b"></script>    
</head>
<body>
<button id="see1">어트랙션</button>
<button id="see2">화장실</button>
<button id="see3">음식점</button>
<div id="map" style="width:50%;height:350px;"></div>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.509030, 127.099978), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
        content: '<div>자이로스윙</div>', 
        latlng: new kakao.maps.LatLng(37.508278, 127.099738)
    },
    {
        content: '<div>혜성특급</div>', 
        latlng: new kakao.maps.LatLng(37.508980, 127.100601)
    },
    {
        content: '<div>회전그네</div>', 
        latlng: new kakao.maps.LatLng(37.509247, 127.100071)
    },
    {
        content: '<div>자이로스핀</div>',
        latlng: new kakao.maps.LatLng(37.509085, 127.100490)
    }
];



var imageSrc = "https://adventure.lotteworld.com/common/images/map_check.png";

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커의 위치
        image : markerImage
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}


</script>

<script>
$("#see1").click(function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.509030, 127.099978), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
	var positions = [
	    {
	        content: '<div>자이로</div>', 
	        latlng: new kakao.maps.LatLng(37.508418, 127.0996249)
	    },
	    {
	        content: '<div>생태연못</div>', 
	        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
	    },
	    {
	        content: '<div>텃밭</div>', 
	        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
	    },
	    {
	        content: '<div>근린공원</div>',
	        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
	    }
	];
	alert('야');
	
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커의 위치
	        image : markerImage
	    });

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}


})
</script>

</body>
</html>