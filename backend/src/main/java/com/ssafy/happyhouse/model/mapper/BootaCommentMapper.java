package com.ssafy.happyhouse.model.mapper;

import java.util.List;

public interface BootaCommentMapper {
	List<com.ssafy.happyhouse.model.dto.BootaCommentDto> list(int bno);
	int create(com.ssafy.happyhouse.model.dto.BootaCommentDto commentDto);
	int modify(com.ssafy.happyhouse.model.dto.BootaCommentDto commentDto);
	int delete(int commentNo);
	int updateLike(int commentNo);
	
}
