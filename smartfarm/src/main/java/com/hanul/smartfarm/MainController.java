package com.hanul.smartfarm;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/mainjido")
	public String home(Locale locale, Model model) {
		
		
		
		return "main";
	}
}
