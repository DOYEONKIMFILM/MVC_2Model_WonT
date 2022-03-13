package co.micol.encryption.notice.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.micol.encryption.notice.service.NoticeReplyService;
import co.micol.encryption.notice.service.NoticeService;
import co.micol.encryption.notice.vo.NoticeReplyVO;
import co.micol.encryption.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeDao;

	@Autowired
	private NoticeReplyService replyDao;

	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		model.addAttribute("notices", noticeDao.noticeSelectList());
		return "notice/noticeList";
	}

	@PostMapping("/noticeSelect.do")
	public String noticeSelect(NoticeVO vo, NoticeReplyVO rvo, Model model) {
		vo = noticeDao.noticeSelect(vo);
		rvo.setNotice_id(vo.getNoticeId());

		model.addAttribute("notice", vo);
		model.addAttribute("replys", replyDao.noticeReplySelectList(rvo));
		return "notice/noticeSelect";
	}
	
	@PostMapping("/ajaxtest.do")
	@ResponseBody
	public List<NoticeVO> ajaxtest() {
		return noticeDao.noticeSelectList();
	}

}
