package co.micol.prj.notice.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.micol.prj.notice.vo.NoticeVO;

public interface NoticeMapper {

	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	
	
	void noticeHitUpdate(int id); //조회수 증가											//mapper에서 두개이상 인자기 있다면 @Param을 꼭붙이고 변수명을붙인다.
	List<NoticeVO> noticeSearch(@Param("key") String key, @Param("str") String str); //검색할 필드와 데이터를 전달받아서 검색, ex제목에서 OOO이들어간걸 다 보여달라
	
}
