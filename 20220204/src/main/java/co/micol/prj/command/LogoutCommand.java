package co.micol.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.micol.prj.comm.Command;

public class LogoutCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 로그아웃
		
		//1.세션불러오기
		HttpSession session = request.getSession();
		
		//2.세션삭제 -> 로그인에 담긴 모든정보를 끊어버리기때문에 결과적으로 로그아웃 기능이 된다.
		session.invalidate();
		
		return "main.do";
	}

}
