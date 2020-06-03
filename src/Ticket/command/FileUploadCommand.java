package Ticket.command;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.beans.FileDAO;
import board.beans.FileDTO;

public class FileUploadCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		FileDAO fileDao = new FileDAO();
		FileDTO [] fileArr = null;
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		FileInputStream in = null;
		ServletOutputStream sout = null;
		
		try {
			fileArr = fileDao.selectByUid(uid); // 특정 파일 정보 읽어 오기
			
			String fileSystemName = fileArr[0].getFile();
			String originalFileName = fileArr[0].getSource();
			
			String realPath = request.getServletContext().getRealPath("upload");
			String downloadFilePath = realPath + File.separator + fileSystemName;
			System.out.println(downloadFilePath);
			
			String fileType = request.getServletContext().getMimeType(downloadFilePath);
			
			// 파일 유형이 지정되지 않은 경우
			if(fileType == null) {
				fileType = "application/octet-stream";
			}
			
			response.setContentType(fileType);
			
			// 원본 파일명으로 다운 받을 수 있게 처리
			String enc = "utf-8";
			String encFileName = URLEncoder.encode(originalFileName, enc);
			
			response.setHeader("Content-Disposition", "attachment; filename=" + encFileName);
			
			File scrFile = new File(downloadFilePath);
			in = new FileInputStream(scrFile);
			sout = response.getOutputStream();
			
			byte [] buff = new byte[(int)scrFile.length()];
			int numRead = 0;
			int totalRead = 0;
			
			// 파일로부터 읽기
			while((numRead = in.read(buff, 0, buff.length)) != -1) {
				totalRead += numRead;
				sout.write(buff, 0, numRead);
			}
			
			System.out.println("전송 byte : " + totalRead + " bytes");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(sout != null) {
					sout.flush();
					sout.close();
				}
				if(in != null) {
					in.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}











