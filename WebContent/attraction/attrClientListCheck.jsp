<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*"%>   
<%@ page import = "java.text.SimpleDateFormat" %>
<%
    int attr_location =  Integer.parseInt(request.getParameter("attr_location"));
	int attr_age = Integer.parseInt(request.getParameter("attr_age"));
%>

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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="attrCSS/attrDetail.css" rel="stylesheet" type="text/css">
    
</head>
<%
//최소나이 최대나이 정하기
int min_age = 0;
int max_age = 9999;
if(attr_age == 0){//0세~8세이하
	min_age = 0;max_age = 8;
}else if(attr_age == 1){//8세이상~65세미만
	min_age = 8;max_age = 65;
}else if(attr_age == 2){//65세이상~9999?(임시값)
	min_age = 65;max_age = 9999;
}else{//상관없음
	min_age = 0;max_age = 9999;}

// 키 상관없을으로 들어올 때 99999로 들어옵니다 
int attr_hei = 0;int min_height = 0; int max_height = 0;
	attr_hei = Integer.parseInt(request.getParameter("attr_height"));
if(attr_hei == 99999){
	min_height = 0; max_height = 9999;
}else{
	min_height = 0; max_height = 0;
}
%>
<!-- 확인용 : <%=attr_location %>/<%=attr_age %>/<%=attr_hei %>/ <%=min_height %> / <%= max_height%>
-->
<%
String text = "SELECT * FROM ATTRACTION";
if(attr_location != 2222){//위치 상관없음
	text+= " WHERE attr_location = " +attr_location  +
		" AND " + min_age +" <= attr_min_age AND attr_max_age <= " + max_age ;
		if(attr_hei == 99999){ //나이 상관없음
			text+= " AND "+ min_height +" <= attr_min_height AND attr_max_height <= " + max_height ;
			max_age = 0;
		}else{
			text+= " AND attr_min_height <= "+ attr_hei +" AND  "+ attr_hei +" <= attr_max_height ";
		}
}else{
	text+= " WHERE " + min_age +" <= attr_min_age AND attr_max_age <= " + max_age ;
		if(attr_hei == 99999){ //나이 상관없음
			text+= " AND "+ min_height +" <= attr_min_height AND attr_max_height <= " + max_height ;
			max_age = 0;
		}else{
			text+= " AND attr_min_height <= "+ attr_hei +" AND "+ attr_hei +" <= attr_max_height ";
		}
}
//text+=" ORDER BY attr_id DESC";
//out.println(text);

	try{
		Class.forName(DRIVER);
		//out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		//out.println("conn 성공" + "<br>");
		
		// 트랜잭션 실행
		pstmt = conn.prepareStatement(text);
		
		rs = pstmt.executeQuery();
		out.println("쿼리 성공<br>");
%>		
<body><hr> 
<%
		while(rs.next()){
			int uid = rs.getInt("attr_id");
			int attrlo = rs.getInt("attr_location");
			String attr_name = rs.getString("attr_name");
			String attr_cardimg = rs.getString("attr_cardimg");
			int attr_id = Integer.parseInt(rs.getString("attr_id"));
			%>
			<!-- 테이블 안에 있지 않아서 생기는 노란줄이라는데 ㅠ 일단 잘 돌아가기는 해요 '-`? -->
	 <div class="attr_menu_container">
      <div class="attr_box">
       <a href="attrClientView.doat?attr_id=<%=attr_id%>" style="text-decoration: none;">
        <div class="attr_imgBx" style="background-size: cover; background-image: url('<%=attr_cardimg%>');
        			background-repeat:no-repeat;" >
        </div>
        <div class="attr_menu_content">
           <h3 style="color : white;"><%=attr_name%></h3>
          <p style="color : bdbdbd;"> → 바로가기</p>
        </div>
      </div>
    </div>
				<%		
					} // end while
		%>		
		<br>
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

</body>
</html>



