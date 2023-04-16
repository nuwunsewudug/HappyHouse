package com.ssafy.happyhouse.model.dto;

public class BootaCommentDto {

	private int comment_no;
	private int like_count;
	private String ccontent;
	private int btbno;
	
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public int getBtbno() {
		return btbno;
	}
	public void setBtbno(int btbno) {
		this.btbno = btbno;
	}

	
	
}
