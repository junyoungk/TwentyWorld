<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SHJ.UserDTO"%>
<jsp:useBean id="dao" class="SHJ.UserDAO"/> 

<%
	int user_uid = Integer.parseInt(request.getParameter("user_uid"));
%>

<%
	UserDTO [] arr = dao.selectByUid(user_uid); 
%>

<%
	if(arr == null || arr.length == 0){ 
%>
			<script>
				alert("해당 정보가 삭제되거나 없습니다");
				history.back();
			</script>
<%
		return;   // 더이상 JSP 프로세싱 하지 않고 종료
	} // end if
%>
<%
	String user_name = arr[0].getUser_name();
	String user_pw = arr[0].getUser_pw();
	String user_email = arr[0].getUser_email();
	String user_cardnum = arr[0].getUser_cardnum();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
</head>
<body>
<form name="frm" action="updateOk.jsp" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="user_uid" value="<%= user_uid %>"/>
고객 명 : <%= user_name %><br>
비밀번호 : 
<input type="text" name="user_pw" value="<%= user_pw %>"/><br>
이메일: <br>
<input type="email" name="user_email" value="<%= user_email %>" /><br>
카드 번호<input type="text" name="user_cardnum" value="<%= user_cardnum %>" /><br>
<br>
<input type="submit" value="수정"/>
</form>
</body>
</html>