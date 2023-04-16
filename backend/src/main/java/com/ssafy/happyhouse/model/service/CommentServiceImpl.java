package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private com.ssafy.happyhouse.model.mapper.CommentMapper commentMapper;
	
	@Override
	public List<com.ssafy.happyhouse.model.dto.CommentDto> list(int bno) {
		return commentMapper.list(bno);
	}

	@Override
	public boolean create(com.ssafy.happyhouse.model.dto.CommentDto commentDto) {
		return commentMapper.create(commentDto) == 1;
	}

	@Override
	public boolean modify(com.ssafy.happyhouse.model.dto.CommentDto commentDto) {
		return commentMapper.modify(commentDto) == 1;
	}

	@Override
	public boolean delete(int commentNo) {
		return commentMapper.delete(commentNo) == 1;
	}

}
