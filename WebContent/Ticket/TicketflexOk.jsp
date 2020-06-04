<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<c:choose>
	<c:when test="${flexOk == 0 }">
	<script>
		alert('예매 실패');
		history.back();
	</script>
	</c:when>
	<c:otherwise>
		<script>
		alert("예매 성공");
		location.href ="Ticketflex.doi";
	</script>
	</c:otherwise>
</c:choose>
