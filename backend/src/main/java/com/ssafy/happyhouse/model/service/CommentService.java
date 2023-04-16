package com.ssafy.happyhouse.model.service;

import java.util.List;

public interface CommentService {

	List<com.ssafy.happyhouse.model.dto.CommentDto> list(int bno);

	boolean create(com.ssafy.happyhouse.model.dto.CommentDto commentDto);

	boolean modify(com.ssafy.happyhouse.model.dto.CommentDto commentDto);

	boolean delete(int commentNo);
	
}
