$(document).ready(function(){
	 
		 
		 // XML (<--이쪽)
		 var url = 'http://ws.bus.go.kr/api/rest/arrive/getLowArrInfoByStId';
		 var queryParams = '?' + encodeURIComponent('ServiceKey') + '=f5XGi6uNgZy%2FRhoPbCtvsvHGs%2Fd4nQuTu0WUXEEQTRP0bQ81HIYik8ja0nbO6hZSq8CD5mDshJgOnMv2IPXhpA%3D%3D'; /* Service Key*/
		 queryParams += '&' + encodeURIComponent('stId') + '=' + encodeURIComponent('123000003'); /* */
		
		 
		 $.ajax({
			url : url+queryParams,
			type : "GET",
			cache : false,
			success : function(data, status){
				
				if(status == "success") 
				parseXML(data);
			}
		});
		 
		// XML2 (-->이쪽)
		url = 'http://ws.bus.go.kr/api/rest/arrive/getLowArrInfoByStId';
		 var queryParams = '?' + encodeURIComponent('ServiceKey') + '=f5XGi6uNgZy%2FRhoPbCtvsvHGs%2Fd4nQuTu0WUXEEQTRP0bQ81HIYik8ja0nbO6hZSq8CD5mDshJgOnMv2IPXhpA%3D%3D'; /* Service Key*/
		 queryParams += '&' + encodeURIComponent('stId') + '=' + encodeURIComponent('123000004'); /* */
		$.ajax({
			url : url+queryParams,
			type : "GET",
			cache : false,
			success : function(data, status){
				
				if(status == "success") 
				parseXML2(data);
			}
		});
		
	
	 
	 $("#btn_remove").click(function(){
		$("#demoXML").html("");
		$("#demoJSON").html("");
	 });
 });

 $("#btn_load").click(function(){
  
	 location.reload();
});


 function parseXML(xmlDOM) {
    var cnt = $(xmlDOM).find("itemList").length;
    var bus = new Array();
 
     

    var i = 0; var cnt = 0 
    
	$(xmlDOM).find("itemList").each(function(){
       
        if (cnt % 10 == 0) { 
        bus[i] += "<tr><th>버스종류</th><th>1전</th><th>2전</th><th>버스번호</th></tr>";

        }
		var imgsrc = "";
        
        
        bus[i] += "<tr>";
			if($(this).find("rtNm").text().length > 3){
				imgsrc = "1.PNG"
			} else {
				imgsrc = "2.PNG"
			}
		

		bus[i] += "<td>"	 +   "<img src='" + imgsrc + "' width='50px' height='50px'>"   + "</td>";
		bus[i] += "<td>" + $(this).find("arrmsg1").text() + "</td>";
		bus[i] += "<td>" + $(this).find("arrmsg2").text() + "</td>";
		bus[i] += "<td>" + $(this).find("rtNm").text() + "</td>";
			
        bus[i] += "</tr>";
        cnt++;
        if(cnt % 10 == 0 ) {
            i++;
        }
        
        
        
	});
    $("#demoXML").html(bus[0]);
    
    var k = 1;
    var interval = setInterval(function(){
    	
    if(k>i){
       
     k=0;		
    }
         $("#demoXML").html(bus[k])
     k++;	  
    }, 3000);
}

function parseXML2(xmlDOM) {
    var cnt = $(xmlDOM).find("itemList").length;
    var bus = new Array();     

    var i = 0; var cnt = 0     
	$(xmlDOM).find("itemList").each(function(){
       
        if (cnt % 10 == 0) { 
        bus[i] += "<tr><th>버스종류</th><th>1전</th><th>2전</th><th>버스번호</th></tr>";

        }
		var imgsrc = "";
        
        
        bus[i] += "<tr>";
			if($(this).find("rtNm").text().length > 3){
				imgsrc = "1.PNG"
			} else {
				imgsrc = "2.PNG"
			}		

		bus[i] += "<td>"	 +   "<img src='" + imgsrc + "' width='50px' height='50px'>"   + "</td>";
		bus[i] += "<td>" + $(this).find("arrmsg1").text() + "</td>";
		bus[i] += "<td>" + $(this).find("arrmsg2").text() + "</td>";
		bus[i] += "<td>" + $(this).find("rtNm").text() + "</td>";
			
        bus[i] += "</tr>";
        cnt++;
        if(cnt % 10 == 0 ) {
            i++;
        }       
        
	});
    $("#demoXML2").html(bus[0]);
    
    var k = 1;
    var interval = setInterval(function(){
    	
    if(k>i){
       
     k=0;		
    }
         $("#demoXML2").html(bus[k])
     k++;	  
    }, 3000);
}

