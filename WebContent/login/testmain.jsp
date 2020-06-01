<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>


<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	} 

%>
	  <h3>세션값 : <%= userID %></h3>
	  
	  <% if (userID == null) { %>
      <div><a href="login.jsp">로그인</a></div>
        <div><a href="../join/join.jsp">회원가입</a></div>
	 <% } else { %>
	  <div><a href="mypage.jsp">마이페이지</a></div>
	  <div><a href="logoutCheck.jsp">로그아웃</a></div>
	  <% } %>
</body>
</html>