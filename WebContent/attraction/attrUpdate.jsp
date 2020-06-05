<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="attraction.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- TODO 이미지 업로드 다시 체크!!! -->
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
	int attr_id = arr[0].getAttr_id();
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
<title>수정 <%= attr_name %></title>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	var subject = frm['subject'].value.trim();
	
	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm['subject'].focus();
		return false;
	}
	return true;
}
</script>
<body>
<h2>수정</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="attrUpdateOk.doat" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data">
<input type="hidden" name="attr_id" value="<%= attr_id %>"/>

이름: <input type="text" name="attr_name" value="<%= attr_name %>"/><br>
내용: <input type="text" name="attr_content" value="<%= attr_content %>"/><br>
상세페이지사진: <input type="file" name="attr_setimg"/>기존 :<%= attr_cardimg %><br>
메인사진(카드): <input type="file" name="attr_setcardimg" />기존 :<%= attr_img %><br>

소요시간: <input type="number" name="attr_time" value="<%= attr_time %>"/><br>
탑승인원수: <input type="number" name="attr_max" value="<%= attr_max %>"/><br>
가격: <input type="number" name="attr_price" value="<%= attr_price %>"/><br>
권한 :  <input type="number" name="attr_authorize" value="<%= attr_authorize %>"/><br>

<hr>
최소나이: <input type="number" name="attr_min_age" value="<%= attr_min_age %>"/>
최대나이: <input type="number" name="attr_max_age" value="<%= attr_max_age %>"/><br>

최소키: <input type="number" name="attr_min_height" value="<%= attr_min_height %>"/>
최대키: <input type="number" name="attr_max_height" value="<%= attr_max_height %>"/><br>
장소 : 
<select name="attr_location" >
    <option value="0">실내</option>
    <option value="1">실외</option>
</select>
<br><br>
<input type="submit" value="수정"/>
</form>
<button onclick="history.back()">이전으로</button>
<button onclick="location.href='attrAdminListMain.doat'">목록보기</button>

</body>
</html>















