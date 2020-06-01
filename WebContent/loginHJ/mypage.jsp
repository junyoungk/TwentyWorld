<%@page import="SHJ.UserDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="SHJ.UserDAO"/>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>


<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
} 
%>

<% UserDTO [] arr = dao.readMypage(userID); %>

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
	int user_uid = arr[0].getUser_uid();
	String user_id = arr[0].getUser_id();
	String user_pw = arr[0].getUser_pw();
	String user_name = arr[0].getUser_name();
	String user_gender = arr[0].getUser_gender();
	String user_jumin = arr[0].getUser_jumin();
	int user_age = arr[0].getUser_age();
	int user_authorize = arr[0].getUser_authorize();
	String user_email = arr[0].getUser_email();
	String user_cardnum = arr[0].getUser_cardnum();
%>

<body>
 <h3>회원정보</h3>
  아이디 : <%= user_id %> <br>
  회원비밀번호 : <%= user_pw %> <br>
  고객명 : <%= user_name %> <br>
  성별 : <%= user_gender %> <br>
  주민번호 : <%= user_jumin %> <br>
  나이 : <%= user_age %> <br>
  권한 : <%= user_authorize %> <br>
  이메일 : <%= user_email %> <br>
  카드번호 : <%= user_cardnum %> <br>
  <hr>
  <button onclick="">회원정보 수정</button>
</body>
</html>