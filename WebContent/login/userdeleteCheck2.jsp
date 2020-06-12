<%@page import="CKJY.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="CKJY.UserDTO" scope="page"/>
<jsp:setProperty property="user_name" name="dto"/>

<%
   String  a =  dto.getUser_name();
   UserDAO dao = new UserDAO();
   
   if(dao.UserDelete2(a) == 1){
	   %>
	    <script>
    alert("회원아이디:  <%= a %> 삭제 성공");
    history.back();
   </script>
	   <% 
   } else {
  %>   
    <script>
    alert("회원아이디:  <%= a %> 삭제 실패");
    history.back();
    </script>
   <% } %>
   
   
   
  
   

