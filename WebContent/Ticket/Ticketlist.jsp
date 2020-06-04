<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- JSTL 버젼으로 바뀌니 import 번잡함도 사라진다. 자바변수 선언도 사라진다 -->
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
	
		
		<table>
			<tr>
				<th>No</th>
				<th>이미지</th>
				<th>이용권</th>
				<th>가격</th>
				<th> </th>
			</tr>
		
		<c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }"></c:when>
			<c:otherwise>
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.ticket_id }</td>
				<td><img src="${dto.ticket_img }" style="width:50px" height="50px"/></td>
				<td>${dto.ticket_name }</td>
				<td>${dto.ticket_price }</td> 
				 <td><a href="Ticketview.doi?id=${dto.ticket_id }">${dto.ticket_name }</a></td>
				 
			</tr>		
			</c:forEach>
			</c:otherwise>
		</c:choose>

		</table>
		<br>
		<button onclick="location.href='Ticketwrite.doi'">이용권작성 (추가)</button>



<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>















