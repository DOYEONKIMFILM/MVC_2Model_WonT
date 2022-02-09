package co.micol.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.serviceImpl.MemberServiceImpl;

public class IdCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 아이디 중복체크(Ajax 방법이용)
		MemberService memberDao = new MemberServiceImpl();
		String id = request.getParameter("id");
		boolean b = memberDao.isIdCheck(id);
		
		if(!b) {
			return "ajax:0"; //존재할때 false
		} else {
			return "ajax:1"; //존재하지 않을때 true
		}
	}

}
