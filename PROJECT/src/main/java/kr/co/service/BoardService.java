package kr.co.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.BoardDAO;
import kr.co.vo.BoardVO;
import kr.co.vo.MemberVO;

@Service
public class BoardService {

	@Inject
	private BoardDAO dao;
	

	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}
	
	
	// 게시물 목록 조회
	public List<BoardVO> list() throws Exception {

		return dao.list();
	}
	
	
	// 게시물 조회
	public BoardVO read(int bno) throws Exception {

		return dao.read(bno);
	}
	
	//게시물 수정
	public void update(BoardVO boardVO) throws Exception {

		dao.update(boardVO);
	}

	//게시물 삭제
	public void delete(int bno) throws Exception {
		
		dao.delete(bno);
	}
	
	//카테고리별조회
	
	public List<BoardVO> catelist(BoardVO boardVO) throws Exception {
		
		return dao.catelist(boardVO);
	}
	

}