$(document).ready(function(){
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.509030, 127.099978), // 지도의 중심좌표
    draggable: false,
    level: 2 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
{
    content: '<div>자이로스윙</div>', 
    latlng: new kakao.maps.LatLng(37.508223, 127.099763)
},
{
    content: '<div>월드모노레일</div>', 
    latlng: new kakao.maps.LatLng(37.508424, 127.100304)
},
{
    content: '<div>아트란티스</div>', 
    latlng: new kakao.maps.LatLng(37.508438, 127.099499)
},
{
    content: '<div>어린이 왕국</div>',
    latlng: new kakao.maps.LatLng(37.509491, 127.100504)
},
{
    content: '<div>자이로드롭</div>',
    latlng: new kakao.maps.LatLng(37.508657, 127.100593)
},
{
    content: '<div>번지드롭</div>',
    latlng: new kakao.maps.LatLng(37.509359, 127.100174)
},
{
    content: '<div>회전그네</div>',
    latlng: new kakao.maps.LatLng(37.509268, 127.100414)
},
{
    content: '<div>자이로스핀</div>',
    latlng: new kakao.maps.LatLng(37.509266, 127.100639)
},
{  
    content: '<div>혜성특급</div>',
    latlng: new kakao.maps.LatLng(37.509114, 127.100703 )
},

{   
    content: '<div>귀신의집</div>',
    latlng: new kakao.maps.LatLng(37.508802, 127.099167 )
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

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}
});

$("#see1").click(function(){
	document.getElementById("map").innerHTML = "";
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.509030, 127.099978), // 지도의 중심좌표
    draggable: false,
    level: 2 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
{
    content: '<div>자이로스윙</div>', 
    latlng: new kakao.maps.LatLng(37.508223, 127.099763)
},
{
    content: '<div>월드모노레일</div>', 
    latlng: new kakao.maps.LatLng(37.508424, 127.100304)
},
{
    content: '<div>아트란티스</div>', 
    latlng: new kakao.maps.LatLng(37.508438, 127.099499)
},
{
    content: '<div>어린이 왕국</div>',
    latlng: new kakao.maps.LatLng(37.509491, 127.100504)
},
{
    content: '<div>자이로드롭</div>',
    latlng: new kakao.maps.LatLng(37.508657, 127.100593)
},
{
    content: '<div>번지드롭</div>',
    latlng: new kakao.maps.LatLng(37.509359, 127.100174)
},
{
    content: '<div>회전그네</div>',
    latlng: new kakao.maps.LatLng(37.509268, 127.100414)
},
{
    content: '<div>자이로스핀</div>',
    latlng: new kakao.maps.LatLng(37.509266, 127.100639)
},
{
    content: '<div>혜성특급</div>',
    latlng: new kakao.maps.LatLng(37.509114, 127.100703 )
},
{   
    content: '<div>귀신의집</div>',
    latlng: new kakao.maps.LatLng(37.508802, 127.099167 )
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

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}
});

$("#see2").click(function(){
	document.getElementById("map").innerHTML = "";
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.509030, 127.099978), // 지도의 중심좌표
    draggable: false,
    level: 2 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
{
    content: '<div>화장실1</div>', 
    latlng: new kakao.maps.LatLng(37.508671, 127.099345)
},
{
    content: '<div>화장실2</div>', 
    latlng: new kakao.maps.LatLng(37.508443, 127.100284)
},
{
    content: '<div>화장실3</div>', 
    latlng: new kakao.maps.LatLng(37.508859, 127.100925)
},
{
    content: '<div>화장실4</div>',
    latlng: new kakao.maps.LatLng(37.509434, 127.100494)
}

];

