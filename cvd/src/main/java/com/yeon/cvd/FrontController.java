package com.yeon.cvd;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yeon.cvd.common.Command;
import com.yeon.cvd.controller.LogOutController;
import com.yeon.cvd.controller.LoginController;
import com.yeon.cvd.controller.LoginFormController;
import com.yeon.cvd.controller.MainController;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();
   
    public FrontController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		// 초기값 등록 -> 1. 단 한번만 실행
		map.put("/main.do", new MainController());
		map.put("/loginForm.do", new LoginFormController());
		map.put("/login.do", new LoginController());
		map.put("/logout.do", new LogOutController());
		
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2. init 첫 실행 후 계속 2번째 service 부분 실행 <요청 처리 구간>
		// URL: http://naver.com/search/aa.jsp

		// DOMAIN: naver.com
		// URI: /search/aa.jsp
		// contextPath: /search
		// 요청하는 곳: /aa.jsp
		
		request.setCharacterEncoding("UTF-8");	//한글깨짐 방지
		String uri = request.getRequestURI();	// URI 값
		String contextPath = request.getContextPath(); // 루트를 구함
		String page = uri.substring(contextPath.length()); // contextPath 길이 만큼 잘라서 jsp부분을 잘라서 실행
		
		Command command = map.get(page); // 요청을 map에서 찾아온다
		String viewPage = command.run(request, response);	//요청을 처리하는 command 호출
		
		// 만약 페이지가 null이 아니거나 do로 끝난다면
		if(viewPage != null && !viewPage.endsWith(".do")) {
			viewPage = "WEB-INF/views/" + viewPage + ".jsp"; //이렇게 만들어라
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage); //서버에서 접속-> 브라우저로 결과 돌림
		dispatcher.forward(request, response);
	}

}
