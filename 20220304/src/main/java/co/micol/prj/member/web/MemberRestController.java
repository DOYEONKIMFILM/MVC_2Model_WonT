package co.micol.prj.member.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController // return 뷰를 안타고 글자 그대로 나타난다
public class MemberRestController {
	
	@RequestMapping("/request.do")
	public String home() {
		// 처리하는 루틴
		return "aaa";
	}

}
