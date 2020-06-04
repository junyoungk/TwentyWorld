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
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<form name="frm" action="TicketflexOk.doi" method="post">
<input type="hidden" name="uid" value="<%=session.getAttribute("userID")%>"/>
    <h3><%=session.getAttribute("userID")%></h3>


	<table>
		<tr>

			<th>이미지</th>
			<th>이용권</th>
			<th>가격</th>
			<th>예매</th>
		</tr>

		<c:choose>
			<c:when test="${empty flexlist || fn:length(flexlist) == 0 }"></c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${flexlist}">
					<tr>
						
						<td style="width: 200px" height="100px">
						<!-- 
						 <img src="../upload/${dto.ticket_img }" />
						 -->
						<img src="${pageContext.request.contextPath}/upload/${dto.ticket_img}" />
						
						</td>
						<td>${dto.ticket_name }</td>
						<td>${dto.ticket_price }</td>
						<td><a href="TicketflexOk.doi?id=${dto.ticket_id}">${dto.ticket_name}예매하기</a></td>

					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>
	</form>
	<br>



	
</body>
</html>













