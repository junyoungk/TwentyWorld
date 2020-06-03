package Ticket.command;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Ticket.beans.Ticket;
import Ticket.beans.TicketDAO;
public class SelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		TicketDAO dao = new TicketDAO();
		Ticket [] arr = null;
		int id = Integer.parseInt(request.getParameter("id"));  // 매개변수 검증 필요

		try {
			arr = dao.selectByid(id);  // 읽기 only
			request.setAttribute("select", arr);
		} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다 
			e.printStackTrace();
		}
	}

}
