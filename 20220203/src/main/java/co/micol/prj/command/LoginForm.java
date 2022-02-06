package co.micol.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;

public class LoginForm implements Command {

	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 단순히 로그인 폼 호출
		return "member/memberLoginForm";
	}

}
