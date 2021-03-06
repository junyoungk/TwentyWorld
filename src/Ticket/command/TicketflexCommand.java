package Ticket.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import CKJY.UserDAO;
//import CKJY.UserDTO;
import Ticket.beans.Ticket;
import Ticket.beans.TicketDAO;

public class TicketflexCommand implements TicketCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		TicketDAO dao = new TicketDAO();
		Ticket[] arr = null; 
//		UserDAO dao1 = new UserDAO();
//		UserDTO[] arr1 = null; 
		
		try {
			//트랜잭션 수행
			arr = dao.flexselect();
//			arr1 = dao1.();
			
			//"list" 란 name으로 request 에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("flexTicketlist", arr);
//			request.setAttribute("flexUserlist", arr1);
			
		} catch (SQLException e) {
			// 만약 cp 사용한다면
			// NamingException 도 처리 해야 함
			e.printStackTrace();
		}
	}

}
