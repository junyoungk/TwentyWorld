<%@page import="CKJY.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
		int userID = 0;
		if(session.getAttribute("userID") != null){
			userID = Integer.parseInt(session.getAttribute("userID").toString());
		}
		if(userID != 0){
			out.println("<script>");
			out.println("alert('로그인 상태')"); 
			out.println("location.href= 'testmain.jsp'");
			out.println("</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(dto.getUser_id(),dto.getUser_pw());
		
		if(result == 1 ) {
			int uid = userDAO.checkuid(dto.getUser_id());
			session.setAttribute("userID", uid);
			out.println("<script>");
			out.println("alert('로그인성공') ");
			out.println("location.href =  'testmain.jsp'");
			 
			out.println("</script>");
		} else if (result == 0) {
			out.println("<script>");
			out.println("alert('비밀번호를 확인해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		} else if (result == -1) {
			out.println("<script>");
			out.println("alert('존재하지 않는아이디')");
			out.println("history.back()");
			out.println("</script>");
		}
	%>

</body>
</html>