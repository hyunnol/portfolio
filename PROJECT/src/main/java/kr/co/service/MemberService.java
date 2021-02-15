package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.MemberDAO;
import kr.co.vo.MemberVO;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO memberDAO; 
	
	public void register(MemberVO memberVO) throws Exception{
		memberDAO.register(memberVO);
	}
	
	public MemberVO login(MemberVO memberVO) throws Exception {
		return memberDAO.login(memberVO);
	}
	
	public void memberDelete(MemberVO vo) throws Exception {
		memberDAO.memberDelete(vo);
	}

	public void memberUpdate(MemberVO vo) throws Exception {
		memberDAO.memberUpdate(vo);
	}
	
	public int passChk(MemberVO vo) throws Exception {
		int result = memberDAO.passChk(vo);
		return result;
	}
	
	//아이디 중복체크
	public int idChk(MemberVO vo) throws Exception {
		int result = memberDAO.idChk(vo);
		return result;
	}
}
