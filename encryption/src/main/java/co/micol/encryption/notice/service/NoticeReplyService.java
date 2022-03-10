package co.micol.encryption.notice.service;

import java.util.List;

import co.micol.encryption.notice.vo.NoticeReplyVO;

public interface NoticeReplyService {
	List<NoticeReplyVO> noticeReplySelectList(NoticeReplyVO vo);	// 내 글에 대한 전체 댓글 출력
	int noticeReplyInsert(NoticeReplyVO vo);	// 댓글 입력
	int noticeReplyUpdate(NoticeReplyVO vo);	// 댓글 수정
	int noticeReplyDelete(NoticeReplyVO vo);	// 댓글 삭제
	
	NoticeReplyVO noticeReplyselectNo();		// 최신글 key값 찾기
}
