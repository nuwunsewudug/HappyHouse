package com.ssafy.happyhouse.jwt.dto;

import lombok.Getter;

@Getter
public class UserRequest {
    private String user_id;
    private String user_pw;
    private String user_email;
    private String my_dong_code;
    
	public UserRequest() {
	}
    
	public UserRequest(String user_id, String user_pw, String user_email, String my_dong_code) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_email = user_email;
		this.my_dong_code = my_dong_code;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public void setMy_dong_code(String my_dong_code) {
		this.my_dong_code = my_dong_code;
	}

}