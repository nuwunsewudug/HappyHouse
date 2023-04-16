package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.BoardDto;
import com.ssafy.happyhouse.model.mapper.BoardMapper;

@MapperScan(basePackages = "com.ssafy.happyhouse")
@Service
public class BoardService {
	
	@Autowired
	private BoardMapper bdao;
	
	public Map<String, Object> makePage(int page) {
		// 현재페이지, 하단시작페이지, 하단끝페이지, 게시글목록, 총페이지수
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("page", page);
		
		int startPage = (page-1)/10*10 + 1;
		result.put("startPage", startPage);
		
		int totalCount = bdao.selectTotalCount();
		int totalPage = totalCount/10; // 한 페이지당 게시글 10개
		if(totalCount%10>0) // 게시글이 56개이면 56/10 = 5페이지인데 한페이지 더 필요함.
			totalPage++;
		result.put("totalPage", totalPage);
		
		int endPage = startPage+9; // ex) 현재페이지18인 경우 하단 페이지는 11~20
		if(endPage>totalPage)
			endPage = totalPage;
		result.put("endPage", endPage);
		
		List<BoardDto> boardList = bdao.selectList((page-1)*10, 10);
		result.put("boardList", boardList);
		
		return result;
	}
	
	public Map<String, Object> makeSearchPage(int page, String keyword) {
		// 현재페이지, 하단시작페이지, 하단끝페이지, 게시글목록, 총페이지수
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("page", page);
		
		int startPage = (page-1)/10*10 + 1;
		result.put("startPage", startPage);
		
		int totalCount = bdao.selectSearchCount(keyword);
		int totalPage = totalCount/10; // 한 페이지당 게시글 10개
		if(totalCount%10>0) // 게시글이 56개이면 56/10 = 5페이지인데 한페이지 더 필요함.
			totalPage++;
		result.put("totalPage", totalPage);
		
		int endPage = startPage+9; // ex) 현재페이지18인 경우 하단 페이지는 11~20
		if(endPage>totalPage)
			endPage = totalPage;
		result.put("endPage", endPage);
		
		List<BoardDto> boardList = bdao.searchList((page-1)*10, 10, keyword);
		result.put("boardList", boardList);
		
		return result;
	}

	public Map<String, Object> read(int bno) {
		System.out.println("service read bno:"+bno);
		BoardDto board = bdao.selectOne(bno);
		if(board!=null) {
			bdao.updateReadCount(bno);
			board = bdao.selectOne(bno);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board", board); // 현재 읽는 게시글내용
		System.out.println("111");
		
		return map;
	}
	
	public boolean writeBoard(BoardDto board) {
		return bdao.insertBoard(board) == 1;
	}
	
	public boolean updateBoard(BoardDto board) {
		return bdao.updateBoard(board) == 1;
	}
	
	public boolean deleteBoard(int bno) {
		return bdao.deleteBoard(bno) == 1;
	}
}








