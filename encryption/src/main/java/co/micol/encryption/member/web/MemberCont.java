package co.micol.encryption.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.encryption.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberCont {
	@Autowired
	private MemberService memberDao;
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/memberLoginForm";
	}

}
