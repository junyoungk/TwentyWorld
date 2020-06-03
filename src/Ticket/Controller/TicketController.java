package Ticket.Controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Ticket.command.Command;
import Ticket.command.DeleteCommand;
import Ticket.command.FileUploadCommand;
import Ticket.command.ListCommand;
import Ticket.command.SelectCommand;
import Ticket.command.UpdateCommand;
import Ticket.command.ViewCommand;
import Ticket.command.WriteCommand;


@WebServlet("*.doi")
public class TicketController extends HttpServlet{
	private static final long serialVersionUID = 1L;
     
    public TicketController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo() 호출");
		
		request.setCharacterEncoding("UTF-8");
		
		// 컨트롤러는 다음 두개를 선택해야 한다.
		String viewPage = null;   // 어떠한 뷰? --> 페이지
		Command command = null;   // 어떠한 커맨드? --> 어떠한 로직 수행.
		
		// URL로부터 URI, ContextPath, Command 분리 
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		
		// 컨트롤러는 커맨드에 따라, 로직을 수행하고
		// 결과를 내보낼 view 를 결정한다
		switch(com) {
		case "/Ticket/list.doi":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "/Ticket/list.jsp";
			break;

		case "/Ticket/write.doi":
			viewPage="/Ticket/write.jsp";
			break;
			
		case "/Ticket/writeOk.doi":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage="/Ticket/writeOk.jsp";
			break;
		case "/Ticket/view.doi":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage="/Ticket/view.jsp";
			break;
			
		case "/Ticket/fileUpload.doi":
			new FileUploadCommand().execute(request, response);
			break;
		case "/Ticket/update.doi":
			command = new SelectCommand();  // '수정' 이지만, 일단 읽어오는것부터 시작이다.
			command.execute(request, response);
			viewPage = "/Ticket/update.jsp";
			break;

		case "/Ticket/updateOk.doi":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "/Ticket/updateOk.jsp";
			break;  // 디버깅 훈련, 이 break를 없애고, 찾아보기

		case "/Ticket/deleteOk.doi":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "/Ticket/deleteOk.jsp";
			break;
			
		// 파일 다운로드!
//		case "/Ticket/download.doi":
//			command = new DownloadCommand();
//			command.execute(request, response);
//			// 굳이 view 필요하지 않다.
//			break;
			
		} // end switch
		
		// request 를 위에서 결정된 view 에 forward 해줌.
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
	} // end actionDo()

}
