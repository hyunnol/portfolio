package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.MemberService;
import kr.co.vo.MemberVO;

@Controller
public class MemberController {
	
	@Inject
	MemberService service;
	
	//회원가입 get
	@RequestMapping(value="/member/register", method= RequestMethod.GET) 
		public String getRegister() throws Exception{
		return "member/register";
	}
	 
	//회원가입 post
	@RequestMapping(value="/member/register", method=RequestMethod.POST)
	public String postRegister(MemberVO memberVO) throws Exception{
		
		int result = service.idChk(memberVO);
		try {
			if(result == 1) {
				return "/member/register";
			}else if(result == 0) {
				service.register(memberVO);
			}
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/board/list";
	}
	
	//로그인
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String getlogin(MemberVO memberVO, HttpServletRequest req ) throws Exception{

		return "/member/login";
	}
	
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String login(MemberVO memberVO, HttpServletRequest req , RedirectAttributes rttr) throws Exception{
		HttpSession session = req.getSession();
		
		MemberVO login = service.login(memberVO);
		
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			
		}else {
			session.setAttribute("member", login);
			session.setAttribute("userid", login.getUserid());
		}
		
		return "redirect: /board/list";
	}
	
	//로그아웃
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		return "/member/login";
	}
	
	// 회원 탈퇴 get
		@RequestMapping(value="/member/memberDeleteView", method = RequestMethod.GET)
		public String memberDeleteView() throws Exception{
			return "/member/memberDeleteView";
			
		}
		
		// 회원 탈퇴 post
		@RequestMapping(value="/member/memberDelete", method = RequestMethod.POST)
		public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
			
			// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
			MemberVO member = (MemberVO) session.getAttribute("member");
			// 세션에있는 비밀번호
			String sessionPass = member.getUserpass();
			// vo로 들어오는 비밀번호
			String voPass = vo.getUserpass();
			
			if(!(sessionPass.equals(voPass))) {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/member/memberDeleteView";
			}
			service.memberDelete(vo);
			session.invalidate();
			return "redirect:/board/list";
		}
		
		//회원정보 수정
		@RequestMapping(value="/member/memberUpdateView", method = RequestMethod.GET)
		public String memberUpdateView() throws Exception{
			
			return "member/memberUpdateView";
		}
		
		@RequestMapping(value="/member/memberUpdate", method = RequestMethod.POST)
		public String memberUpdate(MemberVO vo, HttpSession session) throws Exception{
			service.memberUpdate(vo);
			session.invalidate();
			return "/member/login";
		}
	
		//비밀번호체크
		@ResponseBody //비동기처리
		@RequestMapping(value="/member/passChk", method = RequestMethod.POST)
		public int passChk(MemberVO vo) throws Exception {
			int result = service.passChk(vo);
			return result;
		}
		
		//아이디중복확인
		@ResponseBody
		@RequestMapping(value="/member/idChk", method = RequestMethod.POST)
		public int idChk(MemberVO vo) throws Exception {
			int result = service.idChk(vo);
			return result;
		}
}