var positions2 = [
	{
	    content: '<div>포토존1</div>',
	    latlng: new kakao.maps.LatLng(37.508862, 127.099929)
	},
	{
	    content: '<div>포토존2</div>',
	    latlng: new kakao.maps.LatLng(37.509358, 127.099647)
	},
	{
	    content: '<div>포토존3</div>',
	    latlng: new kakao.maps.LatLng(37.509055, 127.099245 )
	},
	{
	    content: '<div>포토존4</div>',
	    latlng: new kakao.maps.LatLng(37.508363, 127.099691)
	},
	{
	    content: '<div>포토존5</div>',
	    latlng: new kakao.maps.LatLng(37.508714, 127.100420)
	},
	{
	    content: '<div>포토존6</div>',
	    latlng: new kakao.maps.LatLng(37.509254, 127.100648)
	}
	

	];





var imageSrc = "4.png";
var imageSrc2 = "6.png";
for (var i = 0; i < positions.length; i ++) {
// 마커를 생성합니다
var imageSize = new kakao.maps.Size(24, 24); 

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

for (var i = 0; i < positions2.length; i ++) {
	// 마커를 생성합니다
	var imageSize = new kakao.maps.Size(24, 24); 

	var markerImage = new kakao.maps.MarkerImage(imageSrc2, imageSize); 

	var marker = new kakao.maps.Marker({
	    map: map, // 마커를 표시할 지도
	    position: positions2[i].latlng, // 마커의 위치
	    image : markerImage
	});

	// 마커에 표시할 인포윈도우를 생성합니다 
	var infowindow = new kakao.maps.InfoWindow({
	    content: positions2[i].content // 인포윈도우에 표시할 내용
	});

	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	// 이벤트 리스너로는 클로저를 만들어 등록합니다 
	// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}



//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}
});


$("#see3").click(function(){
	document.getElementById("map").innerHTML = "";
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.509030, 127.099978), // 지도의 중심좌표
    draggable: false,
    level: 2 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
{
    content: '<div>음식점1</div>', 
    latlng: new kakao.maps.LatLng(37.509050, 127.099450)
},
{
    content: '<div>음식점2</div>', 
    latlng: new kakao.maps.LatLng(37.508651, 127.099748)
},
{
    content: '<div>음식점3</div>', 
    latlng: new kakao.maps.LatLng(37.508412, 127.099890)
},
{
    content: '<div>음식점4/div>',
    latlng: new kakao.maps.LatLng(37.508638, 127.100377)
},
{
    content: '<div>음식점5</div>',
    latlng: new kakao.maps.LatLng(37.508794, 127.100814)
},
{
    content: '<div>음식점6</div>',
    latlng: new kakao.maps.LatLng(37.508921, 127.100075)
},
{
    content: '<div>음식점7</div>',
    latlng: new kakao.maps.LatLng(37.508924, 127.100436)
},
{
    content: '<div>음식점8</div>',
    latlng: new kakao.maps.LatLng(37.509284, 127.100113)
},
{
    content: '<div>음식점9</div>',
    latlng: new kakao.maps.LatLng(37.509164, 127.100667 )
},
{
    content: '<div>음식점10</div>',
    latlng: new kakao.maps.LatLng(37.509370, 127.099630 )
}
];



var imageSrc = "5.png";

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

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
return function() {
    infowindow.open(map, marker);
};
}

