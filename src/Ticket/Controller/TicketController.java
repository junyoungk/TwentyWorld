package Ticket.Controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Ticket.command.TicketCommand;
import Ticket.command.TicketDeleteCommand;
import Ticket.command.TicketListCommand;
import Ticket.command.TicketSelectCommand;
import Ticket.command.TicketUpdateCommand;
import Ticket.command.TicketViewCommand;
import Ticket.command.TicketWriteCommand;
import Ticket.command.TicketflexCommand;
import Ticket.command.TicketflexOkCommand;


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
		TicketCommand command = null;   // 어떠한 커맨드? --> 어떠한 로직 수행.
		
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
		case "/Ticket/Ticketlist.doi":
			command = new TicketListCommand();
			command.execute(request, response);
			viewPage = "/Ticket/Ticketlist.jsp";
			break;

		case "/Ticket/Ticketwrite.doi":
			viewPage="/Ticket/Ticketwrite.jsp";
			break;
			
		case "/Ticket/TicketwriteOk.doi":
			command = new TicketWriteCommand();
			command.execute(request, response);
			viewPage="/Ticket/TicketwriteOk.jsp";
			break;
		case "/Ticket/Ticketview.doi":
			command = new TicketViewCommand();
			command.execute(request, response);
			viewPage="/Ticket/Ticketview.jsp";
			break;
			
		case "/Ticket/Ticketupdate.doi":
			command = new TicketSelectCommand();  // '수정' 이지만, 일단 읽어오는것부터 시작이다.
			command.execute(request, response);
			viewPage = "/Ticket/Ticketupdate.jsp";
			break;

		case "/Ticket/TicketupdateOk.doi":
			command = new TicketUpdateCommand();
			command.execute(request, response);
			viewPage = "/Ticket/TicketupdateOk.jsp";
			break;  // 디버깅 훈련, 이 break를 없애고, 찾아보기

		case "/Ticket/TicketdeleteOk.doi":
			command = new TicketDeleteCommand();
			command.execute(request, response);
			viewPage = "/Ticket/TicketdeleteOk.jsp";
			break;
		case "/Ticket/Ticketflex.doi":
			command = new TicketflexCommand();
			command.execute(request, response);
			viewPage = "/Ticket/Ticketflex.jsp";
			break;
		case "/Ticket/TicketflexOk.doi":
			command = new TicketflexOkCommand();
			command.execute(request, response);
			viewPage = "/Ticket/TicketflexOk.jsp";
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
