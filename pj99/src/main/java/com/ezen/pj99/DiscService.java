package com.ezen.pj99;

import java.util.ArrayList;

public interface DiscService {
	
	public void disc_input(String dtitle, String ddate, String mtitle, String dcontent);
	public ArrayList<DiscDTO> disc_list();
	public ArrayList<DiscDTO> disc_detail(String dnum);
	public void dreadcnt(String dnum);
	public ArrayList<DiscDTO> update1(String dnum);
	public void update2(String dnum, String dtitle, String ddate, String mtitle, String dcontent);
	public void delete(String dnum);

	// 비평란 페이징 처리
	public int cntnotice();
	public ArrayList<DiscDTO> selectnotice(DiscPageDTO ddto);

	// search
	public ArrayList<DiscDTO> discussion_search(String svalue);
}
