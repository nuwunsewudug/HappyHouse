package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;

import com.ssafy.happyhouse.jwt.dto.UserRequest;

public interface MemberMapper {
	public int insert(UserRequest member) throws SQLException; //회원가입
	public UserRequest selectOne(String userId); //로그인, 로그아웃 
	public int checkAuth(String id);
	public int deleteAuth(Integer key);
	public int delete(String id);
	public int update(UserRequest member) throws SQLException;
}
