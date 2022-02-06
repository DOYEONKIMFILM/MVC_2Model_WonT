package co.micol.prj.notice.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.comm.DataSource;
import co.micol.prj.notice.service.NoticeMapper;
import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService {

	private SqlSession session = DataSource.getInstacne().openSession(true);
	private NoticeMapper map = session.getMapper(NoticeMapper.class);
	
	public List<NoticeVO> noticeSelectList() {
		return map.noticeSelectList();
	}

	public NoticeVO noticeSelect(NoticeVO vo) {
		//noticeHitUpdate(vo.getNoticeId()); //조회수 증가
		return map.noticeSelect(vo);
	}

	public int noticeInsert(NoticeVO vo) {
		return map.noticeInsert(vo);
	}

	public int noticeDelete(NoticeVO vo) {
		return map.noticeDelete(vo);
	}

	public int noticeUpdate(NoticeVO vo) {
		return map.noticeUpdate(vo);
	}

	public void noticeHitUpdate(int id) {
		map.noticeHitUpdate(id);
	}

	public List<NoticeVO> noticeSearch(String key, String str) {
		return map.noticeSearch(key, str);
	}

}
