package co.micol.prj.member.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.prj.log.service.LogService;
import co.micol.prj.log.service.LogVO;
import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;
	
	@Autowired
	private LogService logDao;

	@RequestMapping("/memberList.do")
	public String memberList(Model model, HttpSession session, LogVO logVo) {
		
		//logVo.setId((String) session.getAttribute("id"));
		logVo.setId("micol");
		logVo.setAction("R");
		logDao.insertLog(logVo);
		
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
	public String memberInsert(@ModelAttribute("jofrm") MemberVO vo, LogVO logVo) {
		System.out.println(vo);
		memberDao.memberInsert(vo);
		
		logVo.setId("micol");
		logVo.setAction("C");
		logDao.insertLog(logVo);
		
		return "home/home";
	}

	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(MemberVO vo, LogVO logVo) {
		int n = memberDao.memberUpdate(vo);
		logVo.setId("micol");
		logVo.setAction("U");
		logDao.insertLog(logVo);

		if (n != 0) {
			return "redirect:memberList.do";
		}
		return "redirect:memberUpdate.do";

	}

	@RequestMapping("/memberDelete.do")
	public String memberDelete(MemberVO vo, LogVO logVo) {
		int n = memberDao.memberDelete(vo);
		
		logVo.setId("micol");
		logVo.setAction("D");
		logDao.insertLog(logVo);
		
		return "redirect:memberList.do";
	}

}
