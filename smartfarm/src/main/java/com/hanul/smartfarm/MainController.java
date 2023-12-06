package com.hanul.smartfarm;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.hanul.smartfarm.common.CommonService;


@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired private CommonService common;
	
	@RequestMapping("/show")
	public String home(Locale locale, HttpServletRequest request,Model model,HttpSession session) {
		
		String adress="광주광역시 서구 경열로 3";
		
//		model.addAttribute("adress", adress);
		session.setAttribute("adress", adress);
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
