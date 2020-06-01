<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SHJ.UserDTO"%>
<jsp:useBean id="dao" class="SHJ.UserDAO"/> 
<%
	request.setCharacterEncoding("utf-8"); 

	int user_uid = Integer.parseInt(request.getParameter("user_uid"));
	String user_pw = request.getParameter("user_pw");
	String user_email = request.getParameter("user_email");
	String user_cardnum = request.getParameter("user_cardnum");
%>

<%
	int cnt = dao.update(user_uid, user_pw, user_email, user_cardnum);
%>
<%-- 위 트랜잭션이 마무리 되면 페이지 보여주기 --%>
<% if(cnt == 0){ %>
	<script>
		alert('수정 실패');
		history.back();
	</script>
<% } else { %>
	<script>
		alert('수정 성공');
		location.href="mypage.jsp?";
	</script>
<% } %>