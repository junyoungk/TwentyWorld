<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="attraction.beans.*" %>
<link href="attrCSS/attrDetail.css" rel="stylesheet" type="text/css">

<!-- 세션 값 받기 -->
 <%
	int userID = 0;
	if(session.getAttribute("userID") != null) {
		userID = Integer.parseInt(session.getAttribute("userID").toString());
	} 
%>
<%
	// Controller 로부터 결과 데이터 받음
	AttrWriteDTO [] arr = (AttrWriteDTO [])request.getAttribute("list");
%>
<%
	if(arr == null || arr.length == 0){ 
%>
			<script>
				alert("해당 정보가 삭제되거나 없습니다");
				history.back();
			</script>
<%
		return;   // 더이상 JSP 프로세싱 하지 않고 종료
	} // end if
%>
<%
	 int attr_id  = arr[0].getAttr_id();
	 int attr_max = arr[0].getAttr_max();
	 int attr_time =  arr[0].getAttr_time(); 
	 int attr_price =  arr[0].getAttr_price(); 
	 String attr_content =  arr[0].getAttr_content(); 
	 String attr_name =  arr[0].getAttr_name();
	 int attr_location =  arr[0].getAttr_location(); 
	 int attr_min_age =  arr[0].getAttr_min_age();
	 int attr_max_age =  arr[0].getAttr_max_age();
	 int attr_min_height =  arr[0].getAttr_min_height(); 
	 int attr_max_height =  arr[0].getAttr_max_height();
	
	 int attr_authorize =  arr[0].getAttr_authorize();
	 String attr_regDate =  arr[0].getAttr_regDate();
	 String attr_img =  arr[0].getAttr_img();
	 String attr_cardimg =  arr[0].getAttr_cardimg();
%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>읽기 <%=attr_name %></title> <!-- title에 글제목 넣기 -->
</head>

<body>


    <body>
    <h2 id ="attr_name"> 어트랙션 이름<h2>
    <div id = "attr_bgimg" style="background-image: url(<%=attr_img %>);"></div> 
    
    <div id = "attr_content">
        <%=attr_content %>
    </div>
    <br><br>
    <hr id="attr_hr">
    
    <h2 id ="attr_info"> 어트랙션 정보<h2>
    <div id = "attr_guidediv">
        <div id = "attr_guide"> <h3>소요 시간</h3><br><%=attr_time %> 분<br>&nbsp;</div>
        <div id = "attr_guide"> <h3>탑승 최대 인원</h3><br><%=attr_max %> 명<br>&nbsp;</div>
        <div id = "attr_guide"> <h3>현장 구매 가격</h3><br><%=attr_price %> 원 <br>&nbsp;</div>
        <div id = "attr_guide"> <h3>탑승 가능한 나이</h3><br><%=attr_min_age %>살<br>~<%=attr_max_age %>살 </div>
        <div id = "attr_guide"> <h3>탑승 가능한 키</h3><br><%=attr_min_height %>cm<br>~<%=attr_max_height %>cm </div>
    </div>
    <br><br>
    <hr id="attr_hr">
    
    <br><br>
    <div id="attr_back_menu"><a id="attr_menuback" class = "button button-3"
        onclick="location.href = 'attrClientListMain.doat'">더 많은 어트랙션 보러가기 →</a></div>
    


</body>
</html>

<script>


$(function () {
	$(document).ready(function(){
	    alert("$(document).ready ALERT 경고창");
	})
	
    $("#attr_likes").click(function () {
    	if(userID == 0){
    		alert('로그인 후 사용해주세요!');
    	} else {
	        $.ajax({
	            type : "get",
	            url : "attrClientLikes.jsp",
	            //여러개 데이터 보낼 때 Json 방식
	            data : {
	            	attr_num : $("#userID"),
	            	user_num : $("#attr_id"),
	            },
	            success : function(data){
	                //check.jsp에서 DB확인해서 출력은 index에서
	                $("#ajaxReturn1").html(data);
	            },
	            error : function(){
	                alert("error");
	            }
	        });
	        
    	}
	        
	 });
});

</script>


