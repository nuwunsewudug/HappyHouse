package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.ReivewDto;
import com.ssafy.happyhouse.model.mapper.ReivewMapper;

@MapperScan(basePackages = "com.ssafy.happyhouse")
@Service
public class ReivewService {
	
	@Autowired
	private ReivewMapper rdao;
	
	public Map<String, Object> readReivew(String house_num) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<ReivewDto> reivewList = rdao.selectList(house_num);
	
		result.put("reivew", reivewList); // 현재 읽는 게시글내용
		
		return result;
	}

	public Map<String, Object> getHotHouse() {
		HashMap<String, Object> result = new HashMap<String, Object>();
		ReivewDto hotHouse = rdao.selectHouse();
		
		result.put("reivew", hotHouse); // 현재 읽는 게시글내용
		
		return result;
	}
	
	public boolean writeReivew(ReivewDto reivew) {
		return rdao.insertReivew(reivew) == 1;
	}
}
