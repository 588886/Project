package com.hanul.smartfarm;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {
		@RequestMapping("/about")
		public String about(Model model, HttpSession session) {
			model.addAttribute("introduction", "so");
			session.setAttribute("category", "ab");
			return "about";
		}
}
