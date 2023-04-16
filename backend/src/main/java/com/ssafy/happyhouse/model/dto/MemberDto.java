package com.ssafy.happyhouse.model.dto;

public class MemberDto {
	private String id;
	private String password;
	private String name;
	private String email;
	private String favCcode;
	
	public MemberDto(){
		
	}
	
	public MemberDto(String id, String password, String name, String email, String favCcode) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.favCcode = favCcode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFavCcode() {
		return favCcode;
	}

	public void setFavCcode(String favCcode) {
		this.favCcode = favCcode;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", favCcode="
				+ favCcode + "]";
	}
	
}
