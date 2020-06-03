package board.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.ReplyDAO;

public class ReplyWriteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		ReplyDAO Replydao = new ReplyDAO();
		
		int reply_boarderid = Integer.parseInt(request.getParameter("reply_boarderid"));
		int reply_useruid = Integer.parseInt(request.getParameter("user_id"));
		String reply_comment = request.getParameter("reply_comment");
		
		if(reply_comment != null && reply_comment.trim().length() > 0) {
			try {
				cnt = Replydao.insert(reply_boarderid, reply_useruid, reply_comment);
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("replyresult", cnt);
	}
}
