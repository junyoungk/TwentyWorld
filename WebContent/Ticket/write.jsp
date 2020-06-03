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

<script src="../ckeditor/ckeditor.js"></script>

</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	var idd = frm['idd'].value.trim();
	
	if(idd==""){
		alert("티켓분류은 반드시 작성하셔야 합니다 1.자유이용권  2.입장권 3.빅3");
		frm['idd'].focus();
		return false;
	}
		return true;
}
</script>

<body>
<h2>글 작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="writeOk.doi" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="uid" value="<%=session.getAttribute("userID")%>"/>
이용권분류:
<input type="number" name="idd"/><br>
이용권이름:
<input type="text" name="name" /><br>
가격:
<input type="text" name="price"/><br>
이미지:
<textarea name="img" ></textarea><br>
<script>
	CKEDITOR.replace('img',{
		allowedContent: true, //HTML 태그 자동삭제 방지 설정
		width: '640px',
		height: '400px',
		filebrowserUploadUrl: '${pageContext.request.contextPath}/Ticket/fileUpload.doi'
	});
	
</script>

<br><br>
<input type="submit" value="게시"/>
</form>
<br>
<button type="button" onclick="location.href='list.doi'">목록으로</button>
</body>
</html>