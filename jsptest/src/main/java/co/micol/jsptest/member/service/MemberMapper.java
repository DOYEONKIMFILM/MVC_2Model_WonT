package co.micol.jsptest.member.service;

import java.util.List;

// mybatis에서 사용하기 위해
public interface MemberMapper {
	// 전체 리스트 R
	List<MemberVO> memberSelectList();

	// 한건 조회 R
	MemberVO memberSelect(MemberVO vo);

	// 등록 C
	int memberInsert(MemberVO vo);

	// 삭제 D
	int memberDelete(MemberVO vo);

	// 수정 U
	int memberUpdate(MemberVO vo);

}
