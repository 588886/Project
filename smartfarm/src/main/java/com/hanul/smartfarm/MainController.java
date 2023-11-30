package com.hanul.smartfarm;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main")
public class MainController {
	@RequestMapping("/show")
	public String home(Locale locale, Model model) {
		
		
		
		return "main";
	}
}