//인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
return function() {
    infowindow.close();
};
}
});









         function initTmap() {               
      
            $("#btn_select").click(function() {
            	
            	
            	
            	
               // 2. API 사용요청
               var fullAddr = $("#fullAddr").val();
               $.ajax({
                  method : "GET",
                  url : "https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=json&callback=result",
                  async : false,
                  data : {
                     "appKey" : "l7xx381cd67d8c21411c8f6170b3183da38b",
                     "coordType" : "WGS84GEO",
                     "fullAddr" : fullAddr
                  },
                  success : function(response) {

                     var resultInfo = response.coordinateInfo; // .coordinate[0];
                     console.log(resultInfo);
                     
                     // 기존 마커 삭제
                     
                     
                     // 3.마커 찍기
                     // 검색 결과 정보가 없을 때 처리
                     if (resultInfo.coordinate.length == 0) {
                        $("#result").text(
                        "요청 데이터가 올바르지 않습니다.");
                     } else {
                        var lon, lat;
                        var resultCoordinate = resultInfo.coordinate[0];
                        if (resultCoordinate.lon.length > 0) {
                           // 구주소
                           lon = resultCoordinate.lon;
                           lat = resultCoordinate.lat;
                        } else { 
                           // 신주소
                           lon = resultCoordinate.newLon;
                           lat = resultCoordinate.newLat
                        }
                     
                        var lonEntr, latEntr;
                        
                        if (resultCoordinate.lonEntr == undefined && resultCoordinate.newLonEntr == undefined) {
                           lonEntr = 0;
                           latEntr = 0;
                        } else {
                           if (resultCoordinate.lonEntr.length > 0) {
                              lonEntr = resultCoordinate.lonEntr;
                              latEntr = resultCoordinate.latEntr;
                           } else {
                              lonEntr = resultCoordinate.newLonEntr;
                              latEntr = resultCoordinate.newLatEntr;
                           }
                        }                                          
                        
                        
                        
                        // 검색 결과 주소를 담을 변수
                        var address = '', newAddress = '';
                        var city, gu_gun, eup_myun, legalDong, adminDong, ri, bunji;
                        var buildingName, buildingDong, newRoadName, newBuildingIndex, newBuildingName, newBuildingDong;
                        
                        // 새주소일 때 검색 결과 표출      // 새주소인 경우 matchFlag가 아닌   // newMatchFlag가 응답값으로   // 온다
                        if (resultCoordinate.newMatchFlag.length > 0) {
                           // 새(도로명) 주소 좌표 매칭   // 구분 코드
                           newMatchFlag = resultCoordinate.newMatchFlag;
                           
                           // 시/도 명칭
                           if (resultCoordinate.city_do.length > 0) {
                              city = resultCoordinate.city_do;
                              newAddress += city + "\n";
                           }
                           
                           // 군/구 명칭
                           if (resultCoordinate.gu_gun.length > 0) {
                              gu_gun = resultCoordinate.gu_gun;
                              newAddress += gu_gun + "\n";
                           }
                           
                           // 읍면동 명칭
                           if (resultCoordinate.eup_myun.length > 0) {
                              eup_myun = resultCoordinate.eup_myun;
                              newAddress += eup_myun + "\n";
                           } else {
                              // 출력 좌표에 해당하는
                              // 법정동 명칭
                              if (resultCoordinate.legalDong.length > 0) {
                                 legalDong = resultCoordinate.legalDong;
                                 newAddress += legalDong + "\n";
                              }
                              // 출력 좌표에 해당하는
                              // 행정동 명칭
                              if (resultCoordinate.adminDong.length > 0) {
                                 adminDong = resultCoordinate.adminDong;
                                 newAddress += adminDong + "\n";
                              }
                           }
                           // 출력 좌표에 해당하는 리 명칭
                           if (resultCoordinate.ri.length > 0) {
                              ri = resultCoordinate.ri;
                              newAddress += ri + "\n";
                           }
                           // 출력 좌표에 해당하는 지번 명칭
                           if (resultCoordinate.bunji.length > 0) {
                              bunji = resultCoordinate.bunji;
                              newAddress += bunji + "\n";
                           }
                           // 새(도로명)주소 매칭을 한
                           // 경우, 길 이름을 반환
                           if (resultCoordinate.newRoadName.length > 0) {
                              newRoadName = resultCoordinate.newRoadName;
                              newAddress += newRoadName + "\n";
                           }
                           // 새(도로명)주소 매칭을 한
                           // 경우, 건물 번호를 반환
                           if (resultCoordinate.newBuildingIndex.length > 0) {
                              newBuildingIndex = resultCoordinate.newBuildingIndex;
                              newAddress += newBuildingIndex + "\n";
                           }
                           // 새(도로명)주소 매칭을 한
                           // 경우, 건물 이름를 반환
                           if (resultCoordinate.newBuildingName.length > 0) {
                              newBuildingName = resultCoordinate.newBuildingName;
                              newAddress += newBuildingName + "\n";
                           }
                           // 새주소 건물을 매칭한 경우
                           // 새주소 건물 동을 반환
                           if (resultCoordinate.newBuildingDong.length > 0) {
                              newBuildingDong = resultCoordinate.newBuildingDong;
                              newAddress += newBuildingDong + "\n";
                           }
                           // 검색 결과 표출
                           if (lonEntr > 0) {
                              
                              var text =  lat 
                              var text2 = lon
                              $("#result2").html(text);
                              $("#result3").html(text2);
                           } 
                        }               
                                   
                        
                     }
                  },
            
               });
            });
      
         }
         
    
         var map;
         var markerInfo;
         //출발지,도착지 마커
         var marker_s, marker_e, marker_p;
         //경로그림정보
         var drawInfoArr = [];
         var drawInfoArr2 = [];
      
         var chktraffic = [];
         var resultdrawArr = [];
         var resultMarkerArr = [];
      
         function initTmap2() {
            
            
            // 1. 지도 띄우기
            map = new Tmapv2.Map("map_div", {
               center : new Tmapv2.LatLng(37.5111158,127.0959783),
               width : "600px",
               height : "600px",
               zoom : 11,
               zoomControl : true,
               scrollwheel : true
            });
      
            // 2. 시작, 도착 심볼찍기
            // 시작
            marker_s = new Tmapv2.Marker(
                  {
                     position : new Tmapv2.LatLng(37.5111158,
                            127.0959783),
                     icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
                     iconSize : new Tmapv2.Size(24, 38),
                     map : map
                  });
      
            //도착
            marker_e = new Tmapv2.Marker(
                  {
                     
                     
                  });
      
            // 3. 경로탐색 API 사용요청
            $("#btn_select2")
                  .click(
                        function() {
                        
                                  var plz =  document.getElementById('result2').innerText;
                                  var plz2 = document.getElementById('result3').innerText;
                               
                           //기존 맵에 있던 정보들 초기화
                           resettingMap();
      
                           var searchOption = $("#selectLevel").val();
      
                           var trafficInfochk = $("#year").val();
      
                           //JSON TYPE EDIT [S]
                           $
                                 .ajax({
                                    type : "POST",
                                    url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
                                    async : false,
                                    data : {
                                       "appKey" : "l7xx381cd67d8c21411c8f6170b3183da38b",
                                       "startX" : "127.0959783",
                                       "startY" : "37.5111158",
                                       "endX" : plz2,
                                       "endY" : plz,
                                       "reqCoordType" : "WGS84GEO",
                                       "resCoordType" : "EPSG3857",
                                       "searchOption" : searchOption,
                                       "trafficInfo" : trafficInfochk
                                    },
                                    success : function(response) {
      
                                       var resultData = response.features;
      
                                       var tDistance = "총 거리 : "
                                             + (resultData[0].properties.totalDistance / 1000)
                                                   .toFixed(1) + "km,";
                                       var tTime = " 총 시간 : "
                                             + (resultData[0].properties.totalTime / 60)
                                                   .toFixed(0) + "분,";
                                       var tFare = " 총 요금 : "
                                             + resultData[0].properties.totalFare
                                             + "원,";
                                       var taxiFare = " 예상 택시 요금 : "
                                             + resultData[0].properties.taxiFare
                                             + "원";
      
                                       $("#result").text(
                                             tDistance + tTime + tFare
                                                   + taxiFare);
      
                                       //교통정보 표출 옵션값을 체크
                                       if (trafficInfochk == "Y") {
                                          for ( var i in resultData) { //for문 [S]
                                             var geometry = resultData[i].geometry;
                                             var properties = resultData[i].properties;
      
                                             if (geometry.type == "LineString") {
                                                //교통 정보도 담음
                                                chktraffic
                                                      .push(geometry.traffic);
                                                var sectionInfos = [];
                                                var trafficArr = geometry.traffic;
      
                                                for ( var j in geometry.coordinates) {
                                                   // 경로들의 결과값들을 포인트 객체로 변환 
                                                   var latlng = new Tmapv2.Point(
                                                         geometry.coordinates[j][0],
                                                         geometry.coordinates[j][1]);
                                                   // 포인트 객체를 받아 좌표값으로 변환
                                                   var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                                                         latlng);
      
                                                   sectionInfos
                                                         .push(convertPoint);
                                                }
      
                                                drawLine(sectionInfos,
                                                      trafficArr);
                                             } else {
      
                                                var markerImg = "";
                                                var pType = "";
      
                                                if (properties.pointType == "S") { //출발지 마커
                                                   markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
                                                   pType = "S";
                                                } else if (properties.pointType == "E") { //도착지 마커
                                                   markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
                                                   pType = "E";
                                                } else { //각 포인트 마커
                                                   markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
                                                   pType = "P"
                                                }
      
                                                // 경로들의 결과값들을 포인트 객체로 변환 
                                                var latlon = new Tmapv2.Point(
                                                      geometry.coordinates[0],
                                                      geometry.coordinates[1]);
                                                // 포인트 객체를 받아 좌표값으로 다시 변환
                                                var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                                                      latlon);
      
                                                var routeInfoObj = {
                                                   markerImage : markerImg,
                                                   lng : convertPoint._lng,
                                                   lat : convertPoint._lat,
                                                   pointType : pType
                                                };
                                                // 마커 추가
                                                addMarkers(routeInfoObj);
                                             }
                                          }//for문 [E]
      
                                       } else {
      
                                          for ( var i in resultData) { //for문 [S]
                                             var geometry = resultData[i].geometry;
                                             var properties = resultData[i].properties;
      
                                             if (geometry.type == "LineString") {
                                                for ( var j in geometry.coordinates) {
                                                   // 경로들의 결과값들을 포인트 객체로 변환 
                                                   var latlng = new Tmapv2.Point(
                                                         geometry.coordinates[j][0],
                                                         geometry.coordinates[j][1]);
                                                   // 포인트 객체를 받아 좌표값으로 변환
                                                   var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                                                         latlng);
                                                   // 포인트객체의 정보로 좌표값 변환 객체로 저장
                                                   var convertChange = new Tmapv2.LatLng(
                                                         convertPoint._lat,
                                                         convertPoint._lng);
                                                   // 배열에 담기
                                                   drawInfoArr
                                                         .push(convertChange);
                                                }
                                                drawLine(drawInfoArr,
                                                      "0");
                                             } else {
      
                                                var markerImg = "";
                                                var pType = "";
      
                                                if (properties.pointType == "S") { //출발지 마커
                                                   markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
                                                   pType = "S";
                                                } else if (properties.pointType == "E") { //도착지 마커
                                                   markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
                                                   pType = "E";
                                                } else { //각 포인트 마커
                                                   markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
                                                   pType = "P"
                                                }
      
                                                // 경로들의 결과값들을 포인트 객체로 변환 
                                                var latlon = new Tmapv2.Point(
                                                      geometry.coordinates[0],
                                                      geometry.coordinates[1]);
                                                // 포인트 객체를 받아 좌표값으로 다시 변환
                                                var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
                                                      latlon);
      
                                                var routeInfoObj = {
                                                   markerImage : markerImg,
                                                   lng : convertPoint._lng,
                                                   lat : convertPoint._lat,
                                                   pointType : pType
                                                };
      
                                                // Marker 추가
                                                addMarkers(routeInfoObj);
                                             }
                                          }//for문 [E]
                                       }
                                    },
                                    error : function(request, status, error) {
                                       console.log("code:"
                                             + request.status + "\n"
                                             + "message:"
                                             + request.responseText
                                             + "\n" + "error:" + error);
                                    }
                                 });
                           //JSON TYPE EDIT [E]
                        });
         }
      
         function addComma(num) {
            var regexp = /\B(?=(\d{3})+(?!\d))/g;
            return num.toString().replace(regexp, ',');
         }
      
         //마커 생성하기
         function addMarkers(infoObj) {
            var size = new Tmapv2.Size(24, 38);//아이콘 크기 설정합니다.
      
            if (infoObj.pointType == "P") { //포인트점일때는 아이콘 크기를 줄입니다.
               size = new Tmapv2.Size(8, 8);
            }
      
            marker_p = new Tmapv2.Marker({
               position : new Tmapv2.LatLng(infoObj.lat, infoObj.lng),
               icon : infoObj.markerImage,
               iconSize : size,
               map : map
            });
      
            resultMarkerArr.push(marker_p);
         }
      
         //라인그리기
         function drawLine(arrPoint, traffic) {
            var polyline_;
      
            if (chktraffic.length != 0) {
      
               // 교통정보 혼잡도를 체크
               // strokeColor는 교통 정보상황에 다라서 변화
               // traffic :  0-정보없음, 1-원활, 2-서행, 3-지체, 4-정체  (black, green, yellow, orange, red)
      
               var lineColor = "";
      
               if (traffic != "0") {
                  if (traffic.length == 0) { //length가 0인것은 교통정보가 없으므로 검은색으로 표시
      
                     lineColor = "#06050D";
                     //라인그리기[S]
                     polyline_ = new Tmapv2.Polyline({
                        path : arrPoint,
                        strokeColor : lineColor,
                        strokeWeight : 6,
                        map : map
                     });
                     resultdrawArr.push(polyline_);
                     //라인그리기[E]
                  } else { //교통정보가 있음
      
                     if (traffic[0][0] != 0) { //교통정보 시작인덱스가 0이 아닌경우
                        var trafficObject = "";
                        var tInfo = [];
      
                        for (var z = 0; z < traffic.length; z++) {
                           trafficObject = {
                              "startIndex" : traffic[z][0],
                              "endIndex" : traffic[z][1],
                              "trafficIndex" : traffic[z][2],
                           };
                           tInfo.push(trafficObject)
                        }
      
                        var noInfomationPoint = [];
      
                        for (var p = 0; p < tInfo[0].startIndex; p++) {
                           noInfomationPoint.push(arrPoint[p]);
                        }
      
                        //라인그리기[S]
                        polyline_ = new Tmapv2.Polyline({
                           path : noInfomationPoint,
                           strokeColor : "#06050D",
                           strokeWeight : 6,
                           map : map
                        });
                        //라인그리기[E]
                        resultdrawArr.push(polyline_);
      
                        for (var x = 0; x < tInfo.length; x++) {
                           var sectionPoint = []; //구간선언
      
                           for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
                              sectionPoint.push(arrPoint[y]);
                           }
      
                           if (tInfo[x].trafficIndex == 0) {
                              lineColor = "#06050D";
                           } else if (tInfo[x].trafficIndex == 1) {
                              lineColor = "#61AB25";
                           } else if (tInfo[x].trafficIndex == 2) {
                              lineColor = "#FFFF00";
                           } else if (tInfo[x].trafficIndex == 3) {
                              lineColor = "#E87506";
                           } else if (tInfo[x].trafficIndex == 4) {
                              lineColor = "#D61125";
                           }
      
                           //라인그리기[S]
                           polyline_ = new Tmapv2.Polyline({
                              path : sectionPoint,
                              strokeColor : lineColor,
                              strokeWeight : 6,
                              map : map
                           });
                           //라인그리기[E]
                           resultdrawArr.push(polyline_);
                        }
                     } else { //0부터 시작하는 경우
      
                        var trafficObject = "";
                        var tInfo = [];
      
                        for (var z = 0; z < traffic.length; z++) {
                           trafficObject = {
                              "startIndex" : traffic[z][0],
                              "endIndex" : traffic[z][1],
                              "trafficIndex" : traffic[z][2],
                           };
                           tInfo.push(trafficObject)
                        }
      
                        for (var x = 0; x < tInfo.length; x++) {
                           var sectionPoint = []; //구간선언
      
                           for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
                              sectionPoint.push(arrPoint[y]);
                           }
      
                           if (tInfo[x].trafficIndex == 0) {
                              lineColor = "#06050D";
                           } else if (tInfo[x].trafficIndex == 1) {
                              lineColor = "#61AB25";
                           } else if (tInfo[x].trafficIndex == 2) {
                              lineColor = "#FFFF00";
                           } else if (tInfo[x].trafficIndex == 3) {
                              lineColor = "#E87506";
                           } else if (tInfo[x].trafficIndex == 4) {
                              lineColor = "#D61125";
                           }
      
                           //라인그리기[S]
                           polyline_ = new Tmapv2.Polyline({
                              path : sectionPoint,
                              strokeColor : lineColor,
                              strokeWeight : 6,
                              map : map
                           });
                           //라인그리기[E]
                           resultdrawArr.push(polyline_);
                        }
                     }
                  }
               } else {
      
               }
            } else {
               polyline_ = new Tmapv2.Polyline({
                  path : arrPoint,
                  strokeColor : "#DD0000",
                  strokeWeight : 6,
                  map : map
               });
               resultdrawArr.push(polyline_);
            }
      
         }
      
         //초기화 기능
         function resettingMap() {
            //기존마커는 삭제
            marker_s.setMap(null);
            marker_e.setMap(null);
      
            if (resultMarkerArr.length > 0) {
               for (var i = 0; i < resultMarkerArr.length; i++) {
                  resultMarkerArr[i].setMap(null);
               }
            }
      
            if (resultdrawArr.length > 0) {
               for (var i = 0; i < resultdrawArr.length; i++) {
                  resultdrawArr[i].setMap(null);
               }
            }
      
            chktraffic = [];
            drawInfoArr = [];
            resultMarkerArr = [];
            resultdrawArr = [];
         }
         
         
         
