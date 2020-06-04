<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// MultipartRequest 객체 생성 준비
	String saveDirectory = "C:\\tomcat\\upload";

	// 파일 저장경로
	// 서버에서(서블릿) 어디에 어느폴더에서 서블릿으로 변환되는지 알아내기
	ServletContext context = this.getServletContext();
	// 서블릿앙의 upload 폴더의 물리적인 경로 얻어오기
	//String saveDirectory = context.getRealPath("upload");


	System.out.println("업로드 경로: " + saveDirectory);
	
	int maxPostSize = 5 * 1024 * 1024; // POST 받기, 최대 크기 5M byte 
	String encoding = "utf-8";  // 인코딩
	FileRenamePolicy policy = new DefaultFileRenamePolicy();   // 업로딩 파일 이름 중복에 대한 rename 정책
	
	MultipartRequest multi = null;
	
	try{  // jsp 파일에서 예외를 반드시 catch 할 필요는 없지만..
		
		// MultipartRequest 생성단계에서 이미 파일은 저장됨.
		multi = new MultipartRequest(
				request,   // JSP 내부객체 request
				saveDirectory,    // 업로된 파일 저장 경로
				maxPostSize,     // 최대 파일 크기 (post 크기)
				encoding,
				policy 			// 중복이름의 파일 rename 객체
				);
		
		Enumeration names = null;
		
		// 1. Parameter name 들 추출
		names = multi.getParameterNames();  // 일반 form parameter name들 추출
		while(names.hasMoreElements()){
			String name = (String)names.nextElement();  // name
			String value = multi.getParameter(name);   // value
			out.println(name + " : " + value + "<br>");
		} // end while
		out.println("<hr>");
			
		// 2. File 들 추출
		names = multi.getFileNames();  // type="file" 요소 name 들 추출
		while(names.hasMoreElements()){
			String name = (String)names.nextElement();
			out.println("input name: " + name + "<br>");
			
			// 위 name 의 '업로드 원본 파일명'을 가져온다.
			String originalFileName = multi.getOriginalFileName(name);
			out.println("원본파일 이름: " + originalFileName + "<br>");
			out.println("<input type='hidden' name='originalFileName' value='" + originalFileName + "'");
			
			// 서버 시스템에 '저장된 파일명' 을 가져온다.
			String fileSystemName = multi.getFilesystemName(name);
			out.println("파일시스템 이름: " + fileSystemName + "<br>");
			out.println("<input type='hidden' name='fileSystemName' value='" + fileSystemName + "'");
			
			// 업로딩된 파일의 타일 : MIME 타입 (ex: image/png ...)
			String fileType = multi.getContentType(name);
			out.println("파일타입: " + fileType + "<br>");
			
			// 문자열 '파일이름' 이 name 에 들어온 상태
			// 문자열 파일이름을 통해 실제 파일 정보를 -> File객제로 가져오기
			File file = multi.getFile(name);
			if(file != null){
				long fileSize = file.length();  // 파일 크기 (byte)
				out.println("파일 크기: " + fileSize + " bytes<br>");
				
				// 이미지 파일 다루기
				BufferedImage bi = ImageIO.read(file);
				if(bi != null){  //  ★이미지 파일 판정 여부★
					int width = bi.getWidth();
					int height = bi.getHeight();
					out.println("이미지파일 WxH: " + width + " x " + height + "<br>");
				} else {
					out.println("이미지가 아닙니다<br>");
				}
			}
			out.println("<hr>");
			
		} // end while
		
		
			
	} catch(Exception e){
		e.printStackTrace();
		out.println("파일 처리 예외 발생<br>");
	}
%>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("등록 실패!!!!!!");
			history.back();   // 브라우저가 기억하는 직전 페이지(입력중 페이지로)
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("등록 성공, 리스트를 출력합니다");
			location.href = "Ticketlist.doi";
		</script>
	</c:otherwise>
</c:choose> 