<%@page import="CKJY.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CKJY.UserDTO" %>
<%
	request.setCharacterEncoding("utf-8");  // 한글 인코딩 꼭!
%>
<jsp:useBean id="dto" class="CKJY.UserDTO" scope="page"/>
<jsp:setProperty property="user_id" name="dto"/>
<jsp:setProperty property="user_pw" name="dto"/>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>

	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(dto.getUser_id(),dto.getUser_pw());
		
		if(result == 1 ) {
			out.println("<script>");
			out.println("location.href =  'main.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('야스')");
			out.println("</script>");
		}
	
	%>

</body>
</html>