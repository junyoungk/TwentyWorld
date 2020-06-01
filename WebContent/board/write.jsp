<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글작성</title>

<script src="../ckeditor/ckeditor.js"></script>

</head>
<script>
function chkSubmit(){ // 폼 검증
	frm = document.forms["frm"];
	
	var subject = frm['subject'].value.trim();
	
	if(subject==""){
		alert("제목은 반드시 작성해야 합니다");
		frm["subject"].focus();
		return false;
	}
	
	return true;
}
</script>

<body>
<h2>글 작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="writeOk.do" method="post" onsubmit="return chkSubmit()">
제목:
<input type="text" name="subject"/><br>
<select name="category">
	<option value="공지">공지</option>
	<option value="자유">자유</option>
	<option value="기타">기타</option>
</select>
내용:<br>
<textarea name="content" id="editor1"></textarea>
<script>
	CKEDITOR.replace('editor1',{
		allowedContent: true, //HTML 태그 자동삭제 방지 설정
		width: '640px',
		height: '400px',
		filebrowserUploadUrl: '${pageContext.request.contextPath}/board/fileUpload.do'
	});
</script>

<br><br>
<input type="submit" value="게시"/>
</form>
<br>
<button type="button" onclick="location.href='list.do'">목록으로</button>
</body>
</html>