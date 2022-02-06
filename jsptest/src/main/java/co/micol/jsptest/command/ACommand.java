package co.micol.jsptest.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.jsptest.common.Command;

public class ACommand implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// a.do로 들어오면서 처리 하는 곳
		return "member/a";	//폴더명/jsp페이지
		
	}

}
