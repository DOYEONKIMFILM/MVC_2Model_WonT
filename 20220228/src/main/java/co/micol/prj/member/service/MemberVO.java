package co.micol.prj.member.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberVO {		//테이블 1:1
	private String id;
	private String password;
	private String name;
	private String tel;
	private String address;
	private String author;
}
