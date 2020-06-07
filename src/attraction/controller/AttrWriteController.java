package attraction.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import attraction.write.*;

@WebServlet("*.doat")
public class AttrWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AttrWriteController() {
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
		AttrCommand command = null;   // 어떠한 커맨드? --> 어떠한 로직 수행.
		
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
		case "/attraction/attrAdminListMain.doat":
			command = new AttrListCommand();
			command.execute(request, response);
			viewPage = "/attraction/attrAdminListMain.jsp";
			break;
			
		case "/attraction/attrClientListMain.doat":
			command = new AttrListCommand();
			command.execute(request, response);
			viewPage = "/attraction/attrClientListMain.jsp";
			break;
			
		case "/attraction/attrWrite.doat":
			viewPage = "/attraction/attrWrite.jsp";
			break;
			
		case "/attraction/attrWriteOk.doat":
			command = new AttrWriteCommand();
			command.execute(request, response);
			viewPage = "/attraction/attrWriteOk.jsp";
			break;		
			
		case "/attraction/attrClientView.doat":
			command = new AttrViewCommand();
			command.execute(request, response);
			viewPage = "/attraction/attrClientView.jsp";
			break;	
			
		case "/attraction/attrAdminView.doat":
			command = new AttrViewCommand();
			command.execute(request, response);
			viewPage = "/attraction/attrAdminView.jsp";
			break;	
			
		case "/attraction/attrUpdate.doat":
			command = new AttrSelectCommand();  // '수정' 이지만, 일단 읽어오는것부터 시작이다.
			command.execute(request, response);
			viewPage = "/attraction/attrUpdate.jsp";
			break;

		case "/attraction/attrUpdateOk.doat":
			command = new AttrUpdateCommand();
			command.execute(request, response);
			viewPage = "/attraction/attrUpdateOk.jsp";
			break;  // 디버깅 훈련, 이 break를 없애고, 찾아보기

		case "/attraction/attrDeleteOk.doat":
			command = new AttrDeleteCommand();
			command.execute(request, response);
			viewPage = "/attraction/attrDeleteOk.jsp";
			break;	
			
		} // end switch
		
		// request 를 위에서 결정된 view 에 forward 해줌.
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
	} // end actionDo()

}





























