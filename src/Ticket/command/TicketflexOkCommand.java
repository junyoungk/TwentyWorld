package Ticket.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Ticket.beans.TicketDAO;

public class TicketflexOkCommand implements TicketCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		TicketDAO dao = new TicketDAO();
		

		// 입력한 값을 받아오기
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		System.out.println(uid); //null
		System.out.println(id);
		try {
			cnt = dao.insertBuy(uid,id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("flexOk", cnt);
	}

}