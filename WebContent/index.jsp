<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>도로명주소 api</title>
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
<h3>도로명 주소</h3>
<form name="form" id="form" method="post">
	<input type="hidden" name="currentPage" value="1"/><br> <!-- 요청 변수 설정 (현재 페이지. currentPage : n > 0) -->
	<input type="hidden" name="countPerPage" value="10"/><br><!-- 요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100) --> 
	<input type="hidden" name="confmKey" value="devU01TX0FVVEgyMDIwMDUxMjE3MTkyOTEwOTc1MTE="/><br><!-- 요청 변수 설정 (승인키) -->
	위치 입력 : <input type="text" name="keyword" value="역삼역" /><br><br><!-- 요청 변수 설정 (키워드) -->
	<input type="button" onClick="getAddr();" value="검색하기"/>
</form><br>
<div id="list" ></div><!-- 검색 결과 리스트 출력 영역 -->
<button id="button">버튼눌러봐</button>

<input type="text" id="aaa" readonly="readonly" value="dd" style="background-color: gray"/>
<script>
$("#button")
.click(function(){
	var a =  document.getElementById('i').innerText;
	alert(a)
})

</script>
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
			
			document.getElementById('aaa').value = a;
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
		
		//특정문자열(sql예약어의 앞뒤공백포함) 제거
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

</body>
</html>