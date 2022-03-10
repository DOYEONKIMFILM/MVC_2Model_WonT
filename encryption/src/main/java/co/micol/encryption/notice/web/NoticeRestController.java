package co.micol.encryption.notice.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import co.micol.encryption.notice.service.NoticeReplyService;
import co.micol.encryption.notice.service.NoticeService;
import co.micol.encryption.notice.vo.NoticeReplyVO;
import co.micol.encryption.notice.vo.NoticeVO;

@RestController
public class NoticeRestController {
//	RestController = responsebody + mapping
	
	@Autowired
	private NoticeReplyService replyDao;
	
	@Autowired
	private NoticeService noticeDao;
	
	@PostMapping("/ajaxReplyInsert.do")
	public String ajaxReplyInsert(NoticeReplyVO vo) {
		int n = replyDao.noticeReplyInsert(vo);
		if(n != 0) {
			vo = replyDao.noticeReplyselectNo();
			return Integer.toString(vo.getReplyNo());
		} else {
			return null;
		}
	}
	
	@PostMapping("/ajaxReplyDelete.do")
	public String ajaxReplyDelete(NoticeReplyVO vo) {
		replyDao.noticeReplyDelete(vo);
		System.out.println(vo.getReplyId());
		return "Y";
	}
	
	@PostMapping("/ajaxNoticeSearch.do")	//검색하는 메소드
	public List<NoticeVO> ajaxNoticeSearch(@RequestParam("key") String key, @RequestParam("val") String val) {
		return noticeDao.noticeSearchList(key, val);
	}
	
	@PostMapping("/ajaxNoticeSort.do")	//정렬 시키는 메소드
	public List<NoticeVO> ajaxNoticeSort(@RequestParam("key") String key, @RequestParam("val") int val) {
		return noticeDao.noticeSelectListSort(key, val);
	}
}
