package co.micol.prj.filerepo.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FilerepoVO {
	private int id;
	private String writer;
	private Date enterDate;
	private String fname;
	private String rname;

}
