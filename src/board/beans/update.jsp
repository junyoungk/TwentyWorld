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
<title>수정 ${selec[0].subject }</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	var subject = frm['subject'].value.trim();
	
	if(subject==""){
		alert("제목은 반드시 작성하셔야 합니다");
		frm['subject'].focus();
		return false;
	}
		return true;
}
</script>
<body>
<h2>수정</h2>
<form name = "frm" action="updateOk.do" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name ="uid" value="${selec[0].uid }">
작성자 :  ${selec[0].name }<br> <%-- 작성자 이름 변경 불가 --%>
제목 : 
<input type="text" name="subject" value="${selec[0].subject }"><br>
내용 : <br>
<textarea name="content" id="editor1">${selec[0].content }</textarea>
<script>
	CKEDITOR.replace('editor1',{
		allowedContent: true, //HTML 태그 자동삭제 방지 설정
		filebrowserUploadUrl: '${pageContext.request.contextPath}/board/fileUpload.do'
	});
</script>
<br>
<input type="submit" value="수정"/>
</form>
<button onclick="history.back()">이전으로</button>
<button onclick="location.href='list.jsp'">목록보기</button>


</body>
</html>