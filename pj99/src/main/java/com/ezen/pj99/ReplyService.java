package com.ezen.pj99;

import java.util.ArrayList;
import java.util.List;

public interface ReplyService {
	
	// 댓글 개수
	public void replycount();							
	
	// 댓글 목록  
	public ArrayList<RecordReplyDTO> replylist(int rno);		
	
	// 댓글 작성   
	public void replyin(int bno, String repwriter, String repcontent);
	
	// 댓글 수정  
	public Object replymod(RecordReplyDTO rrdto);		
	
	// 댓글 삭제   
	public void replydel(String repwriter);			

}
