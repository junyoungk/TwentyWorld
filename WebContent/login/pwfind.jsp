<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="CKJY.UserDAO"%>  


<%
	request.setCharacterEncoding("utf-8");  // 한글 인코딩 꼭!
%>
<jsp:useBean id="dto" class="CKJY.UserDTO" scope="page"/>
<jsp:setProperty property="user_name" name="dto"/>
<jsp:setProperty property="user_id" name="dto"/>
<jsp:setProperty property="user_jumin" name="dto"/>

  

 
 <% UserDAO userDAO = new UserDAO();
 String a  = userDAO.findPW(dto.getUser_name(), dto.getUser_id(),dto.getUser_jumin());

 %>

 
 <% if (a.equals("없음")) { %>
	<script>
		alert('일치하는 정보가 없습니다.');
		history.back();
	</script>
<% } else { %>
	<script>
		alert('회원님의 비밀번호:<%= a %>');
		history.back();
	</script>

<% } %>


   
