package board.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.*;

public class ViewCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		BoardDAO dao = new BoardDAO();
		Board[] arr = null;
		
		
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		try {
		arr = dao.selectByUid(uid);
		request.setAttribute("read", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

}
