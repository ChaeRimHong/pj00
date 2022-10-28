package com.ezen.pj99;

public class RecordDTO {
	String rno, rposter, rtitle, rpd, ractor,rjenre;

	public RecordDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RecordDTO(String rno, String rposter, String rtitle, String rpd, String ractor, String rjenre) {
		super();
		this.rno = rno;
		this.rposter = rposter;
		this.rtitle = rtitle;
		this.rpd = rpd;
		this.ractor = ractor;
		this.rjenre = rjenre;
	}

	public String getRno() {
		return rno;
	}

	public void setRno(String rno) {
		this.rno = rno;
	}

	public String getRposter() {
		return rposter;
	}

	public void setRposter(String rposter) {
		this.rposter = rposter;
	}

	public String getRtitle() {
		return rtitle;
	}

	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}

	public String getRpd() {
		return rpd;
	}

	public void setRpd(String rpd) {
		this.rpd = rpd;
	}

	public String getRactor() {
		return ractor;
	}

	public void setRactor(String ractor) {
		this.ractor = ractor;
	}

	public String getRjenre() {
		return rjenre;
	}

	public void setRjenre(String rjenre) {
		this.rjenre = rjenre;
	}
	
}
