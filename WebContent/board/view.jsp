<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <%
	int userID = 0;
	if(session.getAttribute("userID") != null) {
		userID = Integer.parseInt(session.getAttribute("userID").toString());
	} 
	

%>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>읽기 ${read[0].board_subject }</title> <!-- title에 글제목 넣기 -->
<style>

</style>
</head>
<script>
function chkDelete(uid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'deleteOk.do?uid='+uid;
	}
}
function replyDelete(reply_id){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("댓글삭제");
	if(r){
		location.href = 'ReplydeleteOk.do?reply_id='+reply_id;
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
  <h3>세션값 : ${userID }</h3>

	<c:set var="user_uid" value="<%= userID %>" />
	<c:choose>
			<c:when test="${empty replyresult || fn:length(replyresult) == 0 }"></c:when>
			<c:otherwise>
			<c:forEach var="reply" items="${replyresult }">
			<div>
			
				${reply.reply_id } |
				${reply.writeName } |
				${reply.reply_useruid } |
				${reply.reply_comment } |
				${reply.reply_regdate }
				<c:choose>
					<c:when test="${user_uid == reply.reply_useruid }">
					<button type="button" id="replydelete" onclick="replyDelete(${reply.reply_id })">삭제</button>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</tr>	
			</div>	
			</c:forEach>
			</c:otherwise>
		</c:choose>

<script>
$('#replydelete').click(function(){
	$('#table_result').remove();
});
</script>
<form name="frm" action="ReplywriteOk.do" method="post">
<input type="hidden" name="reply_boarderid" value="${read[0].board_id }"/>
<input type="hidden" name="reply_useruid" value="<%=session.getAttribute("userID")%>"/>
<textarea name="reply_comment"></textarea>

<input type="submit" value="댓글게시"/>
</form>
<button onclick="location.href='update.do?uid=${read[0].board_id }'">수정</button>
<button onclick="chkDelete(${read[0].board_id })">삭제</button>

<hr>
<c:choose>
<c:when test="${prev != null }">
<span>이전글</span><a href="view.do?uid=${prev[0].board_id }">${prev[0].board_subject }</a>
</c:when>
<c:otherwise>
<span>이전글이 없습니다!</span>
</c:otherwise>
</c:choose>
<hr>
<span>다음글</span>
<c:choose>
<c:when test="${next != null }">
<a href="view.do?uid=${next[0].board_id }">${next[0].board_subject }</a>
</c:when>
<c:otherwise>
<span>다음글이 없습니다!</span>
</c:otherwise>
</c:choose>
<br>

<button onclick="location.href = 'list.do'">목록보기</button>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>

	</c:otherwise>
</c:choose>