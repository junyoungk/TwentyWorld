<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${replyresult == 0 }">
		<script>
			alert("등록 실패!!!!!!");
			history.back();   // 브라우저가 기억하는 직전 페이지(입력중 페이지로)
		</script>
	</c:when>
	<c:otherwise>
		<script>
			/* location.href = "view.do?uid="+${boarderid }; */
			history.back();
		</script>
	</c:otherwise>
</c:choose>