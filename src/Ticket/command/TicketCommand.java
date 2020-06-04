package Ticket.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface TicketCommand {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
 