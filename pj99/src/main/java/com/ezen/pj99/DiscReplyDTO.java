package com.ezen.pj99;

import java.sql.Date;

public class DiscReplyDTO {
	int dbno,reno;
	String rewriter,recontent;
	Date redate;
	public DiscReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiscReplyDTO(int dbno, int reno, String rewriter, String recontent, Date redate) {
		super();
		this.dbno = dbno;
		this.reno = reno;
		this.rewriter = rewriter;
		this.recontent = recontent;
		this.redate = redate;
	}
	public int getDbno() {
		return dbno;
	}
	public void setDbno(int dbno) {
		this.dbno = dbno;
	}
	public int getReno() {
		return reno;
	}
	public void setReno(int reno) {
		this.reno = reno;
	}
	public String getRewriter() {
		return rewriter;
	}
	public void setRewriter(String rewriter) {
		this.rewriter = rewriter;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public Date getRedate() {
		return redate;
	}
	public void setRedate(Date redate) {
		this.redate = redate;
	}
	
}
