<%@page import="CKJY.UserDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Enumeration"%>
<jsp:useBean id="dao" class="CKJY.UserDAO"/>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="CSS/style.css" rel="stylesheet" type="text/css">
    <title>Hello, world!</title>
</head>


<%
	int userID = 0;
	if(session.getAttribute("userID") != null) {
		userID = Integer.parseInt(session.getAttribute("userID").toString());
	} 
%>

<% UserDTO [] arr = dao.readMypage(userID); %> 
<% String []  a   = dao.writeList(userID);
   String [] writeListdate = dao.writeListDate(userID);
   int [] b = dao.writeListUID(userID);
   String [] replyList  = dao.replyList(userID);
   int [] replyBoard = dao.replyListUID(userID);
   String [] replyListdate = dao.writereplyDate(userID);
   String [] TicketList = dao.myTicketList(userID);
   int [] TicketNum = dao.myTicketNum(userID);
   
   
%>

<%
	if(arr == null || arr.length == 0){ 
%>
			<script>
				alert("해당 정보가 삭제되거나 없습니다");
				location.href = 'testmain.jsp';
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
	//String a = dao.findID("관리자", "1111111111111");
%>

	<body>
	   
		<div class="wrapper">
		<div class="header">
        <div class="container">
          <div class="row">
            <div id="myNav" class="overlay">
              <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
              <div class="overlay-content">
                <a href="../login/intro.jsp">20's World 소개</a>
                <a href="../login/howtocome.jsp">오시는길</a>
                <a href="../attraction/attrClientListMain.jsp">어트랙션</a>
                <a href="../board/list.do">자유게시판</a>
                 <h3>세션값 : <%= userID %></h3>
            <% if (userID == 0) { %>
              <a href="../login/login.jsp">로그인</a> 
              <a href="../join/join.jsp">회원가입</a>
               <% } else { %>
               <a href="../login/mypage.jsp">마이페이지</a>
               <a href="../login/logoutCheck.jsp">로그아웃</a>
                <% } %>
              </div>
            </div>

            <div class="d-block col-lg-1 logo text-center">
              <div class="mobile_ver d-block d-lg-none">
                <span class="mobile_btn" style="font-size:30px;cursor:pointer " onclick="openNav()"><i class="fas fa-bars"></i></span>
              </div>
              <a href="../login/testmain.jsp">
                <img src="http://adventure.lotteworld.com/common/images/logo.png" alt="logo">
              </a>
            </div>
            <div class="d-none d-lg-block col-lg-9 main_menu align-self-center">
              <ul class="nav  justify-content-center list-group list-group-horizontal">
                <li class="nav-item list-group-item dropdown">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">소개</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
 					 <a class="dropdown-item" href="../login/intro.jsp">20's World 소개</a>
                     <a class="dropdown-item" href="../login/howtocome.jsp">오시는 길</a>
                  </div>
                </li>
                <li class="nav-item list-group-item">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">즐길 거리</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="../attraction/attrClientListMain.jsp">어트랙션</a>
                  </div>
                </li>
                <li class="nav-item list-group-item">
                  <a class="nav-link active" href="../Ticket/Ticketflex.doi" role="button">예매 하기</a>
                </li>
                <li class="nav-item list-group-item">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">소통 게시판</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="../board/list.do">소통 게시판</a>
                  </div>
                </li>
              </ul>
            </div>
            <div class="d-none d-lg-block col-lg-2 text-center align-self-center">
            <h3>세션값 : <%= userID %></h3>
            <% if (userID == 0) { %>
              <a href="../login/login.jsp">로그인</a> |
              <a href="../join/join.jsp">회원가입</a>
               <% } else { %>
               <a href="../login/mypage.jsp">마이페이지</a>
               <a href="../login/logoutCheck.jsp">로그아웃</a>
                <% } %>
            </div>           
          </div>
        </div>
      </div>

		<div class="mypage container"style="min-height:700px; max-width:400px;">
			<div class="editInfo text-center" style="padding: 20px 0 20px 0;">
				<div class="text-center"><img src="logo4.jpg" alt="logo" width="200px" height="150px"></div>
				<h3 class="text-center">USER INFO & CHANGE</h3>
				<form name="frm" action="updateOk.jsp" method="post" onsubmit="return chkSubmit()">
					 <input type="hidden" name="user_uid" value="<%= user_uid %>"/>
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">이름</span>
					  </div>
					  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled="disabled" value="<%= user_name %>">
					</div>
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">아이디</span>
					  </div>
					  <input type="text" class="form-control" placeholder="Userid" aria-label="Userid" aria-describedby="basic-addon1" disabled="disabled" value="<%= user_id %>">
					</div>
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">비밀번호</span>
					  </div>
					  <input type="password" class="form-control"  aria-label="Userpw" aria-describedby="basic-addon1" value="">
					</div>
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">성별</span>
					  </div>
					  <input type="text" class="form-control"  aria-label="Usergender" aria-describedby="basic-addon1" disabled="disabled" value="<%= user_gender %>">
					</div>
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">나이</span>
					  </div>
					  <input type="number" class="form-control"  aria-label="Userage" aria-describedby="basic-addon1" disabled="disabled" value="<%= user_age %>">
					</div>
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">주민등록번호</span>
					  </div>
					  <input type="number" class="form-control"  aria-label="Userjumin" aria-describedby="basic-addon1" disabled="disabled" value="<%= user_jumin %>">
					</div>
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">이메일</span>
					  </div>
					  <input type="text" class="form-control" placeholder="Useremail" aria-label="Useremail" aria-describedby="basic-addon1" value="<%= user_email %>">
					</div>
					
					
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="basic-addon1">카드 번호</span>
					  </div>
					  <input type="text" class="form-control" placeholder="Usercardnum" aria-label="Usercardnum" aria-describedby="basic-addon1" value="<%= user_cardnum %>">
					</div>
					
				
					<button type="submit" value="수정" style="margin-top: 20px; width: 150px;" class="btn btn-secondary">수정</button>
				 </form>
				 <br>
				 <button type="button" onclick="location.href='userdeleteCheck.jsp'" class="btn btn-outline-danger">회원탈퇴</button>
				
			 </div>
			 
			</div> 
			 
			 <div class="container">
			 
  <div class="row">
    <div class="col-md-12 col-lg-4" style="border: 1px solid #ababab; margin: 10px;">
					<div class="text-center" style="padding: 25px;"><h5 style="font-weight: bolder;">글 작성 목록</h5><hr style="border: 1px solid darkgray">
			 <% for(int i=0; i<a.length; i++){
				 
				 if(a[i] == null) break;
				 out.println("<div style='float:right;'>");
				 out.println("<a href='../board/view.do?uid=" + b[i] +"'>");
				 out.println(a[i]);
				 
				 out.println("</a>");
				 out.println("&nbsp;&nbsp; &nbsp;&nbsp; ");
				 out.println("<span style='float:right;'>");
				 
				 out.println(writeListdate[i]);
				 out.println("</span>");
				 out.println("</div>");
				
				 out.println("<br>");
			 
			 }
			 %> 	 			 
			 
			 
			 </div>
    </div>
    <div class="col-md-12 col-lg-4" style="border: 1px solid #ababab; margin: 10px;">
					 <div class="text-center" style="padding: 25px;"><h5 style="font-weight: bolder;">댓글 작성 목록</h5><hr style="border: 1px solid darkgray">
			 <% for(int i=0; i<replyList.length; i++){
				 
				 if(replyList[i] == null) break;
				 out.println("<div style='float:right;'>");
				 out.println("<a href='../board/view.do?uid=" + replyBoard[i] +"'>");
				 out.println(replyList[i]);
				 out.println("</a>");
				 out.println("&nbsp;&nbsp; &nbsp;&nbsp; ");
				 out.println("<span style='float:right;'>");
				 out.println(replyListdate[i]);
				 out.println("</span>");
				 out.println("</div>");
				
				 out.println("<br>");
			 }
			 %> 	 			 
			 
			 
			 </div>
    </div>
    <div class="col-md-12 col-lg-3" style="border: 1px solid #ababab; margin: 10px;">
		  <div class="text-center" style="padding: 25px;"><h5 style="font-weight: bolder;">예매 목록</h5><hr style="border: 1px solid darkgray">
			 <% for(int i=0; i<TicketList.length; i++){
				 
				 if(TicketList[i] == null) break;
				 out.println("예매 : " + TicketList[i]);
				 out.println(" / 번호: " + TicketNum[i]+ "<br>");
				 
			 
			 }
			 %> 	 			 
			 
			 
			 </div>
    </div>
  </div>
</div>
<% if (userID == 1) {  %>
			 <div class="container">
			<div class="row">
			 <div class="col-lg-12 text-center" style="margin: 30px 0px 30px 0px"><h3 style="padding: 20px 0;">관리자 목록입니다.</h3></div>
    		<div class="col-md-12 col-lg-6 text-center">
    			<div class="row">
    				
			   
			    <div class="col-3">
			    <button  class="btn btn-outline-secondary" onclick="location.href='../Ticket/Ticketlist.doi'">티켓목록</button>
			    </div>
			    <div class="col-3">
			    <button  class="btn btn-outline-secondary" onclick="location.href='../Ticket/Ticketwrite.doi'">티켓등록</button>
			    </div>
			    <div class="col-3">
			    <button  class="btn btn-outline-secondary" onclick="location.href='../attraction/attrAdminListMain.doat'">기구목록 </button>
			    </div>
			    <div class="col-3">
			    	<button  class="btn btn-outline-secondary" onclick="location.href='../attraction/attrWrite.doat'">기구등록 </button>
			    </div>
			 	
			 </div>
    		</div>
    		
    		<div class="col-md-12 col-lg-6">
    			<div class="row">
    				<div class="col-6" style="padding: 30px 0px;">
    					
    				 <form method="post" action="userdeleteCheck2.jsp" class="text-center">
					
					<input type="number" id="user_uid" name="user_uid" placeholder="삭제할 회원 uid 입력" style="margin-bottom: 12px;s"><br>
					
				
					 <button type="submit" value="계정삭제" class="btn btn-outline-danger">계정 삭제</button>
				</form>
				</div>
				<div class="col-6" style="padding: 30px 0px;">
				 <form method="post" action="userticketDelete.jsp" class="text-center">
					
					<input type="number" id="ticketnum" name="ticketnum" placeholder="삭제 티켓 번호 입력" style="margin-bottom: 12px;"><br>
				    
				
					
					 <button type="submit" value="티켓삭제" class="btn btn-outline-danger">티켓 삭제</button>
				</form>
			 	</div>
			  	<% }
			 %>
			 </div>
    		</div>
    		</div>
			 
			 
</div>
			 	
					 
			 
			

			
			  
	
		
		<%@ include file="../HF/footer.jsp" %>
	    </div>
    <script>
      function openNav() {
        document.getElementById("myNav").style.width = "60%";
      }
      
      function closeNav() {
        document.getElementById("myNav").style.width = "0%";
      }
      </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>	