<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="ckeditor/ckeditor.js"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수정 ${selec[0].ticket_name }</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	var name = frm['id'].value.trim();
	
	if(name==""){
		alert("티켓이름은 반드시 작성하셔야 합니다");
		frm['id'].focus();
		return false;
	}
		return true; 
}
</script>
<body>
<h2>수정</h2>
<form name = "frm" action="updateOk.doi" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name ="id" value="${selec[0].ticket_id }">
작성자 :  ${selec[0].ticket_name }<br> <%-- 작성자 이름 변경 불가 --%>
제목 : 
<input type="text" name="price" value="${selec[0].ticket_price }"><br>
이미지: <br>
<textarea name="img">${selec[0].content }</textarea>
<script>
	CKEDITOR.replace('img',{
		allowedContent: true, //HTML 태그 자동삭제 방지 설정
		filebrowserUploadUrl: '${pageContext.request.contextPath}/Ticket/fileUpload.doi'
	});
</script>
<br>
<input type="submit" value="수정"/>
</form>
<button onclick="history.back()">이전으로</button>
<button onclick="location.href='list.doi'">목록보기</button>


</body>
</html>