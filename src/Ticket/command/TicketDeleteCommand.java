package Ticket.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Ticket.beans.TicketDAO;


public class TicketDeleteCommand implements TicketCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		TicketDAO dao = new TicketDAO();

		//입력한 값을 받아오기
		int id = Integer.parseInt(request.getParameter("id"));

		try {			
			cnt = dao.deleteByid(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("delete", cnt);
	}

}
