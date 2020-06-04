package Ticket.command;

import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Ticket.beans.Ticket;
import Ticket.beans.TicketDAO;

public class TicketViewCommand implements TicketCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		 
		int tid = Integer.parseInt(request.getParameter("id"));

		TicketDAO dao = new TicketDAO();
		Ticket[] arr = null;
		
		try {
		arr = dao.readByid(tid);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("read", arr);
		System.out.println(Arrays.toString(arr));
		
	}

}
