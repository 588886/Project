package com.hanul.smartfarm;

import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.hanul.smartfarm.common.CommonService;
import com.hanul.smartfarm.common.PageVO;
import com.hanul.smartfarm.member.MemberService;
import com.hanul.smartfarm.member.MemberVO;


//@RestController <= @Controller + @ResponseBody
@Controller @RequestMapping("/member")
public class MemberController {
	@Autowired private MemberService service;
	@Autowired private BCryptPasswordEncoder pwEncoder;
	@Autowired private CommonService common;
	
	
	
	//로그인화면 요청
	@RequestMapping("/login")
	public String login(HttpSession session, PageVO page, String id, String url) {
		if( url != null ) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("page", page);
			map.put("id", id);
			map.put("url", url);
			session.setAttribute("redirect", map);
		}
		
		session.setAttribute("category", "login");
		return "default/member/login";
	}
}
