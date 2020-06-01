<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SHJ.UserDTO"%>
<jsp:useBean id="dao" class="SHJ.UserDAO"/> 

<%
	int uid = Integer.parseInt(request.getParameter("user_uid"));
%>

<%-- <% UserDTO [] arr = dao.readMypage(user_uid); %> --%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>

</body>
</html>