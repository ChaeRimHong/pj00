package com.ezen.pj99;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.tools.javac.code.Attribute.Error;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	HttpSession session;

	@RequestMapping(value = "/")
	public String lo0(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("logindo", false);
		return "main";
	}

	@RequestMapping(value = "/index")
	public String lo1() {
		return "main";
	}
	
	@RequestMapping(value = "/logina")
	public String lo2() {
		return "login";
	}

	@RequestMapping(value = "/loginb", method = RequestMethod.POST)
	public ModelAndView lo3(HttpServletRequest request, RedirectAttributes red, Model mo) 
	{
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		LoginService ls = sqlSession.getMapper(LoginService.class);
		LoginDTO dto = ls.login(id, pw);
		System.out.println("koko : " + dto);
		HttpSession session = request.getSession();
		if (dto != null) {

			session.setAttribute("pj09_login", dto);
			session.setAttribute("id", dto.id); // 비평게시판에 글쓸 때 id가 자동으로 나오게 하려고 씀
			System.out.println(dto.id);
			session.setAttribute("logindo", true);
			session.setMaxInactiveInterval(300);
			mo.addAttribute("dto", dto);
			mav.setViewName("redirect:index");
		} else {
			red.addAttribute("result", "loginfail");
			mav.setViewName("redirect:logina");
		}
		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView lo4(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("pj09_login");
		session.removeAttribute("logindo");
		session.setAttribute("logindo", false);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:index");
		return mav;
	}

//==========================================================================================
	@RequestMapping(value = "/a")
	public String sign(HttpServletRequest request)
	{
		HttpSession session =request.getSession();
		session.setAttribute("joindo", false);
		return "main";
	}
	
	@RequestMapping(value = "/joina")
	public String join1()
	{
		return "register";
	}
	
	@RequestMapping(value = "/joinb", method = RequestMethod.POST)
	   public String join2(HttpServletRequest request, HttpServletResponse response) throws IOException {
	      request.setCharacterEncoding("utf-8");
	      System.out.println("여기와라");
	      String id = request.getParameter("id");
	      String pw = request.getParameter("pw");
	      String pwco = request.getParameter("pwco");
	      String name = request.getParameter("name");
	      String email = request.getParameter("email");
	   
	      
	      LoginService ls = sqlSession.getMapper(LoginService.class);
	      ls.register(id, pw, pwco, name, email);
	      
	      return "redirect:index";
	   }

	@RequestMapping(method = RequestMethod.GET, value = "/*form")
	private ModelAndView form(@RequestParam(value = "result", required = false) String result,
		HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName(viewName);
		return mv;
	}
	
//==========================================================================================
//==SEARCH==================================================================================
	@RequestMapping(value = "/search", method = { RequestMethod.POST, RequestMethod.GET })
	public String bb7(HttpServletRequest request, Model mo) throws IOException {
		request.setCharacterEncoding("utf-8");
		String sname = request.getParameter("sname");
		String svalue = request.getParameter("svalue");
		System.out.println("1. 한? 비? : "+sname);
		System.out.println("2. 검색내용 : "+svalue);
		System.out.println("--------------------");

		Service ss = sqlSession.getMapper(Service.class);
		ArrayList<RecordDTO> record_list = null;

		DiscService ds = sqlSession.getMapper(DiscService.class);
		ArrayList<DiscDTO> discussion_list = null;

		// option value : comment,discussion
		// select name.equals("option value")
		
		// comment면 RecordDTO에서 찾기
		if(sname.equals("comment")) {
			record_list=ss.comment_search(svalue);
			
		// discussion면 DiscDTO에서 찾기
		}else if (sname.equals("discussion")) {
			discussion_list=ds.discussion_search(svalue);
		}

		mo.addAttribute("record_list", record_list);
		mo.addAttribute("discussion_list", discussion_list);
		//System.out.println(discussion_list);
		//System.out.println(record_list);
		return "search";
	}
	
//==========================================================================================
//==NOTICE==================================================================================
		
	@RequestMapping(value = "/notice")
	public String notice(HttpServletRequest request, PageDTO dto, Model mo) {
		HttpSession hs=request.getSession();
		String user_id=(String) hs.getAttribute("id");
		Service dao = sqlSession.getMapper(Service.class);
		
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		Service notice = sqlSession.getMapper(Service.class);
		int total = notice.cntnotice();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		/*
		 * Service dao = sqlSession.getMapper(Service.class); ArrayList<RecordDTO> list
		 * = dao.recordout(); mo.addAttribute("list", list);
		 */

		dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mo.addAttribute("paging", dto);
		mo.addAttribute("view", notice.selectnotice(dto));
		mo.addAttribute("user_id",user_id);
		return "record_page";

	}
	
//==========================================================================================
//==MYPAGE==================================================================================
	
	@RequestMapping(value = "/go_mypage", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mypage(HttpServletRequest request,RedirectAttributes red, Model mo)
	{
		ModelAndView mav = new ModelAndView();
		HttpSession hs=request.getSession();
		String user_id=(String) hs.getAttribute("id");
		//System.out.println("유저 아이디 : "+user_id);
		
		if (user_id != null) {
			LoginService dao = sqlSession.getMapper(LoginService.class);
			ArrayList<LoginDTO> list= dao.mypage(user_id);
			mo.addAttribute("list", list);
			mav.setViewName("mypage");
		} else {
			//System.out.println("로그인안댐");
			red.addAttribute("result", "loginfail");
			mav.setViewName("redirect:logina");
		}
		return mav;
	}
	
	/*
	 @RequestMapping(value = "/memberout")
   		public String member3(HttpServletRequest request, Model mo, RedirectAttributes res) 
   		{
      		HttpSession hs = request.getSession();
      		if((boolean)hs.getAttribute("islogin")) {
         	InterA dao = sqlSession.getMapper(InterA.class);
         	ArrayList<MemberDTO> list = dao.mem_select();
         	mo.addAttribute("list", list);
         	return "memberout";
      	} else {
         res.addAttribute("result", "loginfail");
         return "redirect:index";
      	}
   }
	 */
	@RequestMapping(value = "/mypage_update", method = RequestMethod.POST  )
	public String mypage_update(HttpServletRequest request, Model mo)
	{
		LoginService ss=sqlSession.getMapper(LoginService.class);
		String id=request.getParameter("name");
		String pw=request.getParameter("pw");
		String pwco=pw;
		String name=request.getParameter("name");
		
		LoginDTO ldto=ss.mypage_update(id,pw, pwco, name);
		mo.addAttribute("ldto",ldto);
		return "mypage_mod";
	}
	
	
//==========================================================================================
//==RECORD==================================================================================

	@RequestMapping(value = "/recordinController")
	public String recin() {
		return "recordin";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/recordinsave")
	public String recinsave(MultipartHttpServletRequest mul) {
		MultipartFile poster = mul.getFile("rposter");
		String rposter = poster.getOriginalFilename();

		System.out.println("포스터 이름 " + rposter);

		String rtitle = mul.getParameter("rtitle");
		String rpd = mul.getParameter("rpd");
		String ractor = mul.getParameter("ractor");
		String rjenre[] = mul.getParameterValues("rjenre");
		String rjenreArray = "";
		for (String k : rjenre) {
			rjenreArray = rjenreArray + k + " ";
		}

		Service dao = sqlSession.getMapper(Service.class);
		dao.recordin(rposter, rtitle, rpd, ractor, rjenreArray);
		return "redirect:index";
	}

	@RequestMapping(value = "/recordout")
	public String recout(HttpServletRequest request, Model mo) {
		HttpSession hs=request.getSession();
		String user_id=(String) hs.getAttribute("id");
		
		Service dao = sqlSession.getMapper(Service.class);
		ArrayList<RecordDTO> list = dao.recordout();
		mo.addAttribute("list", list);
		mo.addAttribute("user_id",user_id);
		
		/*
		if(user_id.equals("admin"))
		{
			Service dao = sqlSession.getMapper(Service.class);
			ArrayList<RecordDTO> list = dao.recordout();
			mo.addAttribute("list", list);
			mo.addAttribute("user_id",user_id);
		}
		else {
			Service dao = sqlSession.getMapper(Service.class);
			ArrayList<RecordDTO> list = dao.recordout();
			mo.addAttribute("list", list);
		}
		*/
		return "record";
	}

	@RequestMapping(value = "/record_detail")
	public String rec_detail(HttpServletRequest request, Model model) {
		HttpSession hs=request.getSession();
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		hs.setAttribute("rno", rno);
		System.out.println("글번호 : " + rno);
		Service dao = sqlSession.getMapper(Service.class);
		ArrayList<RecordDTO> list = dao.record_detail(rno);

		
		
		model.addAttribute("list", list);

		return "record_detail";
	}

// ================================================================================
// ===SEARCH=======================================================================

	/*
	 * @RequestMapping(value = "searchAll", method = RequestMethod.POST) public
	 * String search(HttpServletRequest request,Model mo) {
	 * request.setCharacterEncoding("utf-8"); String
	 * sname=request.getParameter("sname"); String
	 * svalue=request.getParameter("svalue"); Service
	 * ss=sqlSession.getMapper(Service.class); ArrayList<ScoreDTO> list=null;
	 * if(sname.equals("name")) { list=ss.nsearch(svalue); } else
	 * if(sname.equals("kor")) { list=ss.ksearch(svalue); }
	 * 
	 * mo.addAttribute("list",list);
	 * 
	 * return null; }
	 */
	
// ================================================================================
// ===PAGE=========================================================================
	@RequestMapping(value = "/record_notice")
	public String recordPaging(HttpServletRequest request, PageDTO dto, Model mo) {
		HttpSession hs=request.getSession();
		String user_id=(String) hs.getAttribute("id");
		Service dao = sqlSession.getMapper(Service.class);
		
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		Service notice = sqlSession.getMapper(Service.class);
		int total = notice.cntnotice();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		/*
		 * Service dao = sqlSession.getMapper(Service.class); ArrayList<RecordDTO> list
		 * = dao.recordout(); mo.addAttribute("list", list);
		 */

		dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mo.addAttribute("paging", dto);
		mo.addAttribute("view", notice.selectnotice(dto));
		mo.addAttribute("user_id",user_id);
		return "record_page";

	}

	// ===============================================================================
	// 비평
	@RequestMapping(value = "/disc_input")
	public String diin() {
		return "disc_in";
	}

	@RequestMapping(value = "/disc_save", method = RequestMethod.POST)
	public String disave(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");

		String dtitle = request.getParameter("dtitle");
		String ddate = request.getParameter("ddate");
		String mtitle = request.getParameter("mtitle");
		String dcontent = request.getParameter("dcontent");
		
		DiscService ds = sqlSession.getMapper(DiscService.class);
		ds.disc_input(dtitle, ddate, mtitle, dcontent);
		return "redirect:disc_notice";
	}
	
	//목록
	@RequestMapping(value = "/disc_list")
	public String dilist(HttpServletRequest request, Model mo) {
		DiscService ds = sqlSession.getMapper(DiscService.class);
		ArrayList<DiscDTO> dlist = ds.disc_list();
		mo.addAttribute("list", dlist);

		return "disc_list";
	}
	
	//자세히보기
	@RequestMapping(value="/disc_detail")
	public String det1(HttpServletRequest request,Model mo)
	{
		String dnum=request.getParameter("dnum");
		DiscService ds = sqlSession.getMapper(DiscService.class);
		HttpSession hs=request.getSession();
		hs.setAttribute("dnum", dnum);
		dreadcnt(dnum);
		ArrayList<DiscDTO> dlist = ds.disc_detail(dnum);
		mo.addAttribute("list",dlist);
		return "disc_detail";
	}
	
	//조회수 올라가는거
	private void dreadcnt(String dnum) {
		DiscService ds = sqlSession.getMapper(DiscService.class);
		ds.dreadcnt(dnum);
	}
	
	//수정
		@RequestMapping(value="/disc_update1")
		public String update1(HttpServletRequest request, Model mo)
		{
			String dnum = request.getParameter("dnum");
			DiscService ds = sqlSession.getMapper(DiscService.class);
			ArrayList<DiscDTO> dlist = ds.update1(dnum);
			mo.addAttribute("list",dlist);
			return "disc_update";
		}
		
		@RequestMapping(value="/disc_update2", method = RequestMethod.POST)
		public String update2(HttpServletRequest request) 
		{
			DiscService ds = sqlSession.getMapper(DiscService.class);
			String dnum = request.getParameter("dnum");
			String dtitle = request.getParameter("dtitle");
			String ddate = request.getParameter("ddate");
			String mtitle = request.getParameter("mtitle");
			String dcontent = request.getParameter("dcontent");
			ds.update2(dnum, dtitle, ddate, mtitle, dcontent);
			return "redirect:disc_notice";
		}

	//삭제
	@RequestMapping(value="/disc_delete")
	public String delete(HttpServletRequest request)
	{
		String dnum=request.getParameter("dnum");
		DiscService ds = sqlSession.getMapper(DiscService.class);
		ds.delete(dnum);
		return "redirect:disc_notice";
	}
//===========================================================================
//====DISC PAGE==============================================================
	@RequestMapping(value="/disc_notice")
	public String discPaging(HttpServletRequest request, DiscPageDTO ddto, Model mo)
	{
		String nowPage=request.getParameter("nowPage");
	    String cntPerPage=request.getParameter("cntPerPage");
	    DiscService ds = sqlSession.getMapper(DiscService.class);
	    int total=ds.cntnotice();
	    if(nowPage==null && cntPerPage == null) {
	       nowPage="1";
	       cntPerPage="5";
	    }
	    else if(nowPage==null) {
	       nowPage="1";
	    }
	    else if(cntPerPage==null) {
	       cntPerPage="5";
	    }
	    	      
	    ddto=new DiscPageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	    mo.addAttribute("paging",ddto);
	    mo.addAttribute("view",ds.selectnotice(ddto));
	     
		return "disc_page";      
		
	}
	

//===========================================================================
//====회원정보보기=========================================================	
	// http://localhost:8088/test/member/info
	//@RequestMapping(value = "/main", method = RequestMethod.POST)
	//public void id_GET(HttpSession session, Model model) throws Exception{

		//세션 객체 안에 있는 ID정보 저장
		//String id = (String) session.getAttribute("id");
		//l.info("C: 회원정보보기 GET의 아이디 "+id);

		//서비스안의 회원정보보기 메서드 호출
		//MemberVO vo = service.readMember(id);

		//정보저장 후 페이지 이동
		//model.addAttribute("memVO", vo);
		//l.info("C: 회원정보보기 GET의 VO "+ vo);
	//}
}
