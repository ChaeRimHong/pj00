package com.ezen.pj99;

import java.sql.Date;

public class RecordReplyDTO {
	int bno, repno;
	String repwriter, repcontent;
	Date repdate ;
	public RecordReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RecordReplyDTO(int bno, int repno, String repwriter, String repcontent, Date repdate) {
		super();
		this.bno = bno;
		this.repno = repno;
		this.repwriter = repwriter;
		this.repcontent = repcontent;
		this.repdate = repdate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRepno() {
		return repno;
	}
	public void setRepno(int repno) {
		this.repno = repno;
	}
	public String getRepwriter() {
		return repwriter;
	}
	public void setRepwriter(String repwriter) {
		this.repwriter = repwriter;
	}
	public String getRepcontent() {
		return repcontent;
	}
	public void setRepcontent(String repcontent) {
		this.repcontent = repcontent;
	}
	public Date getRepdate() {
		return repdate;
	}
	public void setRepdate(Date repdate) {
		this.repdate = repdate;
	}
	
	
}
