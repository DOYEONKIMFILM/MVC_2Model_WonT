package co.micol.prj.log.service;


import java.sql.Date;
import java.util.List;

public interface LogMapper {
	List<LogVO> seletLogList(Date startDate); //로그 전체검색
	int insertLog(LogVO vo); //로그쌓기

}
