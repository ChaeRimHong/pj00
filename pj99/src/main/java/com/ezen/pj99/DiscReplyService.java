package com.ezen.pj99;

import java.util.ArrayList;

public interface DiscReplyService {
   
   public void replycount();                  //��۰���
   public ArrayList<DiscReplyDTO> replylist(String dnum);      //��۸��
   public void replyin(int dbno, String rewriter, String recontent);  //����ۼ�
   public Object replyupdate(DiscReplyDTO drdto);  //��ۼ���
   public void replydel(String rewriter);            //��ۻ���
   
}