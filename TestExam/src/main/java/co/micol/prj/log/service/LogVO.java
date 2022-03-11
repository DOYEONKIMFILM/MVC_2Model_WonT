package co.micol.prj.log.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class LogVO {
	private int logId;
	private String id;
	private String action;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date logTime;

}
