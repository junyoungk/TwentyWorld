<%@page import="CKJY.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="CKJY.UserDTO" scope="page"/>
<jsp:setProperty property="user_uid" name="dto"/>

<%
   int  a =  dto.getUser_uid();
   

%>

<script>
alert(<%= a %>);
</script>
   
   
   
  
   

