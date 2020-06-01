package board.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.Board;
import board.beans.BoardDAO;

public class ViewCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int uid = Integer.parseInt(request.getParameter("uid"));

		BoardDAO dao = new BoardDAO();
		Board[] arr = null;
		
		try {
		arr = dao.selectByUid(uid);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("read", arr);
		
		
	}

}
