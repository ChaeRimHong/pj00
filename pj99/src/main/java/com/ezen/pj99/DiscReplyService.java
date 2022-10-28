package com.ezen.pj99;

import java.util.ArrayList;

public interface DiscReplyService {
   
   public void replycount();                  //´ñ±Û°³¼ö
   public ArrayList<DiscReplyDTO> replylist(String dnum);      //´ñ±Û¸ñ·Ï
   public void replyin(int dbno, String rewriter, String recontent);  //´ñ±ÛÀÛ¼º
   public Object replyupdate(DiscReplyDTO drdto);  //´ñ±Û¼öÁ¤
   public void replydel(String rewriter);            //´ñ±Û»èÁ¦
   
}