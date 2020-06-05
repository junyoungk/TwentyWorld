<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글작성</title>
</head>
<script>
function chkSubmit(){  // 폼 검증
	frm = document.forms["frm"];
	
	//폼...검증 (길다)
	List listcheck = new ArrayList();
	var attr_name = frm["attr_name"].value.trim();
	var attr_content = frm["attr_content"].value.trim();
	var attr_setimg = document.getElementById("attr_setimg").value;
	out.println("폼검증 attr_setimg" + attr_setimg);
	var attr_setcardimg = document.getElementById("attr_setcardimg").value;
	var attr_time = frm["attr_time"].value.trim();
	var attr_max = frm["attr_max"].value.trim();
	var attr_price = frm["attr_price"].value.trim();
	var attr_authorize = frm["attr_authorize"].value.trim();
	var attr_min_age = frm["attr_min_age"].value.trim();
	var attr_max_age = frm["attr_max_age"].value.trim();
	var attr_min_height = frm["attr_min_height"].value.trim();
	var attr_max_height = frm["attr_max_height"].value.trim();

	var alert_sen = "은(는) 반드시 입력해야 합니다!";
	if(attr_name == " "){ alert("이름" + alert_sen); frm["attr_name"].focus(); return false; }
	if(attr_content == " "){ alert("설명" + alert_sen); frm["attr_content"].focus(); return false; }
	if(attr_min_age < 0 || attr_min_height< 0 || attr_min_height < 0 || attr_max_height < 0){
		alert("나이와 키는 0이상이여야 합니다."); return false;}
	if(attr_min_age > attr_min_height){
		alert("최소나이(" + attr_min_age + ")는 최대나이(" + attr_min_height + ")를 넘을 수 없습니다."); return false;}
	if(attr_min_height > attr_max_height){
		alert("최소키(" + attr_min_height + ")는 최대키(" + attr_max_height + ")를 넘을 수 없습니다."); return false;}
	
	return true;
}

</script>
<body>
<h2>글작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="attrWriteOk.doat" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data">
이름: <input type="text" name="attr_name"/><br>
내용: <input type="text" name="attr_content"/><br>
상세페이지사진: <input type="file" name="attr_setimg"/><br> <%-- part: file1 --%>
메인사진(카드):<input type="file" name="attr_setcardimg"/><br> <%-- part: file2 --%>

소요시간: <input type="number" name="attr_time"/><br>
최대탑승인원수: <input type="number" name="attr_max"/><br>
가격: <input type="number" name="attr_price"/><br>
권한 :  <input type="number" name="attr_authorize"/><br>

<hr>
최소나이: <input type="number" name="attr_min_age"/>
최대나이: <input type="number" name="attr_max_age"/><br>

최소키: <input type="number" name="attr_min_height"/>
최대키: <input type="number" name="attr_max_height"/><br>
장소 : 
<select name="attr_location" >
    <option value="0">실내</option>
    <option value="1">실외</option>
</select>
<br><br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='attrAdminListMain.doat'">목록으로</button>


</body>
</html>















