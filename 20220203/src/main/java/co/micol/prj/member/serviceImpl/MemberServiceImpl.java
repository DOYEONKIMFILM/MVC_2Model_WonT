package co.micol.prj.member.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.prj.comm.DataSource;
import co.micol.prj.member.service.MemberMapper;
import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	private SqlSession sqlSession = DataSource.getInstacne().openSession(true);
	private MemberMapper map = sqlSession.getMapper(MemberMapper.class);
	
	public List<MemberVO> memberSelectList() {
	return map.memberSelectList();
	}

	public MemberVO memberSelect(MemberVO vo) {
		return map.memberSelect(vo);
	}

	public int memberInsert(MemberVO vo) {
		return map.memberInsert(vo);
	}

	public int memberDelete(MemberVO vo) {
		return map.memberDelete(vo);
	}

	public int memberUpdate(MemberVO vo) {
		return map.memberUpdate(vo);
	}

	public boolean isIdCheck(String id) {
		return map.isIdCheck(id);
	}

}
