<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>티켓작성</title>

<script src="../ckeditor/ckeditor.js"></script>
 
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	var idd = frm['ticket_id'].value.trim();
	var named = frm['name'].value.trim();
	var priced = frm['price'].value.trim();
	var img = frm['img'].value.trim();
	/* var ticketfile = document.getElementById("img").value.trim(); */
	
	if(idd==""){
		alert("티켓분류은 반드시 작성하셔야 합니다 \n ex)1.자유이용권  2.입장권 3.빅3");
		frm['ticket_id'].focus();
		return false;
	}
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
<h2>티켓 작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="TicketwriteOk.doi" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data">
<!--  
-->
<input type="hidden" name="uid" value="<%=session.getAttribute("userID")%>"/>
<h3><%=session.getAttribute("userID")%></h3>
이용권분류:
<input type="number" name="ticket_id"/><br>
이용권이름:
<input type="text" name="name" /><br>
이용권가격:
<input type="text" name="price"/>원<br>
티켓이미지:
<input type="file" name="img" id="img" ><br> <%-- part: file1 --%>



<br><br>
<input type="submit" value="추가"/>
</form>
<br>
<button type="button" onclick="location.href='Ticketlist.doi'">목록으로</button>
</body>
</html>