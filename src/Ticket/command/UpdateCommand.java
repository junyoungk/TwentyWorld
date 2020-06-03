package Ticket.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Ticket.beans.TicketDAO;

public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		TicketDAO dao = new TicketDAO();

		//입력한 값을 받아오기
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		String img = request.getParameter("img");

		// 유효성 체크  null 이거나, 빈문자열이면 이전화면으로 돌아가기
		if(name != null && name.trim().length() > 0){			
			try {			
				cnt = dao.update(id,name, price, img);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} // end if

		request.setAttribute("result", cnt);

	}

}
