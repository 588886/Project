package com.hanul.smartfarm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanul.smartfarm.common.CommonService;
import com.hanul.smartfarm.common.PageVO;
import com.hanul.smartfarm.program.ApplicantVO;
import com.hanul.smartfarm.program.ProgramService;
import com.hanul.smartfarm.program.ProgramVO;





@Controller
@RequestMapping("/program")
public class ProgramController {
	@Autowired private ProgramService service;
	@Autowired private CommonService common;
	
		//체험프로그램 신청 저장처리 요청
		@RequestMapping("/register") 
		public String register(ApplicantVO vo,HttpServletRequest request) {
			//화면에서 입력한 정보를 DB에 신규저장 후 목록화면으로 연결
			service.program_application(vo);
			return "redirect:list";
		}
		//공지글 새글저장처리 요청
		@ResponseBody
		@RequestMapping("/headcount") 
		public int headcount(ApplicantVO vo,HttpServletRequest request) {
			//화면에서 입력한 정보를 DB에 신규저장 후 목록화면으로 연결
			vo.setApplication_date(vo.getApplication_date());
			return service.application_headcount(vo);
			
		}
	
	
		//체험신청글 새글쓰기 화면 요청
		@RequestMapping("/apply")
		public String program(int id, Model model) {
			
			model.addAttribute("info", service.program_info(id));
			return "program/application";
		}
	
	//공지글 목록화면 요청
		@RequestMapping("/list")
		public String list(Model model, HttpSession session, PageVO page) {
			page.setPageList(5);
			session.setAttribute("category", "pr");
			model.addAttribute("page", service.program_list(page) ); //전체 목록조회
			return "program/list";
		}
}
