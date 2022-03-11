package co.micol.prj.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;

	@RequestMapping("/memberList.do")
	public String memberList(Model model) {
		model.addAttribute("members", memberDao.memberSelectList());

		return "member/memberList";
	}

	@RequestMapping("/memberJoin.do")
	public String memberJoin(Model model) {

		return "member/memberJoin";
	}

	@RequestMapping("/memberSelect.do")
	public String memberSelect(MemberVO vo, Model model) {
		vo = memberDao.memberSelect(vo);

		if (vo != null) {
			model.addAttribute("member", vo);
			return "member/memberSelect";
		}
		return "member/memberSelect";
	}

	@PostMapping("/memberInsert.do")
	public String memberInsert(@ModelAttribute("jofrm") MemberVO vo) {
		System.out.println(vo);
		memberDao.memberInsert(vo);
		
		return "home/home";
	}

	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(MemberVO vo) {
		int n = memberDao.memberUpdate(vo);

		if (n != 0) {
			return "redirect:memberList.do";
		}
		return "redirect:memberUpdate.do";

	}

	@RequestMapping("/memberDelete.do")
	public String memberDelete(MemberVO vo) {
		int n = memberDao.memberDelete(vo);

		return "redirect:memberList.do";
	}

}
