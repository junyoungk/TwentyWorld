<%@page import="CKJY.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="CKJY.UserDTO" scope="page" />
<jsp:setProperty property="ticketnum" name="dto" />

<%
	int a = dto.getTicketnum();
	UserDAO dao = new UserDAO();

	if (dao.UserTicketDelete(a) == 1) {
%>
<script>
 alert("티켓고유번호:  <%=a%> 삭제 성공");
 history.back();
</script>
<%
	} else {
%>
<script>
 alert("티켓고유번호 :  <%=a%> 삭제 실패");
	history.back();
</script>
<%
	}
%>





