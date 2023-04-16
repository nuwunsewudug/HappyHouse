package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.model.dto.BootaBoardDto;
import com.ssafy.happyhouse.model.dto.ReivewDto;

import io.swagger.v3.oas.annotations.Parameter;

@Mapper
public interface BootaBoardMapper {
	public BootaBoardDto selectOne(int btbno);
	public List<BootaBoardDto> selectList(@Param("start")int start, @Param("count")int count, @Param("gugun")String gugun);
	public List<BootaBoardDto> searchList(@Param("start")int start, @Param("count")int count, @Param("keyword")String keyword);
	public BootaBoardDto selectHotBoard();
	public int selectTotalCount(String gugun);
	public int selectSearchCount(@Param("keyword")String keyword);
	public int updateReadCount(int btbno);
//	public int updateLikeCount(int btbno);
	public int insertBoard(BootaBoardDto board);
	public int updateBoard(BootaBoardDto board);
	public int updateLike(int btbno);
	public int deleteBoard(int btbno);
}
