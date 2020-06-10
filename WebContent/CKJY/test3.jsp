<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

 <!-- Bootstrap CSS -->
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
      









 <body onload="initTmap2();initTmap()">
 
<form name="form" id="form" method="post">
	<input type="hidden" name="currentPage" value="1"/><br> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
	<input type="hidden" name="countPerPage" value="10"/><br><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) --> 
	<input type="hidden" name="confmKey" value="devU01TX0FVVEgyMDIwMDUxMjE3MTkyOTEwOTc1MTE="/><br><!-- 요청 변수 설정 (승인키) -->
	위치 입력 : <input type="text" name="keyword" value="" placeholder="위치를 입력하세요"/><!-- 요청 변수 설정 (키워드) -->
	<input type="button" onClick="getAddr();" value="검색하기"/>
</form><br> 
<div id="list" style="display: none;" ></div><!-- 검색 결과 리스트 출력 영역이지만 하나만뽑기위해사용 > 필요없으므로 감추어논다. --> 
      <input type="text" class="text_custom" id="fullAddr"
         name="fullAddr" value="" readonly="readonly" size="50px" style="background-color: #EAEAEA">
      <button id="btn_select">주소 확인!</button>
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
               <button id="btn_select2">길찾기</button>
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
      
      
      <p id="result2" style="display: none"></p> <!--그저 값얻기위해서  display:none-->
      <p id="result3" style="display: none"></p> <!--그저 값얻기위해서  display:none-->
      

<h3>20대월드 모험지도</h3>
<button id="see1">어트랙션</button>
<button id="see2">화장실</button>
<button id="see3">음식점</button>
<div id="map" style="width:70%;height:350px;"></div>





<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
 <script src="mapapi.js"></script>
 
 <!--  밑에는 도로명주소를 위 한 script.. -->
 <script>
 function getAddr(){
	if (!checkSearchedWord(document.form.keyword)) {
		return ;
	}
	
	$.ajax({
		url :"http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"
		, type : "post"
		, data : $("#form").serialize() 
		, dataType: "jsonp"
		, crossDomain: true
		, success: function(xmlStr){
			$("#list").html("");
			makeList(xmlStr.returnXml);
			var a =  document.getElementById('i').innerText;
			alert(a)
			
			document.getElementById('fullAddr').value = a;
		}
	});
}

function makeList(xmlStr){
	var htmlStr = "";
	htmlStr += "<table>";
	$(xmlStr).find("juso").each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td id='i'>"+$(this).find('roadAddr').text()+"</td>";    // 전체 도로명 주소
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	$("#list").html(htmlStr);
}

//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
function checkSearchedWord(obj){
	if(obj.value.length >0){
		//특수문자 제거
		var expText = /[%=><]/ ;
		if(expText.test(obj.value) == true){
			alert("특수문자를 입력 할수 없습니다.") ;
			obj.value = obj.value.split(expText).join(""); 
			return false;
		}
		
		//특정문자열(sql예약어의 앞뒤공백포함) 제거 //아앙아
		var sqlArray = new Array(
			//sql 예약어
			"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
		);
		
		var regex;
		for(var i=0; i<sqlArray.length; i++){
			regex = new RegExp( sqlArray[i] ,"gi") ;
			
			if (regex.test(obj.value) ) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex, "");
				return false;
			}
		}
	}
	return true ;
}

function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {    
		event.keyCode = 0;  
		getAddr(); //jsonp사용시 enter검색 
	} 
}
</script>
 
</html>
