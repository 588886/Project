package com.hanul.smartfarm;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	@RequestMapping("/show")
	public String home(Locale locale, HttpServletRequest request,Model model,HttpSession session) {
		
		String adress="광주광역시 서구 경열로 3";
		
//		model.addAttribute("adress", adress);
		session.setAttribute("adress", adress);
		session.setAttribute("category", "ma");
		return "main";
	}
}
