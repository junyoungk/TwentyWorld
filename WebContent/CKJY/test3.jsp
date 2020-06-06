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


<body>
<h1>롯데월드 앞 버스정류장 도착정보(10개씩 10초마다 (갯수, 초 수정가능)</h1>
<form>


<button id="btn_load" type="button">새로고침</button>

</form>
<br><br>
<div style="float: left; font-size: 30px;">가락시장방면</div>
<div style="float: left; font-size: 30px; margin-left: 400px;">반대편방면</div>
<br><br>
<table id="demoXML" style="float: left;"></table>


<table id="demoXML2" style="float: left; margin-left: 30px;"></table>




<script>
	 
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
  
		 
		 // XML
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
		 
		// JSON
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

</script>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
