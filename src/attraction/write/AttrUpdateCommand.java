package attraction.write;


import attraction.beans.AttrWriteDAO;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import javax.servlet.ServletContext;

//TODO 유효성체크!!!!!!!!!!!
public class AttrUpdateCommand implements AttrCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		AttrWriteDAO dao = new AttrWriteDAO();

		//이미지 추가
				ServletContext context = request.getServletContext();
				String saveDirectory = context.getRealPath("upload");
				
				int maxPostSize = 5 * 1024 * 1024;
				String encoding = "utf-8";
				FileRenamePolicy policy = new DefaultFileRenamePolicy();
				
				MultipartRequest multi = null;
				
				try {
					// 생성 단계에서 이미 파일 저장
					multi = new MultipartRequest(
							request,
							saveDirectory,
							maxPostSize,
							encoding,
							policy
							);
					
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				
				List<String> originalFileNames = new ArrayList<String>();
				List<String> fileSystemNames = new ArrayList<String>();
				
				Enumeration names = multi.getFileNames(); // file 타입의 name 추출
				while(names.hasMoreElements()) {
					String name = (String)names.nextElement();
					String originalFileName = multi.getOriginalFileName(name);
					String fileSystemName = multi.getFilesystemName(name);
					System.out.println(originalFileName + " -> " + fileSystemName);
					
					if(originalFileName != null && fileSystemName != null) {
						originalFileNames.add(originalFileName);
						fileSystemNames.add(fileSystemName);
					}
					System.out.println(originalFileName);
				}
				String x1 ="";
				String x2 = "";
				if (originalFileNames.size() != 0) {
				x1 = originalFileNames.get(0);
				x2 = originalFileNames.get(1);
				}
				System.out.println("x1 : " + x1);
				System.out.println("x2 : " + x2);
				
		//입력한 값을 받아오기
		int attr_id =  Integer.parseInt(multi.getParameter("attr_id"));
		System.out.println("id값 불러오기");
		System.out.println("attr_id" + attr_id);
		int attr_max =  Integer.parseInt(multi.getParameter("attr_max"));
		int attr_time =  Integer.parseInt(multi.getParameter("attr_time"));
		int attr_price =  Integer.parseInt(multi.getParameter("attr_price"));
		String attr_content = multi.getParameter("attr_content");
		String attr_name =  multi.getParameter("attr_name");
		
		int attr_location = Integer.parseInt(multi.getParameter("attr_location"));
		int attr_min_age = Integer.parseInt(multi.getParameter("attr_min_age"));
		int attr_max_age = Integer.parseInt(multi.getParameter("attr_max_age"));
		int attr_min_height = Integer.parseInt(multi.getParameter("attr_min_height"));
		int attr_max_height = Integer.parseInt(multi.getParameter("attr_max_height"));
		
		String attr_img = "../upload/" + x1;
		String attr_cardimg = "../upload/" + x2;

		// 유효성 체크  null 이거나, 빈문자열이면 이전화면으로 돌아가기
		if(attr_name != null && attr_name.trim().length() > 0){			
			try {			
				cnt = dao.update(attr_id, attr_max, attr_time, attr_price, 
						attr_content, attr_name, attr_location, 
						attr_min_age, attr_max_age, attr_min_height, 
						attr_max_height, 
						attr_img, attr_cardimg);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} // end if

		request.setAttribute("result1", attr_id);
		request.setAttribute("result", cnt);

	}

}
