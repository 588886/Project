package com.hanul.smartfarm;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hanul.smartfarm.common.CommonService;
import com.hanul.smartfarm.member.MemberService;
import com.hanul.smartfarm.member.MemberVO;





@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MemberService service;
	@Autowired
	private CommonService common;
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
	
}
