package com.ezen.pj99;

public class DiscDTO {
	String  dnum,dtitle, ddate, mtitle, dcontent;
	int dreadcnt, dreproot, drepstep, drepindent;
	
	
	public DiscDTO() {
		
	}
	
	
	public DiscDTO(String dnum, String dtitle, String ddate, String mtitle, String dcontent, int dreadcnt, int dreproot,
			int drepstep, int drepindent) {
		super();
		this.dnum = dnum;
		this.dtitle = dtitle;
		this.ddate = ddate;
		this.mtitle = mtitle;
		this.dcontent = dcontent;
		this.dreadcnt = dreadcnt;
		this.dreproot = dreproot;
		this.drepstep = drepstep;
		this.drepindent = drepindent;
	}
	
	
	public String getDnum() {
		return dnum;
	}
	public void setDnum(String dnum) {
		this.dnum = dnum;
	}
	public String getDtitle() {
		return dtitle;
	}
	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}
	public String getDdate() {
		return ddate;
	}
	public void setDdate(String ddate) {
		this.ddate = ddate;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getDcontent() {
		return dcontent;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	public int getDreadcnt() {
		return dreadcnt;
	}
	public void setDreadcnt(int dreadcnt) {
		this.dreadcnt = dreadcnt;
	}
	public int getDreproot() {
		return dreproot;
	}
	public void setDreproot(int dreproot) {
		this.dreproot = dreproot;
	}
	public int getDrepstep() {
		return drepstep;
	}
	public void setDrepstep(int drepstep) {
		this.drepstep = drepstep;
	}
	public int getDrepindent() {
		return drepindent;
	}
	public void setDrepindent(int drepindent) {
		this.drepindent = drepindent;
	}
	
	
}
