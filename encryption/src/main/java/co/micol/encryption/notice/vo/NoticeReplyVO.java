package co.micol.encryption.notice.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeReplyVO {
	private int replyNo;			// 댓글순번
	private int notice_id;			// 원글아이디
	private String replyId;			// 댓글작성자
	private String replyContents;	// 댓글내용
}
