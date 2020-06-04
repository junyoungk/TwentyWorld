package board.command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.Board;
import board.beans.BoardDAO;
import board.beans.FileDAO;
import board.beans.FileDTO;
import board.beans.ReplyDAO;
import board.beans.ReplyDTO;

public class ViewCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		BoardDAO dao = new BoardDAO();
		Board[] arr = null;
		Board[] arr1 = null; // 이전글 이후글 관련 보드
		
		FileDAO fileDAO = new FileDAO();
		FileDTO [] fileArr = null;
		
		ReplyDAO Replydao = new ReplyDAO();
		ReplyDTO[] replyarr = null;
		/*
		 * ReplyDAO Replydao = new ReplyDAO(); ReplyDTO[] Replyarr = null;
		 */

		
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		
		try {
			arr = dao.selectByUid(uid);
			request.setAttribute("read", arr);
		
			dao = new BoardDAO();
			arr1 = dao.selectBySubjectPre(uid);
			request.setAttribute("prev", arr1);
			
			dao = new BoardDAO();
			arr1 = dao.selectBySubjectNext(uid);
			if(arr1 == null) {
				System.out.println("다음글이 없다!");
			}
			request.setAttribute("next", arr1);
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		try {
			if(arr != null && arr.length == 1) {
				fileArr = fileDAO.selectFileByWrUid(uid); // 첨부 파일 읽어오기
				
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
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
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
