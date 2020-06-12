<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>20's 어트랙션 작성 확인</title>
	</head>
</html>
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
	}else{
%>
<%  // Controller 로부터 결과 데이터 받음
	int cnt = (Integer)request.getAttribute("result");
%>

<% if(cnt == 0){ %>
	<script>
		alert('삭제 실패');
		history.back();
	</script>
<% } else { %>
	<script>
		alert('삭제 성공');
		location.href = "attrAdminListMain.doat";  <%-- 삭제후에는 list 로 가자 --%>
	</script>
<% } 
}%>



















