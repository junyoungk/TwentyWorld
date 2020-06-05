package attraction.write;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import attraction.beans.AttrWriteDAO;
import attraction.beans.AttrWriteDTO;
public class AttrSelectCommand implements AttrCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		AttrWriteDAO dao = new AttrWriteDAO();
		AttrWriteDTO [] arr = null;
		int attr_id = Integer.parseInt(request.getParameter("attr_id"));  // 매개변수 검증 필요

		try {
			arr = dao.selectByUid(attr_id);  // 읽기 only
			request.setAttribute("list", arr);
		} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다  
			e.printStackTrace();
		}
	}

}
