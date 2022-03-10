package co.micol.encryption.notice.service;

import java.util.List;

import co.micol.encryption.notice.vo.NoticeVO;

public interface NoticeService {
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	
//	hit 수 업데이트하는 메소드
	void noticeHitUpdate(int noticeId);
	List<NoticeVO> noticeSearchList(String key, String val);
	List<NoticeVO> noticeSelectListSort(String key, int val);
}
