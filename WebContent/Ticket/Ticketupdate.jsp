<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="ckeditor/ckeditor.js"></script>

<c:choose>
	<c:when test="${empty select || fn:length(select) == 0 }">
			<script>
				alert("해당 정보가 삭제되거나 없습니다");
				history.back();
			</script>
	</c:when>
	
	<c:otherwise>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수정 ${select[0].ticket_name }</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	var named = frm['name'].value.trim();
	var priced = frm['price'].value.trim();
	var img = frm['img'].value.trim();
	/* var ticketfile = document.getElementById("img").value.trim(); */
	

	if(named==""){
		alert("이용권 이름은 반드시 작성하셔야합니다");
		frm['name'].focus();
		return false;
	}
	if(priced==""){
		alert("이용권 가격은 반드시 자겅하셔야합니다.");
		frm['price'].focus();
		return false;
	}
	if(!img){
		alert("파일을 첨부해 주세요"); 
		return false;
		} 
		return true;
}
</script>
<body>
<h2>수정</h2>
<form name = "frm" action="TicketupdateOk.doi" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data">
<input type="hidden" name ="ticket_id" value="${select[0].ticket_id }">
이용권분류 :  ${select[0].ticket_id }<br> <%-- 작성자 이름 변경 불가 --%>
이용권이름 : 
<input type="text" name="name" value="${select[0].ticket_name }"><br>
 가격: 
<input type="text" name="price" value="${select[0].ticket_price }"><br>
이미지: <br>
<input type="file" name="img" value="${select[0].ticket_img }"><br>

<!-- 
 <script>
	CKEDITOR.replace('img',{
		allowedContent: true, //HTML 태그 자동삭제 방지 설정
		filebrowserUploadUrl: '${pageContext.request.contextPath}/Ticket/TicketfileUpload.doi'
	});
</script>
 -->
<br>
<input type="submit" value="수정"/>
</form>
<button onclick="history.back()">이전으로</button>
<button onclick="location.href='Ticketlist.doi'">목록보기</button>


</body>
</html>


	</c:otherwise>
</c:choose>