package com.ssafy.happyhouse.model.dto;

import io.swagger.annotations.ApiModel;

@ApiModel(value = "CommentDto : qna에 작성하는 댓글")
public class CommentDto {

	private int comment_no;
	private String user_name;
	private String ccontent;
	private String cwrite_date;
	private int bno;

	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCwrite_date() {
		return cwrite_date;
	}
	public void setCwrite_date(String cwrite_date) {
		this.cwrite_date = cwrite_date;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}


	@Override
	public String toString() {
		return "CommentDto [comment_no=" + comment_no + ", user_name=" + user_name + ", ccontent=" + ccontent
				+ ", cwrite_date=" + cwrite_date + ", bno=" + bno + "]";
	}
	
}
