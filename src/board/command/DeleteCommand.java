package board.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.BoardDAO;
import board.beans.FileDAO;

public class DeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		BoardDAO dao = new BoardDAO();
		FileDAO fileDao = new FileDAO();
		
		// 매개변수 받아오기
		int uid = Integer.parseInt(request.getParameter("uid"));
			
			try {
				// 첨부파일 삭제
				// 1. 물리적인 파일 삭제
				// 2. test_file 테이블 삭제
				fileDao.deleteByWrUid(uid, request);
				
				// 3. 글 삭제
				cnt = dao.deleteByUid(uid);
			} catch(SQLException e) {
				e.printStackTrace();
			}		
			
		request.setAttribute("de", cnt);

	}

}
