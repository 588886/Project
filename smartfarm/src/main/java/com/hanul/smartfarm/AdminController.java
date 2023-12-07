package com.hanul.smartfarm;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.hanul.smartfarm.common.CommonService;
import com.hanul.smartfarm.company.CompanyService;
import com.hanul.smartfarm.company.CompanyVO;
import com.hanul.smartfarm.member.MemberService;
import com.hanul.smartfarm.member.MemberVO;



@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MemberService service;
	@Autowired
	private CommonService common;
	@Autowired 
	private CompanyService company;
	
	//로그인화면 요청
	@RequestMapping("/login")
	public String login(HttpSession session, String id, String url) {
		if( url != null ) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("id", id);
			map.put("url", url);
			session.setAttribute("redirect", map);
		}
		
		session.setAttribute("category", "login");
		return "/admin/login";
	}
	
	//로그인처리요청
	@RequestMapping("/smartfarmLogin")
	public String login(HttpSession session, HttpServletRequest request, HttpServletResponse response
			, RedirectAttributes redirect,MemberVO vo, Model model) {
		vo=common.loginUser(service, vo);
		boolean match = vo==null ? false : true ;
		
		
		if( match ) {
			//로그인된 경우
			session.setAttribute("loginInfo", vo); //세션에 로그인된 회원정보 담기
			//웰컴페이지로 연결
			return "main";
			
		}else {
			//로그인 안된 경우
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('아이디나 비밀번호가 일치하지 않습니다!'); location='login' ");
			msg.append("</script>");
			return msg.toString();
//		msg.append("alert('아이디나 비밀번호가 일치하지 않습니다!'); history.go(-1)");
			
		}
		
		
		
	}
	
	//세팅화면
	@RequestMapping("/setting")
	public String setting(HttpSession session) {
		CompanyVO vo=company.company_info();
		session.setAttribute("vo", vo);
		return "/admin/setting";
	}
	

	//운영자 정보 수정
	@RequestMapping("/campanyModify")
	public String campanyModify(CompanyVO vo) {
		company.company_update(vo);
		return "/";
	}
	
	//로그아웃처리 요청
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletResponse response
						, HttpServletRequest request) {
		//MemberVO login = (MemberVO) session.getAttribute("loginInfo");
		MemberVO login = common.loginInfo(session);
		
		//세션의 로그인정보 삭제
		session.removeAttribute("loginInfo");
		
		//로그인유지 쿠키 삭제
		Cookie rememberCookie = WebUtils.getCookie(request, "remember-smartfarm");
		if( rememberCookie != null ) {
			rememberCookie.setMaxAge(0);
			rememberCookie.setPath( request.getContextPath() );
			response.addCookie(rememberCookie);
			
			//DB에서 쿠키의 세션아이디인 정보 삭제
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userid", login.getUserid());
			map.put("sessionid", rememberCookie.getValue());
			service.remember_release(map);
		}
		session.setAttribute("category", "ma");
		
			return "main";
	}
	
	//운영자 추가및 수정,삭제
	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("adminList", service.admin_list());
		return "/admin/list";
	}
	
	//운영자 추가 창 이동
	@RequestMapping("/plus")
	public String plus(String userid) {
		
		return "/admin/plus";
	}
	
	//운영자 추가
	@RequestMapping("/register")
	public String register(MemberVO vo) {
		service.admin_new(vo);
		return "redirect:add";
	}
	
	//운영자 삭제 요청
	@RequestMapping("/delete")
	public String delete(String userid) {
		service.admin_delete(userid);
		
		return "redirect:add";
	}

	//운영자 정보 수정 요청
	@RequestMapping("/modify")
	public String modify(String userid,Model model) {
		MemberVO vo=service.member_info(userid);
		model.addAttribute("vo", vo);
		
		return "/admin/modify";
	}
	
	//운영자 정보 수정
	@RequestMapping("/adminmodify")
	public String adminmodify(MemberVO vo) {
		service.admin_update(vo);
		return "redirect:add";
	}
	
	//아이디 중복확인처리 요청
	@ResponseBody @RequestMapping("/useridCheck")
	public boolean useridCheck( String userid ) {
		//입력한 아이디인 회원정보가 DB에 존재하는지 확인: true(사용가능아이디), false(이미사용중아이디)
		return service.member_info( userid )==null ? true : false;
	}
}
