<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
<form name="frm" action="writeOk.do" method="post" onsubmit="return chkSubmit()"
	enctype="Multipart/form-data">
<input type="hidden" name="uid" value="<%=session.getAttribute("userID")%>"/>
<input type="hidden" name="bid" value="${bid }"/>
제목:
<input type="text" name="subject"/><br>
<select name="category">
	<option value="자유">자유</option>
	<option value="기타">기타</option>
	<option value="행사">행사</option>
	<option value="공지">공지</option>
</select>
<c:if test="${sessionScope.userID != 1}">
	<script>
		$("select option[value*='공지']").remove();
		$("select option[value*='행사']").remove();
	</script>
</c:if>
내용:<br>
<textarea name="content" style="width:700px; height:auto">
<c:if test="${fn:length(file) > 0 }">
	<div>
		<c:forEach var="element" items="${file }">
			<c:if test="${element.image == true}">
				<div style="width:300px">
					<img style="width:100%; height:auto" src="../upload/${element.file }"/>
				</div>
			</c:if>
		</c:forEach>
	</div>
</c:if>
</textarea>
<br><br>
<div style="background-color: #dddddd; padding: 2px 10px; margin-bottom:5px; border: 1px solid black;">
	<h4>첨부파일</h4>
	<button type="button" id="btnAdd">추가</button>
	<div id='files'></div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
var i = 0;
$('#btnAdd').click(function(){
	$("#files").append("<div><input type='file' name='upfile" + i + "'/><button type='button' onclick='$(this).parent().remove()'>삭제</button></div>");
	i++;
});
</script>
<input type="submit" value="게시"/>
</form>
<br>
<button type="button" onclick="location.href='list.do'">목록으로</button>
</body>
</html>