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
<title>글 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
		<h2>공지/자유 게시판</h2>
		<form action="list.do">
			<input type="button" value="전체">
			<input type="button" value="자유">
			<input type="button" value="공지">	
			<input type="button" value="기타">
		</form>
		
		<table>
			<tr>
				<th>No</th>
				<th>분류</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		
		<c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }"></c:when>
			<c:otherwise>
			<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.board_id }</td>
				<td>${dto.board_category }</td>
				<td>${dto.writeName }</td>
				<td><a href="view.do?uid=${dto.board_id }">${dto.board_subject }</a></td>
				<td>${dto.board_viewcnt }</td>
				<td>${dto.board_regdate }</td>
			</tr>		
			</c:forEach>
			</c:otherwise>
		</c:choose>

		</table>
		<br>
		<button onclick="location.href='write.do'">글쓰기</button>



<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>















