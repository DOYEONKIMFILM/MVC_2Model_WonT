package co.micol.encryption.member.service;

import java.util.List;

import co.micol.encryption.member.vo.MemberVO;

public interface MemberService {
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberDelete(MemberVO vo);
	int memberUpdate(MemberVO vo);
	
	int memberLogin(MemberVO vo);
	// 아이디찾기
	MemberVO myIdCheck(String id);
}
