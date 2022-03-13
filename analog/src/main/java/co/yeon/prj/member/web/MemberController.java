package co.yeon.prj.member.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("/registerForm.do")
	public String registerForm() {
		return "member/registerForm";
	}
	

}
