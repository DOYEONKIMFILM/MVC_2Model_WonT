package co.micol.encryption.notice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.micol.encryption.notice.service.NoticeReplyMapper;
import co.micol.encryption.notice.service.NoticeReplyService;
import co.micol.encryption.notice.vo.NoticeReplyVO;

@Repository("replyDao")
public class NoticeReplyServiceImpl implements NoticeReplyService{
	@Autowired
	private NoticeReplyMapper map;

	@Override
	public List<NoticeReplyVO> noticeReplySelectList(NoticeReplyVO vo) {
		return map.noticeReplySelectList(vo);
	}

	@Override
	public int noticeReplyInsert(NoticeReplyVO vo) {
		return map.noticeReplyInsert(vo);
	}

	@Override
	public int noticeReplyUpdate(NoticeReplyVO vo) {
		return map.noticeReplyUpdate(vo);
	}

	@Override
	public int noticeReplyDelete(NoticeReplyVO vo) {
		return map.noticeReplyDelete(vo);
	}

	@Override
	public NoticeReplyVO noticeReplyselectNo() {
		return map.noticeReplyselectNo();
	}
	
	
}
