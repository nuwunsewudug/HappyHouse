package com.ssafy.happyhouse.model.dto;

public class BoardDto {
	private int bno;
	private String bwriter;
	private String btitle;
	private String bcontent;
	private int bread_count;
	private String bwrite_date;
	
	public BoardDto() {}
	
	public BoardDto(int bno, String bwriter, String btitle, String bcontent, int bread_count, String bwrite_date) {
		this.bno = bno;
		this.bwriter = bwriter;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bread_count = bread_count;
		this.bwrite_date = bwrite_date;
	}

	public BoardDto(String bwriter, String btitle, String bcontent, int bread_count, String bwrite_date) {
		this.bwriter = bwriter;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bread_count = bread_count;
		this.bwrite_date = bwrite_date;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getBwriter() {
		return bwriter;
	}


	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}


	public String getBtitle() {
		return btitle;
	}


	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}


	public String getBcontent() {
		return bcontent;
	}


	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}


	public int getBread_count() {
		return bread_count;
	}


	public void setBread_count(int bread_count) {
		this.bread_count = bread_count;
	}


	public String getbwrite_date() {
		return bwrite_date;
	}


	public void setbwrite_date(String bwrite_date) {
		this.bwrite_date = bwrite_date;
	}

	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", bwriter=" + bwriter + ", btitle=" + btitle + ", bcontent=" + bcontent
				+ ", bread_count=" + bread_count + ", bwrite_date=" + bwrite_date + "]";
	}
	
}
