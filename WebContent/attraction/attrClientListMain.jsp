<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>   
<%@ page import = "java.text.SimpleDateFormat" %>
<!-- 여기가 attr 메인!  -->
<%!
	// JDBC 관련 기본 객체변수
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // SELECT 결과, executeQuery() 
	int cnt = 0;   // DML 결과, executeUpdate()
	
	// Connection 에 필요한 값 세팅
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";  // JDBC 드라이버 클래스
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";  // DB 접속 URL
	final String USERID = "TEAM20";  // DB 접속 계정 정보
	final String USERPW = "TIGER20";
%>

<%!
	// 쿼리문 준비
	final String SQL_WRITE_SELECT = 
		"SELECT * FROM attraction ORDER BY attr_id DESC"; 
%>
<%
	try{
		Class.forName(DRIVER);
		//out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		//out.println("conn 성공" + "<br>");
		// 트랜잭션 실행
		pstmt = conn.prepareStatement(SQL_WRITE_SELECT);
		
		rs = pstmt.executeQuery();
		out.println("쿼리 성공<br>");
%>	
 <%
	int userID = 0;
	if(session.getAttribute("userID") != null) {
		userID = Integer.parseInt(session.getAttribute("userID").toString());
	} 
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link href="../login/CSS/style.css" rel="stylesheet" type="text/css">
<title>글 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
 select{
          width: 200px;
          padding: .8em .5em;
          border: 1px solid #999;
          font-family: inherit;
          background: url('https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716') no-repeat 95% 50%;
          border-radius: 0px;
          -webkit-appearance: none;
          -moz-appearance: none;
          appearance: none;
          }
          select::-ms-expand {
              display: block;
          }
          #attr_select{
              display:inline-block; margin: 10px;
          }
          #attr_search {
			  width: 140px;
			  height: 45px;
			  font-family: 'Roboto', sans-serif;
			  font-size: 11px;
			  text-transform: uppercase;
			  letter-spacing: 2.5px;
			  font-weight: 500;
			  color: #000;
			  background-color: #fff;
			  border: none;
			  border-radius: 45px;
			  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
			  transition: all 0.3s ease 0s;
			  cursor: pointer;
			  outline: none;
			  display:inline-block;
		  }
</style>
<link rel="stylesheet" href="attr_menu_card.css" type="text/css">

</head>
<body>
<div class="wrapper">
<div class="header">
        <div class="container">
          <div class="row">
            <div id="myNav" class="overlay">
              <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
              <div class="overlay-content">
                <a href="#">소개 / 오시는 길</a>
                <a href="#">어트랙션</a>
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
                    <a class="dropdown-item" href="#">소개 글 및 오시는 길</a>
                  </div>
                </li>
                <li class="nav-item list-group-item">
                  <a class="nav-link active dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">즐길 거리</a>
                  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a class="dropdown-item" href="#">어트랙션</a>
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
  
<div class="container">
<form id="frm" >
    <div id = "attr_select">
        <label>위치 : </label>
        <!-- <input type="text" name="number" id="number"> -->
        <select name="attr_location" id="attr_location">
			<option value="2222">상관없음</option>
			<option value="0">실내</option>
		    <option value="1">실외</option>
		</select>
    </div>
    
    <div id = "attr_select">
	    <label>나이 : </label>
    	<select name="attr_age" id="attr_age">
			<option value="2222">상관없음</option>
			<option value="0">8세이하</option>
		    <option value="1">8세이상~65세미만</option>
		    <option value="2">65세이상</option>
		</select>
    </div>
    
   <div id = "attr_select">
	    <label>키 : </label>
		 <input type="text" name="attr_height" id="attr_height"/>cm
    </div>
    
    <div id = "attr_select">
	  <button type="button" value="button" id="attr_search">검색</button>
	</div>
	<!-- ajaxReturn: 버튼을 누르면 동작함! -->
    <div id="ajaxReturn">결과 값</div>
</form>
    
    <!--  ajaxReturn0 : 처음에 전체 화면 보여주는 용도 (버튼을 눌러야 동작하기 때문에) 버튼 누르면 값 없어짐 -->
	<div id="ajaxReturn0">
