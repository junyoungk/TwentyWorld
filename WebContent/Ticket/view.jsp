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
<title>읽기 ${read[0].ticket_name}</title> <!-- title에 글제목 넣기 -->
</head>
<script>
function chkDelete(id){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = 'deleteOk.doi?id='+id;
	}
}
</script>
<body>
<h2>읽기 ${read[0].ticket_name }</h2>
<br>
이용권분류 : ${read[0].ticket_id }<br>
이용권이름 : ${read[0].ticket_name }<br>
가격 : ${read[0].ticket_price }<br>
내용: <br>
<div>
${read[0].ticket_img }
</div>
<hr>
<br>
<button onclick="location.href='update.doi?id=${read[0].ticket_id }'">수정</button>
<button onclick="chkDelete(${read[0].ticket_id })">삭제</button>

<button onclick="location.href = 'list.doi'">목록보기</button>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>

	</c:otherwise>
</c:choose>













