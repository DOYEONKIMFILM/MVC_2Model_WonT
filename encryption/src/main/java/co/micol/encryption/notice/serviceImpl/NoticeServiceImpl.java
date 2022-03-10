package co.micol.encryption.notice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.micol.encryption.notice.service.NoticeMapper;
import co.micol.encryption.notice.service.NoticeService;
import co.micol.encryption.notice.vo.NoticeVO;

@Repository("noticeDao")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper map;
	
	@Override
	public List<NoticeVO> noticeSelectList() {
		return map.noticeSelectList();
	}

	@Override
	public NoticeVO noticeSelect(NoticeVO vo) {
		return map.noticeSelect(vo);
	}

	@Override
	public int noticeInsert(NoticeVO vo) {
		return map.noticeInsert(vo);
	}

	@Override
	public int noticeDelete(NoticeVO vo) {
		return map.noticeDelete(vo);
	}

	@Override
	public int noticeUpdate(NoticeVO vo) {
		return map.noticeUpdate(vo);
	}

	@Override
	public void noticeHitUpdate(int noticeId) {
		map.noticeHitUpdate(noticeId);
	}

	@Override
	public List<NoticeVO> noticeSearchList(String key, String val) {
		return map.noticeSearchList(key, val);
	}

	@Override
	public List<NoticeVO> noticeSelectListSort(String key, int val) {
		return map.noticeSelectListSort(key, val);
	}

}
