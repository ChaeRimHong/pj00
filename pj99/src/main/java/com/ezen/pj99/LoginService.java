package com.ezen.pj99;

import java.util.ArrayList;

public interface LoginService {
	public LoginDTO login(String id, String pw);

	// �α��� �� id Ȯ���Ϸ���
	public ArrayList<LoginDTO> id_check(String id);

	public void register(String id, String pw, String pwco, String name, String email);

	// mypage
	public ArrayList<LoginDTO> mypage(String user_id);

	public LoginDTO mypage_update(String pw, String pwco, String name, String id);
}