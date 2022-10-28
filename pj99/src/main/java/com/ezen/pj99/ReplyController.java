package com.ezen.pj99;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
//@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	SqlSession sqlSession;

	ReplyService reps;

//==========================================================================================
//==Reply_In==================================================================================	

	@ResponseBody
	@RequestMapping(value = "/record_in", method = RequestMethod.POST)
	public String reply_insert(HttpServletRequest request, RedirectAttributes rattr) {
		try {
			String jo = request.getParameter("jsoninfo");
			JSONParser jsonparse = new JSONParser();
			JSONObject jobj;

			LoginDTO ldto = new LoginDTO();

			HttpSession hs = request.getSession();
			String id = (String) hs.getAttribute("id");
			System.out.println("가져온 ID: " + id);

			// String repwriter=hs.getAttribute("id", ldto.id);

			jobj = (JSONObject) jsonparse.parse(jo);
			int bno = (Integer.parseInt((String) jobj.get("bno")));
			String repwriter = id;
			String repcontent = (String) jobj.get("repcontent");

			// System.out.println("글번호1 :" + bno);
			// System.out.println("작성자1 :" + repwriter);
			// System.out.println("글내용 :" + repcontent);

			ReplyService rs = sqlSession.getMapper(ReplyService.class);
			rs.replyin(bno, repwriter, repcontent);
			// rattr.addAttribute("finish", "good");

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:record_detail";

	}

//==========================================================================================
//==Reply_Show==================================================================================
	/*
	 * @SuppressWarnings({ "unchecked", "unused" })
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/show", method = RequestMethod.GET, produces =
	 * "application/text; charset=UTF-8") // 한글 깨짐 // 방지....불러오기 public Object
	 * reply_show(HttpServletRequest request, HttpServletResponse response, Model
	 * mo) throws IOException {
	 * 
	 * JSONArray array = new JSONArray(); JSONObject total = new JSONObject();
	 * 
	 * ReplyService rs = sqlSession.getMapper(ReplyService.class); HttpSession hs =
	 * request.getSession(); int rno = (Integer) hs.getAttribute("rno");
	 * System.out.println("가져온 글번호 : " + rno);
	 * 
	 * ArrayList<RecordReplyDTO> list = rs.replylist(rno); //
	 * System.out.println("리스트의 크기 :" + list.size()); for (int i = 0; i <
	 * list.size(); i++) { JSONObject member = new JSONObject();
	 * 
	 * int bno = list.get(i).getBno(); String repwriter =
	 * list.get(i).getRepwriter(); String repcontent = list.get(i).getRepcontent();
	 * 
	 * // System.out.println("게시글번호 : " + bno); // System.out.println("작성자 :" +
	 * repwriter); // System.out.println("한줄평 : " + repcontent);
	 * 
	 * member.put("bno", bno); member.put("repwriter", repwriter);
	 * member.put("repcontent", repcontent); array.add(member); } //
	 * total.put("members", array); String jsoninfo = array.toJSONString(); //
	 * PrintWriter ppw = response.getWriter(); // ppw.print(total.toJSONString());
	 * // ppw.print(array.toJSONString()); //
	 * System.out.println(array.toJSONString());
	 * 
	 * return jsoninfo; }
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/show", produces = "application/text; charset=UTF-8") // 한글 깨짐 방지....불러오기
	public Object reply_show(HttpServletRequest request) {
		System.out.println("화면 출력 데이타 가져오기!!");
		JSONArray array = new JSONArray();
		JSONObject total = new JSONObject();

		ReplyService rs = sqlSession.getMapper(ReplyService.class);
		HttpSession hs = request.getSession();
		int rno = (Integer) hs.getAttribute("rno");
		System.out.println("가져온 글번호 : " + rno);

		ArrayList<RecordReplyDTO> list = rs.replylist(rno);
		System.out.println("리스트의 크기 :" + list.size());

		for (int i = 0; i < list.size(); i++) {
			JSONObject member = new JSONObject();

			int bno = list.get(i).getBno();
			String repwriter = list.get(i).getRepwriter();
			String repcontent = list.get(i).getRepcontent();

			System.out.println("게시글번호 : " + bno);
			System.out.println("작성자 :" + repwriter);
			System.out.println("한줄평  : " + repcontent);

			member.put("bno", bno);
			member.put("repwriter", repwriter);
			member.put("repcontent", repcontent);
			array.add(member);
		}
		String jsoninfo = array.toJSONString();
		return jsoninfo;
	}

//==========================================================================================
//==Reply_Delete==================================================================================	

	@RequestMapping(value = "/reply_del")
	public String bnodelete(HttpServletRequest request) {
		String repwriter = request.getParameter("repwriter");
		// int bno =Integer.parseInt((String)request.getParameter("bnodel"));
		System.out.println("삭제할 댓글의 댓쓴이 : " + repwriter);

		ReplyService dao = sqlSession.getMapper(ReplyService.class);
		dao.replydel(repwriter);

		return "redirect:record_detail";
	}

//==========================================================================================
//==Reply_Search==================================================================================	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/reply_search",produces =
	 * "application/text; charset=UTF-8")// 한글 깨짐 방지....불러오기 public Object
	 * reply_search() { System.out.println("화면 출력 데이타 가져오기!!"); JSONArray array =
	 * new JSONArray(); JSONObject total = new JSONObject();
	 * 
	 * ReplyService rs= sqlSession.getMapper(ReplyService.class);
	 * ArrayList<RecordReplyDTO> list=rs.replylist();
	 * System.out.println("리스트의 크기 :"+list.size() ); for(int i=0;i<list.size();i++)
	 * { JSONObject member = new JSONObject();
	 * 
	 * int bno=list.get(i).getBno(); String repwriter=list.get(i).getRepwriter();
	 * String repcontent=list.get(i).getRepcontent();
	 * 
	 * System.out.println("게시글번호 : " +bno); System.out.println("작성자 :"+repwriter);
	 * System.out.println("한줄평  : "+repcontent);
	 * 
	 * member.put("bno", bno); member.put("repwriter", repwriter);
	 * member.put("repcontent", repcontent); array.add(member); } String jsoninfo =
	 * array.toJSONString(); return jsoninfo; }
	 */

//==========================================================================================
//==Disc_Reply==================================================================================

	DiscReplyService drs;

	@ResponseBody
	@RequestMapping(value = "/disc_inp", method = RequestMethod.POST)
	public String disc_insert(HttpServletRequest request, RedirectAttributes rattr) {
		try {
			String jo = request.getParameter("jsoninfo");
			JSONParser jsonparse = new JSONParser();
			JSONObject jobj;

			LoginDTO ldto = new LoginDTO();

			HttpSession hs = request.getSession();
			String id = (String) hs.getAttribute("id");
			System.out.println("媛��졇�삩 ID: " + id);

			// String repwriter=hs.getAttribute("id", ldto.id);

			jobj = (JSONObject) jsonparse.parse(jo);
			int dbno = (Integer.parseInt((String) jobj.get("dbno")));
			String rewriter = id;
			String recontent = (String) jobj.get("recontent");

			// System.out.println("湲�踰덊샇1 :" + dbno);
			// System.out.println("�옉�꽦�옄1 :" + rewriter);
			// System.out.println("湲��궡�슜 :" + recontent);

			DiscReplyService drs = sqlSession.getMapper(DiscReplyService.class);
			drs.replyin(dbno, rewriter, recontent);
			// rattr.addAttribute("finish", "good");

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:disc_detail";
	}
//============================================================================================
//=======DISC Reply SHOW================================================

	@ResponseBody
	@RequestMapping(value = "/show1", produces = "application/text; charset=UTF-8") // �븳湲� 源⑥쭚 諛⑹�....遺덈윭�삤湲�
	public Object disc_show(HttpServletRequest request) {
		System.out.println("�솕硫� 異쒕젰 �뜲�씠�� 媛��졇�삤湲�!!");
		JSONArray array = new JSONArray();
		JSONObject total = new JSONObject();

		DiscReplyService drs = sqlSession.getMapper(DiscReplyService.class);
		HttpSession hs = request.getSession();
		String dnum = (String) hs.getAttribute("dnum");
		System.out.println("비평번호 : " + dnum);

		ArrayList<DiscReplyDTO> list = drs.replylist(dnum);
		//System.out.println("由ъ뒪�듃�쓽 �겕湲� :" + list.size());

		for (int i = 0; i < list.size(); i++) {
			JSONObject member = new JSONObject();

			int dbno = list.get(i).getDbno();
			String rewriter = list.get(i).getRewriter();
			String recontent = list.get(i).getRecontent();

			System.out.println("비평글번호 : " + dbno);
			System.out.println("비평댓글쓴이 :" + rewriter);
			System.out.println("비평댓글내용  : " + recontent);

			member.put("dbno", dbno);
			member.put("rewriter", rewriter);
			member.put("recontent", recontent);
			array.add(member);
		}
		String jsoninfo = array.toJSONString();
		return jsoninfo;
	}

}