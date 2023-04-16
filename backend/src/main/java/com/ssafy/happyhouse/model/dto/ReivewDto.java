package com.ssafy.happyhouse.model.dto;

public class ReivewDto {
	String house_num;
	String reivew_title;
	String reivew_content;
	String reivew_rating;
	
	public ReivewDto(String house_num, String reivew_title, String reivew_rating, String reivew_content) {
		this.house_num = house_num;
		this.reivew_title = reivew_title;
		this.reivew_rating = reivew_rating;
		this.reivew_content = reivew_content;
	}

	public ReivewDto(String reivew_title, String reivew_rating, String reivew_content) {
		this.reivew_title = reivew_title;
		this.reivew_rating = reivew_rating;
		this.reivew_content = reivew_content;
	}

	public ReivewDto() {
	}

	public String getHouse_num() {
		return house_num;
	}

	public void setHouse_num(String house_num) {
		this.house_num = house_num;
	}

	public String getReivew_title() {
		return reivew_title;
	}

	public void setReivew_title(String reivew_title) {
		this.reivew_title = reivew_title;
	}

	public String getReivew_rating() {
		return reivew_rating;
	}

	public void setReivew_rating(String reivew_rating) {
		this.reivew_rating = reivew_rating;
	}
	
	public String getReivew_content() {
		return reivew_content;
	}

	public void setReivew_content(String reivew_content) {
		this.reivew_content = reivew_content;
	}

	@Override
	public String toString() {
		return "ReivewDto [house_num=" + house_num + ", reivew_title=" + reivew_title + ", reivew_content="
				+ reivew_content + ", reivew_rating=" + reivew_rating + "]";
	}

}
