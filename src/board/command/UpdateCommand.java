package board.command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import board.beans.BoardDAO;
import board.beans.FileDAO;

public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		BoardDAO dao = new BoardDAO();
		FileDAO fileDao = new FileDAO(); // 첨부 파일
		
		//--------------------------------------------
		// 1. 업로드 파일(들)
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");
		
		int maxPostSize = 5 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		
		MultipartRequest multi = null;
		
		try {
			// 생성 단계에서 이미 파일 저장
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
		
		List<String> originalFileNames = new ArrayList<String>();
		List<String> fileSystemNames = new ArrayList<String>();
		
		Enumeration names = multi.getFileNames(); // file 타입의 name 추출
		while(names.hasMoreElements()) {
			String name = (String)names.nextElement();
			String originalFileName = multi.getOriginalFileName(name);
			String fileSystemName = multi.getFilesystemName(name);
			System.out.println(originalFileName + " -> " + fileSystemName);
			
			if(originalFileName != null && fileSystemName != null) {
				originalFileNames.add(originalFileName);
				fileSystemNames.add(fileSystemName);
			}
		}
		
		//----------------------------------------------
		// 2. 삭제될 첨부파일(들)
		String [] delfiles = multi.getParameterValues("delfile");
		if(delfiles != null && delfiles.length > 0) { // 삭제 대상의 파일이 있다면
			int [] delFileUids = new int[delfiles.length];
			
			for(int i =0; i<delFileUids.length; i++	) {
				delFileUids[i] = Integer.parseInt(delfiles[i]);
			}
			
			try {
				fileDao.deleteByUid(delFileUids, request); // 물리적인 삭제  + DB 테이블 삭제
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		//----------------------------------------------
		// 3. 글 수정
		int uid = Integer.parseInt(multi.getParameter("uid"));
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
 
			
			try {
				cnt = dao.update(uid, subject, content);
			} catch(SQLException e) {
				e.printStackTrace();
			}		
		
			//-------------------------------------
			// 추가된 첨부파일(들)
			fileDao = new FileDAO();
			
			try {
				fileDao.insert(uid, originalFileNames, fileSystemNames);
			} catch (SQLException e ) {
				e.printStackTrace();
			}
		
		request.setAttribute("uid", uid); // Multipart로 받은 뒤 updateOk.jsp로 넘겨야함
		request.setAttribute("seleok", cnt);

	} // end execute()
		

}


