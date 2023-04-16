package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.dto.ReivewDto;

public interface ReivewMapper {
	public List<ReivewDto> selectList(String house_num);
	public int insertReivew(ReivewDto reivew);
	public ReivewDto selectHouse();
}
