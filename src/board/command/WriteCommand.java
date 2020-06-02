package board.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.BoardDAO;

public class WriteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		BoardDAO dao = new BoardDAO();
		
		// 매개변수 받아오기
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String img = request.getParameter("img");
		String category = request.getParameter("category");
		int uid = Integer.parseInt(request.getParameter("uuid"));
		
		if( subject != null && subject.trim().length() > 0) {
			try {
				cnt = dao.insert(subject, content, img, category, uid);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		} // end if
			
		request.setAttribute("result", cnt);
	}

}
