<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="attraction.beans.*" %>

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
<script>
function chkDelete(attr_id){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'attrDeleteOk.doat?attr_id=' + attr_id;
	}
}
</script>
<body>
<h1>#관리자페이지# <%=attr_name %> View</h1>

<div id = "attr_name"><%=attr_name %></div>
<div id = "attr_img" style="height : 500px; width : 80%;
background-position: center center; background-size : cover;
background-image:url(<%=attr_img%>)"></div>
<div id = "attr_content"><%=attr_content %></div>
<hr>
<div id = "attr_content_info">어트랙션 정보</div>
<div id = "attr_info">
    <div id = "attr_time">소요시간 : <%=attr_time %></div>
    <div id = "attr_max">최대탑승인원 : <%=attr_max %></div>
</div>
<div>
가격 : <%= attr_price %><br>
이름 : <%= attr_name %><br>
위치 : <%= attr_location %><br>
최소나이 : <%= attr_min_age %><br>
최대나이 : <%= attr_max_age %><br>
최소 키 : <%= attr_min_height %><br>
최대 키 : <%= attr_max_height %><br>

권한 : <%= attr_authorize %><br>
등록날짜 : <%= attr_regDate %><br>
상세페이지 이미지 주소? : <%= attr_img %><br>
카드이미지 주소? : <%= attr_cardimg %><br>


</div>

<hr>
<br>
<button onclick="location.href='attrUpdate.doat?attr_id=<%=attr_id%>'">수정하기</button>
<button onclick="location.href = 'attrAdminListMain.doat'">목록보기</button>
<button onclick="chkDelete(<%=attr_id%>)">삭제하기</button>
<button onclick="location.href = 'attrWrite.doat'">신규등록</button>

</body>
</html>















