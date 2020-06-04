package board.command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.FileDAO;
import board.beans.FileDTO;

public class WriCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		FileDAO fileDAO = new FileDAO();
		FileDTO [] fileArr = null;
		try {
				fileArr = fileDAO.selectFileByWrUid(bid); // 첨부 파일 읽어오기
				
				// 이미지 파일 여부 셋팅
				String realPath = "";
				String saveFolder = "upload";

				ServletContext context = request.getServletContext();
				realPath = context.getRealPath(saveFolder);		
				
				for(FileDTO fileDto : fileArr) {
					String downloadedFilePath = realPath + File.separator + fileDto.getFile();
					BufferedImage imgDate = ImageIO.read(new File(downloadedFilePath));
					if(imgDate != null) {
						fileDto.setImage(true); // 이미지 맞네
					}
				}
				request.setAttribute("file", fileArr);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
