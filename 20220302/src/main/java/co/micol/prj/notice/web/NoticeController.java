package co.micol.prj.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeDao;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		model.addAttribute("notices", noticeDao.noticeSelectList());
		return "notice/noticeList";
	}
	
	@RequestMapping("/noticeWriteForm.do") //단순히 입력하는 폼 호출
	public String noticeWriteForm() {
		return "notice/noticeWriteForm";
	}
	
	@PostMapping("/noticeWrite.do")
	public String noticeWrite(NoticeVO vo) {
		int n = noticeDao.noticeInsert(vo);
		if(n != 0) {							// redirect:
			return "redirect:noticeList.do";	//.*do 호출 시 redirect 를 꼭 써준다	
												// 페이지 말고, 컨트롤러에 있는 요청을 재 요청해준다
												// 따라서 noticeList.do 컨트롤러를 요청하여 돌려준다
		}
		return "notice/noticeError";
	}
	
	@PostMapping("/noticeSelect.do")
	public String noticeSelect(NoticeVO vo, Model model) {
		//model은 처리된 결과를 실어서 페이지로 보낸다
//		model.addAttribute("notice", noticeDao.noticeSelect(vo));

		vo = noticeDao.noticeSelect(vo);
		if(vo != null) {
			model.addAttribute("notice", vo);
			noticeDao.noticeHitUpdate(vo.getNoticeId());
			return "notice/noticeSelect";
		} else {
			model.addAttribute("message", "게시글이 존재하지 않습니다");
			return "notice/noticeError";
		}

	}
}
