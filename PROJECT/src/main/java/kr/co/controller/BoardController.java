package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.BoardService;
import kr.co.vo.BoardVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	BoardService service;

	// 게시판 글 작성 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public String writeView() throws Exception {

		
		return "board/writeView";

	}

	// 게시판 글 작성
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception {

		service.write(boardVO);

		return "redirect:/board/list";
	}

	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		

		model.addAttribute("list", service.list());
		
		return "board/list";

	}

	// 게시물 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, Model model) throws Exception {

		model.addAttribute("read", service.read(boardVO.getBno()));

		return "board/readView";
	}
	
	// 게시판 수정뷰
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(BoardVO boardVO, Model model) throws Exception{
			
			
			model.addAttribute("update", service.read(boardVO.getBno()));
			
			return "board/updateView";
		}
		
		// 게시판 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(BoardVO boardVO) throws Exception{
			
			
			service.update(boardVO);
			
			return "redirect:/board/list";
		}

		// 게시판 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(BoardVO boardVO) throws Exception{
			
			service.delete(boardVO.getBno());
			
			return "redirect:/board/list";
		}
	
		
		 @RequestMapping(value="/list/cate" , method = RequestMethod.GET)
		  public String listcate(BoardVO boardVO, Model model) throws Exception{
			  model.addAttribute("cate", service.catelist(boardVO));
			  
			  return "/board/cate";
		  }
		 
	

}