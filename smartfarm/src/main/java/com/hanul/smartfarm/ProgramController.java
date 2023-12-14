package com.hanul.smartfarm;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanul.smartfarm.common.CommonService;
import com.hanul.smartfarm.common.PageVO;
import com.hanul.smartfarm.program.ProgramService;



@Controller
@RequestMapping("/program")
public class ProgramController {
	@Autowired private ProgramService service;
	@Autowired private CommonService common;
	
	
	//공지글 새글쓰기 화면 요청
		@RequestMapping("/apply")
		public String program() {
			return "program/application";
		}
	
	//공지글 목록화면 요청
		@RequestMapping("/list")
		public String list(Model model, HttpSession session, PageVO page) {

			session.setAttribute("category", "pr");
			model.addAttribute("list", service.program_list() ); //전체 목록조회
			return "program/list";
		}
}
