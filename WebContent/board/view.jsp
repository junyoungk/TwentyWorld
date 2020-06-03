<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:choose>
	<c:when test="${empty read || fn:length(read) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>읽기 ${read[0].board_subject }</title> <!-- title에 글제목 넣기 -->
</head>
<script>
function chkDelete(uid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'deleteOk.do?uid='+uid;
	}
}
</script>
<body>
<h2>읽기 ${read[0].board_subject }</h2>
<br>
작성자 : ${read[0].writeName }<br>
제목 : ${read[0].board_subject }<br>
등록일 : ${read[0].board_regdate }<br>
조회수 : ${read[0].board_viewcnt }<br>
내용: <br>
<hr>
<div>
${read[0].board_content }
</div>
<hr>
<c:if test="${fn:length(file) > 0 }">
	<h4>첨부파일</h4>
	<ul>
		<c:forEach var="element" items="${file }">
			<li><a href="fileUpload.do?uid=${element.uid }">${element.source }</a></li>
		</c:forEach>
		
		<!-- 이미지인 경우 보여주기 -->
		<c:forEach var="element" items="${file }">
			<c:if test="${element.image == true}">
				<div style="width:300px">
					<img style="width:100%; height:auto" src="../upload/${element.file }"/>
				</div>
			</c:if>
		</c:forEach>
		
	</ul>
</c:if>
<!-- shinhoonji -->
댓글 내용<br>
<c:choose>
	<c:when test="${empty replylist || fn:length(replylist) == 0 }"></c:when>
	<c:otherwise>
	<c:forEach var="dto" items="${replylist }">
	
	</c:forEach>
	</c:otherwise>
</c:choose>

<%-- <form name="frm" action="ReplywriteOk.do" method="post">
<input type="text" name="reply_boarderid" value="${read[0].board_id }"/>
user_uid: <%=session.getAttribute("userID")%>

<textarea name="reply_comment"></textarea>

<input type="submit" value="댓글게시"/>
</form> --%>
<!-- shinhoonji -->

<button onclick="location.href='update.do?uid=${read[0].board_id }'">수정</button>
<button onclick="chkDelete(${read[0].board_id })">삭제</button>

<hr>
<span>이전글</span><a href="view.do?uid=${prev[0].board_id }">${prev[0].board_subject }</a>
<hr>
<span>다음글</span><a href="view.do?uid=${next[0].board_id }">${next[0].board_subject }</a>
<!-- cif로 다음글 이전글에 없을때 뽑아주기 -->

<button onclick="location.href = 'list.do'">목록보기</button>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>

	</c:otherwise>
</c:choose>