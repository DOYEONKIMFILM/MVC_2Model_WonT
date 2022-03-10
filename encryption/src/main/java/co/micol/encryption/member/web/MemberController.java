package co.micol.encryption.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.encryption.comm.ShaEncript;
import co.micol.encryption.member.service.MemberService;
import co.micol.encryption.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberDao;
	
	@RequestMapping("/memberLoginForm.do")
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}
	
	@PostMapping("/memberLogin.do")
	public String memberLogin(MemberVO vo, Model model) {
//		현재 DB에 비밀번호가 암호화 되어있음. => sha encryption을 통해 내 비밀번호를 암호화해서 담아주기
		ShaEncript shaEncript = new ShaEncript();
		vo.setPassword(shaEncript.encryptSHA256(vo.getPassword()));	//패스워드암호화
		vo = memberDao.memberSelect(vo);
	
		if(vo!=null) {
			model.addAttribute("message", vo.getName()+"님 환영합니다");
		} else {
			model.addAttribute("message", "아이디 또는 패스워드가 틀렸습니다.");
		}
		return "member/memberLogin";
	}
}
	
