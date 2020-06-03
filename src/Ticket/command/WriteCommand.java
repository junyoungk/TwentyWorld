package Ticket.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Ticket.beans.TicketDAO;;

public class WriteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		TicketDAO dao = new TicketDAO();
		
		// 매개변수 받아오기
		int id = Integer.parseInt(request.getParameter("idd"));
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		String img = request.getParameter("img");
		
		if( name != null && name.trim().length() > 0) {
			try {
				cnt = dao.insert(id, name, price, img);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		} // end if
			
		request.setAttribute("result", cnt);
	}

}
