package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.jwt.dto.UserRequest;
import com.ssafy.happyhouse.model.mapper.MemberMapper;

@Service
public class MemberSerivce {
	@Autowired
	private MemberMapper mdao;
	
	public Map<String, Object> select(String userId) {
		UserRequest Member = mdao.selectOne(userId);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("Member", Member); 
		
		return map;
	}
	
	public boolean deleteMember(String userId) {
		int key = mdao.checkAuth(userId);
		System.out.println(key);
		mdao.deleteAuth(key);
		return mdao.delete(userId) == 1;
	}
}
