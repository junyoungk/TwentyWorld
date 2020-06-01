<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SHJ.UserDAO"%>    
<%
	request.setCharacterEncoding("utf-8");  // 한글 인코딩 꼭!
%>

<%
String id = (String)request.getParameter("id");
	UserDAO userDAO = new UserDAO();
	
	  if( userDAO.idCheckFunction(id) == 0){
		  	
			out.println("사용불가능.");
		
			
	  } else {
		  out.println("사용가능");
	  }

%>