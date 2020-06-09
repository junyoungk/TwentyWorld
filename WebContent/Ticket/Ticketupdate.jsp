<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="ckeditor/ckeditor.js"></script>

<c:choose>
	<c:when test="${empty select || fn:length(select) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>

	<c:otherwise>
		<%
			int userID = 0;
					if (session.getAttribute("userID") != null) {
						userID = Integer.parseInt(session.getAttribute("userID").toString());
					}
					if (userID != 1) {
						out.println("<script>");
						out.println("alert('관리자 페이지입니다')");
						out.println("location.href= '../login/testmain.jsp'");
						out.println("</script>");
					}
		%>

		<!DOCTYPE html>
		<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="CSS/Ticketupdate.css" rel="stylesheet" type="text/css">
<title>수정 ${select[0].ticket_name }</title>
</head>
<script type="text/javascript">
	function fileCheck(el) {

		if (!/\.(jpeg|jpg|png|gif|bmp)$/i.test(el.value)) {

			alert('이미지 파일만 업로드 가능합니다.');

			el.value = '';

			el.focus();

		}

	}
</script>
<script>
	function chkSubmit() {
		frm = document.forms['frm'];
		var named = frm['name'].value.trim();
		var priced = frm['price'].value.trim();
		var img = frm['img'].value.trim();
		/* var ticketfile = document.getElementById("img").value.trim(); */

		if (named == "") {
			alert("이용권 이름은 반드시 작성하셔야합니다");
			frm['name'].focus();
			return false;
		}
		if (priced == "") {
			alert("이용권 가격은 반드시 자겅하셔야합니다.");
			frm['price'].focus();
			return false;
		}
		if (!img) {
			alert("파일을 첨부해 주세요");
			return false;
		}
		return true;
	}
</script>
<body>

	<div class="wrap">
		<div class="form-wrap">
			<form id="frm" class="input-group" name="frm"
				action="TicketupdateOk.doi" method="post"
				onsubmit="return chkSubmit()" enctype="Multipart/form-data">
				<input type="hidden" name="uid" value="<%=session.getAttribute("userID")%>" />
				<input type="hidden" name="ticket_id" value="${select[0].ticket_id}" />
				이용권분류 : ${select[0].ticket_id }<br><br>
				이용권이름 :<input type="text" class="input-field" name="name" value="${select[0].ticket_name }"><br>
				이용권가격 :<input type="text" class="input-field" name="price" value="${select[0].ticket_price }"/><br>
				티켓이미지 :<input type="file" class="input-field" name="img" value="${select[0].ticket_img }" accept="image/*" onchange="fileCheck(this)"><br>
					<input class="btn" type="submit" value="수정" />
				<button class="btn" onclick="history.back()">이전으로</button>
				<button class="btn" onclick="location.href='Ticketlist.doi'">목록보기</button>


			</form>

		</div>
	</div>
	<!-- 
 <script>
	CKEDITOR.replace('img',{
		allowedContent: true, //HTML 태그 자동삭제 방지 설정
		filebrowserUploadUrl: '${pageContext.request.contextPath}/Ticket/TicketfileUpload.doi'
	});
</script>
 -->

</body>
		</html>


	</c:otherwise>
</c:choose>