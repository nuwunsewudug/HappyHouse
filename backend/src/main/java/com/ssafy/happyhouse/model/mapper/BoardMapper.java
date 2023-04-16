package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.model.dto.BoardDto;

import io.swagger.v3.oas.annotations.Parameter;

@Mapper
public interface BoardMapper {
	public BoardDto selectOne(int bno);
	public List<BoardDto> selectList(@Param("start")int start, @Param("count")int count);
	public List<BoardDto> searchList(@Param("start")int start, @Param("count")int count, @Param("keyword")String keyword);
	public int selectTotalCount();
	public int selectSearchCount(@Param("keyword")String keyword);
	public int updateReadCount(int bno);
	public int insertBoard(BoardDto board);
	public int updateBoard(BoardDto board);
	public int deleteBoard(int bno);
}
