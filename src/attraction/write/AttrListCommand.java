package attraction.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import attraction.beans.AttrWriteDAO;
import attraction.beans.AttrWriteDTO;

public class AttrListCommand implements AttrCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		AttrWriteDAO dao = new AttrWriteDAO();  // DAO 객체 생성
		AttrWriteDTO [] arr = null;  
		
		try {
			// 트랜잭션 수행
			arr = dao.select();
			
			// "list" 란 name 으로 request 에 arr 값 전달
			// 즉 request 에 담아서 컨트롤러에 전달되는 셈.
			request.setAttribute("list", arr);
			
		} catch(SQLException e) {
			// 만약 CP 사용한다면
			// NamingException 도 처리 해야 함.
			
			e.printStackTrace();
		}
	}
}












