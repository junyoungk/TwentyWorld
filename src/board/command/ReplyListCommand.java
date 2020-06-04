package board.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.ReplyDAO;
import board.beans.ReplyDTO;

public class ReplyListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReplyDAO Replydao = new ReplyDAO();
		ReplyDTO[] replyarr = null;
		
		
	}

}
