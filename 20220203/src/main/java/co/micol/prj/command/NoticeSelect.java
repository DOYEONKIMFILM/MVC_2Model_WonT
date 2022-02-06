package co.micol.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.comm.Command;
import co.micol.prj.notice.service.NoticeService;
import co.micol.prj.notice.serviceImpl.NoticeServiceImpl;
import co.micol.prj.notice.vo.NoticeVO;

public class NoticeSelect implements Command {

	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 공지사항 내용보기
		NoticeService noticeDao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		
		vo.setNoticeId(Integer.valueOf(request.getParameter("noticeId")));	//jsp name변수 noticeId명 그대로 써줌
		
		vo = noticeDao.noticeSelect(vo);
		//request.setAttribute("notice", noticeDao.noticeSelect(vo)); //먼저 증가하고 가져옴. Impl에 조회수 증가할때 주석풀기
		
		// 조회수증가
		if(vo != null) {
			noticeDao.noticeHitUpdate(vo.getNoticeId());
			request.setAttribute("notice", vo);
		} else {
			request.setAttribute("message", "조회된 데이터가 없습니다.");
			return "notice/noticeError";
		}
		
		return "notice/noticeSelect";
	}

}
