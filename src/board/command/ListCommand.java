package board.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.Board;
import board.beans.BoardDAO;

public class ListCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		BoardDAO dao = new BoardDAO();
		Board[] arr = null;
		Board[] arr1 = null;
		
		String categoryS = "";
		int category = 0;
		
		int curPage = 1;   // 현재 페이지 (디폴트 1 page)
		
		// 현재 몇 페이지인지 parameter 받아오기 + 검증
		String pageParam = request.getParameter("page");
		if(pageParam == null) {
			pageParam = "1";
		}
		
		if(pageParam != null && !pageParam.trim().equals("")){
			try{ 
				// 1이상의 자연수 이어야 한다
				int p = Integer.parseInt(pageParam);
				if(p > 0) curPage = p;
				request.setAttribute("page", curPage);
			} catch(NumberFormatException e){
				// page parameter 오류는 별도의 exception 처리 안함 
			}
		} // end if
		int fromRow = (curPage - 1) * 10 + 1;
		
		String param = request.getParameter("col");
		String param1 = request.getParameter("word");
		
		
		if(request.getParameter("category") == null) {
			categoryS = "";
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
			if(categoryS.equals("전체") || categoryS.equals("")) {
			//트랜잭션 수행
			cnt = dao.countAll();
			int totalPage = (int)Math.ceil(cnt / (double)10);
			
			dao = new BoardDAO();
			arr = dao.SelectByPages(fromRow, 10);
			//"list" 란 name으로 request 에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈
			request.setAttribute("list", arr);
			request.setAttribute("cnt", totalPage);
			} else {
			cnt = dao.countAllByCategory(categoryS);
			int totalPage = (int)Math.ceil(cnt / (double)10);
				
			dao = new BoardDAO();	
			arr = dao.selectByCategory(categoryS, fromRow, 10);
			request.setAttribute("list", arr);
			request.setAttribute("cnt", totalPage);
			}
			
		} catch (SQLException e) {
			// 만약 cp 사용한다면
			// NamingException 도 처리 해야 함
			e.printStackTrace();
		}
		
		try {
			if((param != null && param.trim().length() > 0) && (param1 != null && param1.trim().length() > 0)) {
				String col = param;
				String word = param1;
				
				dao = new BoardDAO();	
				cnt = dao.countAllBySearch(col, word);
				int totalPage = (int)Math.ceil(cnt / (double)10);
					
				dao = new BoardDAO();
				arr1 = dao.selectBySearch(col, word, fromRow, 10);
				request.setAttribute("list", arr1);
				request.setAttribute("cnt", totalPage);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
