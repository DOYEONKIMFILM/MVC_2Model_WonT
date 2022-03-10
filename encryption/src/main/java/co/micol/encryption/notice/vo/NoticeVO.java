package co.micol.encryption.notice.vo;

import java.sql.Date;


import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeVO {
	private int noticeId;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeSubject;
//	java.util => 시/분/초 모두 필요할 경우(현업多), java.sql => 날짜만 관리하고 싶을 때(간단)
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date noticeDate;
	private int noticeHit;
}
