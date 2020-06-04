<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${seleok == 0 }">
	<script>
		alert('수정 실패');
		history.back();
	</script>
	</c:when>
	<c:otherwise>
		<script>
		alert("수정 성공");
		location.href = "view.do?uid="+${uid };
		</script>
	</c:otherwise>
</c:choose>










