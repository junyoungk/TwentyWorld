<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1f49e4152a44b4f802bb60f7582283b"></script>

 

<div id="kakao_map" style="width:100%;height:300px;"></div>

 

<!-- 카카오 지도 -->

<script>

var kakao_mapContainer = document.getElementById('kakao_map'), // 지도의 중심좌표

    kakao_mapOption = {

        center: new kakao.maps.LatLng(36.332326, 127.434211), // 지도의 중심좌표

        level: 4 // 지도의 확대 레벨

    };

 

var kakao_map = new kakao.maps.Map(kakao_mapContainer, kakao_mapOption); // 지도를 생성합니다

 

// 지도에 마커를 표시합니다

var marker = new kakao.maps.Marker({

    map: kakao_map,

    position: new kakao.maps.LatLng(36.332326, 127.434211)

});

 

// 커스텀 오버레이에 표시할 컨텐츠 입니다

var content='<div class="map-info-panel">' +

            '       <div class="heading">' +

            '         <strong><?=$view->title?></strong>' +

            '         <div class="close" onclick="closeOverlay()" title="닫기"></div>' +

            '       </div>' +

            '       <div class="body">' +

            '           <div class="cont">'+

            '               <i class="fa fa-map-marker"></i> <?=mb_substr($view->address,5)?>'+

            '           </div>'+

            '           <a href="https://map.kakao.com/link/to/대전역,36.332326,127.434211" target="_blank" class="btn btn-primary btn-sm" role="button"  target="_blank"><i class="fa fa-pencil hidden-xs hidden-sm"></i>길찾기</a>' +

            '       </div>' +

            '</div>';

 

// 마커 위에 커스텀오버레이를 표시합니다

// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다

var overlay = new kakao.maps.CustomOverlay({

    content: content,

    map: kakao_map,

    position: marker.getPosition()

});

 

// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다

kakao.maps.event.addListener(marker, 'click', function() {

    overlay.setMap(kakao_map);

});

 

// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다

function closeOverlay() {

    overlay.setMap(null);

}

</script>

 

<body>
<h3>김진영</h3>

</body>
</html>