package com.ezen.pj99;

public class LoginDTO {
	String id,pw,pwco,name,email;

	public LoginDTO() {
	}

	public LoginDTO(String id, String pw, String pwco, String name, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.pwco = pwco;
		this.name = name;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPwco() {
		return pwco;
	}

	public void setPwco(String pwco) {
		this.pwco = pwco;
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
	
	
}
