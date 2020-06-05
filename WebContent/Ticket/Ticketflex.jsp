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
<title>티켓 목록</title>
<style>
div{
	width: 100%;
}

div #can{
	width: 300px;
	border: 1px solid black;
	border-collapse: collapse;
	float: left;
}
</style>
</head>
<body>
	<form name="frm" action="TicketflexOk.doi" method="post">
		<input type="hidden" name="uid"
			value="<%=session.getAttribute("userID")%>" />
		<h3><%=session.getAttribute("userID")%></h3>


		<div>


			<c:choose>
				<c:when
					test="${empty flexTicketlist || fn:length(flexTicketlist) == 0 }"></c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${flexTicketlist}">
						<div id="can">
							<div >
								<!-- <img src="../upload/${dto.ticket_img }" /> -->
								<!-- <th>유저</th> -->
								<%-- <td>${dto.user_uid}</td> --%>

								<img src="${pageContext.request.contextPath}/upload/${dto.ticket_img}" />

							</div>

							<div>${dto.ticket_name }</div>
							<div>${dto.ticket_price }</div>
							<div>
								<a
									href="TicketflexOk.doi?id=${dto.ticket_id}&uid=${sessionScope.sessionName = userID }">${dto.ticket_name}예매하기</a>
							</div>
						</div>

					</c:forEach>
				</c:otherwise>
			</c:choose>

		</div>
	</form>
	<br>




</body>
</html>













