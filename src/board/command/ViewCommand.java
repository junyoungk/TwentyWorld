package board.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.*;

public class ViewCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		BoardDAO dao = new BoardDAO();
		Board[] arr = null;
		
		ReplyDAO Replydao = new ReplyDAO();
		ReplyDTO[] replyarr = null;
		/*
		 * ReplyDAO Replydao = new ReplyDAO(); ReplyDTO[] Replyarr = null;
		 */
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		
		try {
		arr = dao.selectByUid(uid);
		request.setAttribute("read", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		/* shinhoonji */
		try {
			//트랜잭션 수행
			replyarr = Replydao.Replyselect();
			
			//"list" 란 name으로 request 에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("replylist", replyarr);
			
		} catch (SQLException e) {
			// 만약 cp 사용한다면
			// NamingException 도 처리 해야 함
			e.printStackTrace();
		}
		/* shinhoonji */
	}

}
