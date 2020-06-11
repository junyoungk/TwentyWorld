<%@page import="CKJY.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CKJY.UserDTO" %>
<%
	request.setCharacterEncoding("utf-8");  // 한글 인코딩 꼭!
%>


 <!-- Bootstrap CSS -->
   
<jsp:useBean id="dto" class="CKJY.UserDTO" scope="page"/>
<jsp:setProperty property="user_id" name="dto"/>
<jsp:setProperty property="user_pw" name="dto"/>
<jsp:setProperty property="user_name" name="dto"/>
<jsp:setProperty property="user_gender" name="dto"/>
<jsp:setProperty property="user_jumin" name="dto"/>
<jsp:setProperty property="user_age" name="dto"/>
<jsp:setProperty property="user_email" name="dto"/>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href = 'testmain.jsp';
	</script>


</body>
</html>