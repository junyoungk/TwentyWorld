<%@page import="CKJY.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
} 
	
	UserDAO dao = new UserDAO();
	dao.UserDelete(userID);
	
	session.invalidate();
	
	out.println("<script>");
	out.println("alert('그동안감사했습니다 수고링~!')");
	out.println("location.href('testmain.jsp')");
	out.println("</script>");
	
	
%>

			