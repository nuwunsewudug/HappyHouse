package com.ssafy.happyhouse.model.service;

import java.util.List;

public interface BootaCommentService {

	List<com.ssafy.happyhouse.model.dto.BootaCommentDto> list(int btbno);

	boolean create(com.ssafy.happyhouse.model.dto.BootaCommentDto commentDto);
	
	boolean updateLike(int commentNo);
	
	boolean modify(com.ssafy.happyhouse.model.dto.BootaCommentDto commentDto);

	boolean delete(int commentNo);
	
}
