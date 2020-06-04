package board.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.Board;
import board.beans.BoardDAO;

public class ListCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		BoardDAO dao = new BoardDAO();
		Board[] arr = null;
		String categoryS = "";
		int category = 0;
		
		if(request.getParameter("category") == null) {
			categoryS = "전체";
		} else {
			category = Integer.parseInt(request.getParameter("category"));
		}
		
		switch(category) {
		case 1:
			categoryS = "전체";
			break;
		case 2:
			categoryS = "공지";
			break;
		case 3:
			categoryS = "행사";
			break;
		case 4:
			categoryS = "자유";
			break;
		case 5:
			categoryS = "기타";
			break;
		}
		
		try {
			if(categoryS.equals("전체")) {
			//트랜잭션 수행
			arr = dao.select();
			//"list" 란 name으로 request 에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("list", arr);
			} else {
			arr = dao.selectByCategory(categoryS);
			request.setAttribute("list", arr);
			}
		} catch (SQLException e) {
			// 만약 cp 사용한다면
			// NamingException 도 처리 해야 함
			e.printStackTrace();
		}
		
		
	}

}
