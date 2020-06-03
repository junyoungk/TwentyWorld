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

public class WriteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		BoardDAO dao = new BoardDAO();
		
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
		
		// 매개변수 받아오기
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String category = multi.getParameter("category");
		int uid = Integer.parseInt(multi.getParameter("uid"));
		
		if( subject != null && subject.trim().length() > 0) {
			try {
				cnt = dao.insert(subject, content, category, uid, originalFileNames, fileSystemNames);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		} // end if
			
		request.setAttribute("result", cnt);
	}

}
