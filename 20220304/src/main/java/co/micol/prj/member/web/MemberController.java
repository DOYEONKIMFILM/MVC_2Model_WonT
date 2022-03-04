package co.micol.prj.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.micol.prj.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;
	
	@RequestMapping("/memberList.do")
	public String memberList(Model model) {
		model.addAttribute("members", memberDao.memberSelectList());
		return "member/memberList";
	}
	
	@RequestMapping("/aaa.do")
	public String aaa() {
		return "home/home";
	}
	
	// ResopnseBody = Restcontroller 와 같다.
	// return 뷰를 안타고 글자 그대로 나타난다
	@RequestMapping("/bbb.do")
	@ResponseBody
	public String bbb() {
		return "home/home";
	}
	
}
