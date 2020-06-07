<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>롯데월드 앞 버스정류장 상행/하행 실시간 도착정보</title>
<style>
table,th,td {
  border : 1px solid black;
  border-collapse: collapse;
}
th,td {
  padding: 5px;
}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f1f49e4152a44b4f802bb60f7582283b"></script> 
 <script   src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx381cd67d8c21411c8f6170b3183da38b"></script>
      


<body>


<h3>20대월드 모험지도</h3>
<button id="see1">어트랙션</button>
<button id="see2">화장실</button>
<button id="see3">음식점</button>
<div id="map" style="width:50%;height:350px;"></div>





<br><br>





 <body onload="initTmap2();initTmap()">
      <input type="text" class="text_custom" id="fullAddr"
         name="fullAddr" value="서울시 마포구 와우산로29가길 69">
      <button id="btn_select">적용하기</button>
      <div class="ft_area">
         <div class="ft_select_wrap">
            <div class="ft_select">
               <select id="selectLevel">
                  <option value="0" selected="selected">교통최적+추천</option>
                  <option value="1">교통최적+무료우선</option>
                  <option value="2">교통최적+최소시간</option>
                  <option value="3">교통최적+초보</option>
                  <option value="4">교통최적+고속도로우선</option>
                  <option value="10">최단거리+유/무료</option>
                  <option value="12">이륜차도로우선</option>
               </select> <select id="year">
                  <option value="N" selected="selected">교통정보 표출 옵션</option>
                  <option value="Y">Y</option>
                  <option value="N">N</option>
               </select>
               <button id="btn_select2">적용하기</button>
            </div>
         </div>
         <div class="map_act_btn_wrap clear_box"></div>
         <div class="clear"></div>
      </div>
   
      <div id="map_wrap" class="map_wrap">
         <div id="map_div"></div>
      </div>
      <div class="map_act_btn_wrap clear_box"></div>
      <p id="result"></p>
      <br/>
      
      
      <p id="result2"></p>
      <p id="result3"></p>
      


<div style="float: left; font-size: 30px;">가락시장방면</div>
<div style="float: left; font-size: 30px; margin-left: 400px;">반대편방면</div>
<br><br>


<h1>20대월드 앞 버스정류장 도착정보(10개씩 10초마다 (갯수, 초 수정가능)</h1>
<form>


<button id="btn_load" type="button">새로고침</button>

</form>
<table id="demoXML" style="float: left;"></table>


<table id="demoXML2" style="float: left; margin-left: 30px;"></table>



<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
 <script src="chart.js"></script>
</html>
