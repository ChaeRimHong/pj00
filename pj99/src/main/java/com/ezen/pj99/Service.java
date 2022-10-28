package com.ezen.pj99;


import java.util.ArrayList;


public interface Service {

	public void recordin(String rposter, String rtitle, String rpd, String ractor, String rjenreArray);

	public ArrayList<RecordDTO> recordout();

	public ArrayList<RecordDTO> record_detail(int rno);

	//한줄평 페이징
	public int cntnotice();
	
	public ArrayList<RecordDTO> selectnotice(PageDTO dto);
	
	
	//search
	public ArrayList<RecordDTO> comment_search(String svalue);


	

	
	


}
 