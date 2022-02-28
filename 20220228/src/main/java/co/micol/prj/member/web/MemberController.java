package co.micol.prj.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.service.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberDao;
	
	@RequestMapping("/memberList.do")
	public String memberList(Model model) {	//멤버 전체 리스트 불러오기
		model.addAttribute("members", memberDao.memberSelectList());
		return "member/memberList";
	}
	
	@PostMapping("/memberSelect.do")
	public String memberSelect(MemberVO vo, Model model) {	//한명 데이터 가져오기
		model.addAttribute("member", memberDao.memberSelect(vo));
		return "member/memberSelect";
	}
}
