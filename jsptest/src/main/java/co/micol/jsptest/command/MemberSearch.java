package co.micol.jsptest.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.jsptest.common.Command;
import co.micol.jsptest.member.service.MemberService;
import co.micol.jsptest.member.service.MemberVO;
import co.micol.jsptest.member.serviceImpl.MemberServiceImpl;

public class MemberSearch implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		// 한명 데이터 조회
		MemberService memberDao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		
		vo.setId("hong"); // 검색할 아이디 입력
		request.setAttribute("member", memberDao.memberSelect(vo));	// 한명 데이터 서치
		
		return "member/memberSearch";
	}

}
