<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- JSTL 버젼으로 바뀌니 import 번잡함도 사라진다. 자바변수 선언도 사라진다 -->






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
<link href="CSS/Ticketlist.css" rel="stylesheet" type="text/css">
<title>티켓 목록</title>

</head>
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

<body>
	<input type="hidden" name="uid" value="<%=session.getAttribute("userID")%>" />

	<div class="sun" style>
		
			<c:choose>
				<c:when test="${empty list || fn:length(list) == 0 }"></c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list}">
						<div class="listdiv">
							No: ${dto.ticket_id }<br>
								<!-- <img src="../upload/${dto.ticket_img }" />--> 
						 	<img id="ticketlistimg" src="${pageContext.request.contextPath}/upload/${dto.ticket_img }"
							class="img-fluid" alt="Responsive image"/><br>
							이용권 : ${dto.ticket_name }<br>
							가격 : ${dto.ticket_price }<br>
							수정 / 삭제 : <a href="Ticketview.doi?id=${dto.ticket_id }">${dto.ticket_name }관리하기</a><br>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	</div>



	<br>
	<button onclick="location.href='Ticketwrite.doi'">이용권작성 (추가)</button>



	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
</html>













