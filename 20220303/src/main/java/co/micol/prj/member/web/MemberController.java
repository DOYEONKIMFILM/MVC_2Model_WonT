package co.micol.prj.member.web;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;
	
	@Autowired
	private String upLoadPath;

	@RequestMapping("/memberList.do")
	public String memberList(Model model) {
		model.addAttribute("members", memberDao.memberSelectList());

		return "member/memberList";
	}

	@RequestMapping("/memberLogin.do")
	public String memberLogin(Model model) {

		return "member/memberLogin";
	}

	@RequestMapping("/memberJoin.do")
	public String memberJoin(Model model) {

		return "member/memberJoin";
	}

	@RequestMapping("/memberInsert.do")
	public String memberInsert(MemberVO vo, MultipartFile file) {
		String fileName = file.getOriginalFilename();	//원본파일명
		String id = UUID.randomUUID().toString();	//고유 유니크한 아이디
		
		String targetFile = id + fileName.substring(fileName.lastIndexOf(".")); //파일명 다른이름으로 저장, "."까지
		
		File target = new File(upLoadPath, targetFile);
		
		try {
			FileCopyUtils.copy(file.getBytes(), target); //파일전송
			targetFile = upLoadPath + File.separator + targetFile; //실제경로를 알려준다
			vo.setPicture(fileName);	//원본 파일명
			vo.setRpicture(targetFile);	// 변경된 파일명
			memberDao.memberInsert(vo);	//파일 올리기 (회원가입진행)
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "home/home";
	}

	@RequestMapping("/memberSelect.do")
	public String memberSelect(MemberVO vo, Model model) {
		vo = memberDao.memberSelect(vo);

		if (vo != null) {
			model.addAttribute("member", vo);
			return "member/memberSelect";
		}
		return "member/memberError";
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
