package com.ssafy.happyhouse.model.mapper;

import java.util.List;

public interface CommentMapper {
	List<com.ssafy.happyhouse.model.dto.CommentDto> list(int bno);
	int create(com.ssafy.happyhouse.model.dto.CommentDto commentDto);
	int modify(com.ssafy.happyhouse.model.dto.CommentDto commentDto);
	int delete(int commentNo);
	
}