<%
		while(rs.next()){
			int uid = rs.getInt("attr_id");
			String attr_name = rs.getString("attr_name");
			String attr_cardimg = rs.getString("attr_cardimg");
			int attr_id = Integer.parseInt(rs.getString("attr_id"));
%>
<!-- 테이블 안에 있지 않아서 생기는 노란줄이라는데 ㅠ 일단 잘 돌아가기는 해요 '-`? -->
    
     <div class="attr_menu_container">
      <div class="attr_box">
       <a href="attrClientView.doat?attr_id=<%=attr_id%>" style="text-decoration: none;">
        <div class="attr_imgBx">
          <img src="<%=attr_cardimg%>">
        </div>
        <div class="attr_menu_content">
          <h3><%=attr_name%></h3>
          <p>어트랙션 바로가기</p>
        </div>
      </div>
    </div>
		<%		
			} // end while
%>	<br>
<%
	} catch(Exception e){
		e.printStackTrace();
		// 예외 처리
	} finally {
		// 리소스 해제
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>

</div>
<button onclick="location.href='attrAdminListMain.doat'">관리자페이지로 이동(테스트용)</button>
</div>
  <%@ include file="../HF/footer.jsp" %>
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

<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
$(function () {
    $("#attr_search").click(function () {
    	var test = $("#attr_height").val();
    	var ttttest = 0;
    	
    	//값이 빈칸일 경우 값을  99999로 변경함
    	if(test == ""){
    		ttttest = 99999;
    		alert('값을 상관없음으로~~' + test + ttttest);
    	}else{
    		ttttest = $("#attr_height").val();
    	}
    	
    	//정규표현식 사용
    	var regId = /^[0-9]+$/;
    	var isValid = regId.test(ttttest);
    	
    	//정규표현식 사용
    	if(isValid){
    		alert('일단은 숫자입니다 ' + '값은 : ' + ttttest);
	    		$.ajax({
	            type : "get",
	            url : "attrClientListCheck.jsp",
	            data : {
	            	attr_location : $("#attr_location").val(),
	            	attr_age : $("#attr_age").val(),
	            	attr_height : ttttest,
	            },
	            success : function(data){
	                $("#ajaxReturn").html(data);
	                $("#ajaxReturn0").html("");
	                //$("#ajaxReturn").html("(ex)사용할 수 있는 ID입니다.");
	            },
	            error : function(){
	                alert("error");
	            }
	     	   });
    	}else{
    		alert('빈칸도 숫자도 아닙니다' + '값은 ' + ttttest);
    				alert('키에는 숫자만 입력해 주세요!');
    				$("#attr_height").html("");
    	}
    });
});
</script>
<<style>
@import url('https://fonts.googleapis.com/css?family=Poppins');



.attr_menu_container {
  max-width: 1000px;
  display: flex;
  margin: 50px 0;
  flex-wrap: wrap;
  justify-content: space-around;
  display:inline-block;
}

.attr_box {
  position: relative;
  width: 300px;
  height: 400px;
  margin: 15px;
  background: #ffffff;
  box-shadow: 0 30px 30px rgba(0,0,0,.5);
}

.attr_box .attr_imgBx {
  position: relative;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.attr_box .attr_imgBx img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: 0.5s;
}



.attr_box .attr_menu_content {
  position: absolute;
  bottom: 20px;
  left: 10%;
  width: 80%;
  height: 60px;
  background: #ffffffd2;
  transition: 0.5s;
  overflow: hidden;

  padding: 15px;
  box-sizing: border-box;
}

.attr_box:hover .attr_menu_content {
  width: 80%;
  height: 25%;
  bottom: 10px;
  left: 10%;
}

.attr_box .attr_menu_content h3 {
  margin: 0;
  padding: 0;
  font-size: 20px;
}

.attr_box .attr_menu_content p {
  margin: 10px 0 0;
  padding: 0;
  opacity: 0;
  line-height: 1.2em;
  transition: 0.5s;
  text-align: justify;
}

.attr_box:hover .attr_menu_content p {
  opacity: 1;
  transition-delay: 0.5s;
}
</style>












