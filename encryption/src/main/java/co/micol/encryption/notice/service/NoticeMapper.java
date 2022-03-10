package co.micol.encryption.notice.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.micol.encryption.notice.vo.NoticeVO;

public interface NoticeMapper {
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	
//	hit 수 업데이트하는 메소드
	void noticeHitUpdate(int noticeId);
	List<NoticeVO> noticeSearchList(@Param("key") String key, @Param("val") String val);
	List<NoticeVO> noticeSelectListSort(@Param("key") String key, @Param("val") int val);
}
