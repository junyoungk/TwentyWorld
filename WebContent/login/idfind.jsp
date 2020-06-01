<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="CKJY.UserDAO"%>  


<%
	request.setCharacterEncoding("utf-8");  // 한글 인코딩 꼭!
%>
<jsp:useBean id="dto" class="CKJY.UserDTO" scope="page"/>
<jsp:setProperty property="user_name" name="dto"/>
<jsp:setProperty property="user_jumin" name="dto"/>

  

 
 <% UserDAO userDAO = new UserDAO();
 String a  = userDAO.findID(dto.getUser_name(), dto.getUser_jumin());

 %>

 
 <% if (a.equals("없음")) { %>
	<script>
		alert('가입된 아이디가 없습니다.');
		history.back();
	</script>
<% } else { %>
	<script>
		alert('회원님의 아이디:<%= a %>');
		history.back();
	</script>

<% } %>


   
