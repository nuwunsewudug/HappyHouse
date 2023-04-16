package com.ssafy.happyhouse.model.dto;

public class BootaBoardDto {
	private int btbno;

	private String btb_title;
	private String btb_content;
	private int btb_read_count;
	private String btb_write_date;
	private int like_count;
	private String btb_pw;
	private String guguncode;
	

	public BootaBoardDto() {}



	public BootaBoardDto(String btb_title, String btb_content, int btb_read_count, String btb_write_date,
			int like_count, String btb_pw, String guguncode) {
		
		this.btb_title = btb_title;
		this.btb_content = btb_content;
		this.btb_read_count = btb_read_count;
		this.btb_write_date = btb_write_date;
		this.like_count = like_count;
		this.btb_pw = btb_pw;
		this.guguncode = guguncode;
	}



	public BootaBoardDto(int btbno, String btb_title, String btb_content, int btb_read_count, String btb_write_date,
			int like_count, String btb_pw, String guguncode) {
		
		this.btbno = btbno;
		this.btb_title = btb_title;
		this.btb_content = btb_content;
		this.btb_read_count = btb_read_count;
		this.btb_write_date = btb_write_date;
		this.like_count = like_count;
		this.btb_pw = btb_pw;
		this.guguncode = guguncode;
	}



	public int getBtbno() {
		return btbno;
	}

	public void setBtbno(int btbno) {
		this.btbno = btbno;
	}

	public String getBtb_title() {
		return btb_title;
	}

	public void setBtb_title(String btb_title) {
		this.btb_title = btb_title;
	}

	public String getBtb_content() {
		return btb_content;
	}

	public void setBtb_content(String btb_content) {
		this.btb_content = btb_content;
	}

	public int getBtb_read_count() {
		return btb_read_count;
	}

	public void setBtb_read_count(int btb_read_count) {
		this.btb_read_count = btb_read_count;
	}

	public String getBtb_write_date() {
		return btb_write_date;
	}

	public void setBtb_write_date(String btb_write_date) {
		this.btb_write_date = btb_write_date;
	}
	public int getLike_count() {
		return like_count;
	}


	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public String getBtb_pw() {
		return btb_pw;
	}



	public void setBtb_pw(String btb_pw) {
		this.btb_pw = btb_pw;
	}

	public String getGuguncode() {
		return guguncode;
	}


	public void setGuguncode(String guguncode) {
		this.guguncode = guguncode;
	}



	@Override
	public String toString() {
		return "BootaBoardDto [btbno=" + btbno + ", btb_title=" + btb_title + ", btb_content=" + btb_content
				+ ", btb_read_count=" + btb_read_count + ", btb_write_date=" + btb_write_date + "]";
	}
	
	
}
