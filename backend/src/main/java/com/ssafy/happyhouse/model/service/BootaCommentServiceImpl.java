package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BootaCommentServiceImpl implements BootaCommentService {

	@Autowired
	private com.ssafy.happyhouse.model.mapper.BootaCommentMapper commentMapper;
	
	@Override
	public List<com.ssafy.happyhouse.model.dto.BootaCommentDto> list(int btbno) {
		return commentMapper.list(btbno);
	}

	public boolean updateLike(int commentNo) {
		return commentMapper.updateLike(commentNo) == 1;
	}
	
	@Override
	public boolean create(com.ssafy.happyhouse.model.dto.BootaCommentDto commentDto) {
		return commentMapper.create(commentDto) == 1;
	}

	@Override
	public boolean modify(com.ssafy.happyhouse.model.dto.BootaCommentDto commentDto) {
		return commentMapper.modify(commentDto) == 1;
	}

	@Override
	public boolean delete(int commentNo) {
		return commentMapper.delete(commentNo) == 1;
	}

}
