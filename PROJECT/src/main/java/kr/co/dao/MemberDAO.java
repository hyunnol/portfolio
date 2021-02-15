package kr.co.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	public void register(MemberVO memberVO) throws Exception {
		 sqlSession.insert("memberMapper.register",memberVO);
	}
	
	public MemberVO login(MemberVO memberVO) throws Exception {
		return sqlSession.selectOne("memberMapper.login", memberVO);
	}
	
	//회원탈퇴
	public void memberDelete(MemberVO memberVO) throws Exception {
		
		sqlSession.delete("memberMapper.memberDelete", memberVO);
		
	}
	
	//회원정보수정
	public void memberUpdate(MemberVO memberVO) throws Exception{
		sqlSession.update("memberMapper.memberUpdate", memberVO);
	}
	
	//패스워드체크

	public int passChk(MemberVO vo) throws Exception {
		int result = sqlSession.selectOne("memberMapper.passChk", vo);
		return result;
	}
	
	//아이디 중복체크
	
	public int idChk(MemberVO vo) throws Exception {
		int result = sqlSession.selectOne("memberMapper.idChk", vo);
		return result;
	}
	
	
	
}
