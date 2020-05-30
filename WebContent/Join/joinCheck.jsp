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
		if(dto.getUser_id() == null  || dto.getUser_pw() == null || dto.getUser_name() == null ||
		dto.getUser_jumin() == null || dto.getUser_age() == 0 || dto.getUser_email() == null ||
		dto.getUser_gender() == null){
			out.println("<script>");
			out.println("alert('입력이 안된사항이 있습니다 다시확인해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(dto);
			
			
			out.println("<script>");
			out.println("alert('가입완료.')");
			out.println("location.href =  '../login/login.jsp'");
			out.println("</script>");
			
			
		}
			%>

</body>
</html>