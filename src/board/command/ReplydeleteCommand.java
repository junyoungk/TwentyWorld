package board.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.ReplyDAO;

public class ReplydeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ReplyDAO replydao = new ReplyDAO();
		
		
		int reply_boarderid = Integer.parseInt(request.getParameter("reply_boarderid"));
		 
		int reply_id = Integer.parseInt(request.getParameter("reply_id"));
		
		try {
			cnt = replydao.deleteByReplyUid(reply_id,reply_boarderid);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}	
		request.setAttribute("replyDEL", cnt);
		 request.setAttribute("boarderid", reply_boarderid); 
	}
}