package com.hanul.smartfarm;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.hanul.smartfarm.common.CommonService;
import com.hanul.smartfarm.company.CompanyService;
import com.hanul.smartfarm.company.CompanyVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired private CompanyService company;
	@Autowired private CommonService common;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		CompanyVO vo=company.company_info();
		session.setAttribute("vo", vo);
		
		

		session.setAttribute("category", "ma");
		return "main";
	}

	@ResponseBody @RequestMapping("/info")
	public Object maininfo( String placeurl ) {
		StringBuffer url 
		= new StringBuffer(placeurl);
		
	return new Gson().fromJson(common.requestAPI( url.toString() )
			, new TypeToken< HashMap<String, Object> >(){}.getType() );
		
	}
	
}
