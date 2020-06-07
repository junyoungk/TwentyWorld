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
		out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공" + "<br>");
		
		// 트랜잭션 실행
		pstmt = conn.prepareStatement(SQL_WRITE_SELECT);
		
		rs = pstmt.executeQuery();
		out.println("쿼리 성공<br>");
%>	


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>글 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<h1>**사용자페이지** ListMain</h1>

<form id="frm" >
    <style>
    /* 버튼 css? */
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
                display: none;
            }
            #attr_select{
                display:inline-block; margin: 10px;
            }
    </style>
    <style>
	/* 검색버튼 */
	
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
    	<select name="attr_height" id="attr_height">
			<option value="2222">상관없음</option>
			<option value="0">110미만</option>
			<option value="1">110이상~190미만</option>
		    <option value="2">190이상</option>
		</select>
    </div>
    
    <div>
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
	
    <div id = "attr_menu" style="width: 250px;width:200px; border:5px ridge burlywood;
                 display:inline-block; margin: 10px;">
        <a href="attrClientView.doat?attr_id=<%=attr_id%>" style="text-decoration: none;">
            <div id="item_img" style="height:200px; width:200px; background-position:center;
                    background-image:url(<%=attr_cardimg%>); 
                    background-size: cover;">
            </div>
            <div id="item_name" style="width: 50px; width:200px; color: dimgray; margin: 10px;
            font-family: 'NotoSans-Bold', '맑은 고딕', 'Malgun Gothic', sans-serif;"><b><%=attr_name%></b></div>
            <div id="attr_uid">attr_id 확인용 : <%=uid%></div>
        </a>
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
</body>
</html>

<script>

$(function () {
    $("#attr_search").click(function () {
        $.ajax({
            
            type : "get",
            url : "attrClientListCheck.jsp",
            //여러개 데이터 보낼 때 Json 방식
            data : {
            	attr_location : $("#attr_location").val(),
            	attr_age : $("#attr_age").val(),
            	attr_height : $("#attr_height").val(),
            },
            success : function(data){
                //check.jsp에서 DB확인해서 출력은 index에서
                $("#ajaxReturn").html(data);
                $("#ajaxReturn0").html("");
                //$("#ajaxReturn").html("(ex)사용할 수 있는 ID입니다.");
            },
            error : function(){
                alert("error");
            }
        });
        
    });
});

</script>












