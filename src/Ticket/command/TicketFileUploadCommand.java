package Ticket.command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Ticket.beans.FileDAO;
import Ticket.beans.TicketDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class TicketFileUploadCommand implements TicketCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		TicketDAO dao = new TicketDAO();
		FileDAO fileDao = new FileDAO();  // 첨부파일
		
		//---------------------------------------------
		// 1. MultipartRequest 생성 -> 파일 업로드 됨  
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");
		
		int maxPostSize = 5 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(
					request,
					saveDirectory,
					maxPostSize,
					encoding,
					policy
					);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		//---------------------------------------------
		// 2. 업로드된 파일의   '원본이름(들)' 과 '저장된 이름(들)' 받아오기		
		List<String> originalFileNames = new ArrayList<String>();
		List<String> fileSystemNames = new ArrayList<String>();
		
		Enumeration names = multi.getFileNames();  // type="file" 요소의 name들 추출
		while(names.hasMoreElements()) {
			String name = (String)names.nextElement();
			String originalFileName = multi.getOriginalFileName(name);
			String fileSystemName = multi.getFilesystemName(name);
			System.out.println("첨부파일: " + originalFileName + "->" + fileSystemName);
			
			if(originalFileName != null && fileSystemName != null) {
				originalFileNames.add(originalFileName);
				fileSystemNames.add(fileSystemName);
			}
			
		} // end while

		//-----------------------------------------------------------
		// 3. 삭제될 첨부파일(들) -> DB에서 삭제
		String [] delFiles = multi.getParameterValues("delfile");
		if(delFiles != null && delFiles.length > 0) {  // 삭제 대상의 파일이 있다면
			int [] delFileUids = new int[delFiles.length];
			
			for(int i = 0; i < delFileUids.length; i++) {
				delFileUids[i] = Integer.parseInt(delFiles[i]);
			}
			
			try {
				fileDao.deleteByUid(delFileUids, request); // 물리적 삭제 + DB 테이블 삭제
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} // end if

		//-------------------------------------------------------------
		//3. 입력한 값을 받아오기 --> 글 수정
		int uid = Integer.parseInt(multi.getParameter("uid")); // ★ MultipartRequest 객체에서 가져온다
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");

		// 유효성 체크  null 이거나, 빈문자열이면 이전화면으로 돌아가기
		if(subject != null && subject.trim().length() > 0){
			try {			
				cnt = dao.update(uid, subject, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} // end if

		//-------------------------------------------------
		// 4. 추가된 첨부파일(들)  -> DB 에 저장 
		fileDao = new FileDAO();
		try {
			fileDao.insert(uid, originalFileNames, fileSystemNames);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("uid", uid);   // Multipart 로 받은뒤 updateOk.jsp 로 넘겨야 함.
		request.setAttribute("result", cnt);

	} // end execute()
} // end Command










