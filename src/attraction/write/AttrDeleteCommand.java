package attraction.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import attraction.beans.AttrWriteDAO;


public class AttrDeleteCommand implements AttrCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		AttrWriteDAO dao = new AttrWriteDAO();

		//입력한 값을 받아오기
		int attr_id = Integer.parseInt(request.getParameter("attr_id"));

		try {			
			cnt = dao.deleteByUid(attr_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("result", cnt);
	}

}
