<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<c:choose>
	<c:when test="${result == 0 }">
	<script>
		alert('수정 실패');
		history.back();
	</script>
	</c:when>
	<c:otherwise>
		<script>
		alert("수정 성공");
		location.href = "Ticketlist.doi";
		</script>
	</c:otherwise>
</c:choose>
 









